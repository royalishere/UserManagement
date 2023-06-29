-- CONTEXT APPLICATION
CREATE OR REPLACE CONTEXT CTX_NHANVIEN USING PKG_NHANVIEN;
/
CREATE OR REPLACE PACKAGE PKG_NHANVIEN
AS
        PROCEDURE CONN_COUNT; -- KIEM TRA SO LUONG DANG NHAP
        PROCEDURE SET_ROLE;  -- CHO BIET VAI TRO KHI DANG NHAP
        PROCEDURE SET_DEPTNO;
        PROCEDURE CLEAR_DEPTNO;
END PKG_NHANVIEN;
/
CREATE OR REPLACE PACKAGE BODY PKG_NHANVIEN
AS
        PROCEDURE CONN_COUNT AS
            C_COUNT NUMBER;
        BEGIN
            SELECT COUNT(*) INTO C_COUNT FROM V$SESSION WHERE USERNAME = USER AND PROGRAM NOT LIKE '%SQL Developer%';
            DBMS_SESSION.SET_CONTEXT(NAMESPACE => 'ctx_nhanvien', ATTRIBUTE => 'con_count', VALUE => C_COUNT);
        END;
        ------
        PROCEDURE SET_ROLE
        AS
            U_ROLE VARCHAR2(20);
        BEGIN
        SELECT VAITRO INTO U_ROLE FROM ADMIN.NHANVIEN WHERE MANV = USER;
        DBMS_SESSION.SET_CONTEXT(NAMESPACE => 'ctx_nhanvien', ATTRIBUTE => 'role', VALUE => U_ROLE);
        EXCEPTION WHEN NO_DATA_FOUND THEN
            BEGIN
                DBMS_SESSION.SET_CONTEXT(NAMESPACE => 'ctx_nhanvien',ATTRIBUTE => 'phg', VALUE => NULL);
            END;
        END;
        ------
        PROCEDURE SET_DEPTNO
        AS
                L_DEPTNO NUMBER;
        BEGIN
                SELECT PHG INTO L_DEPTNO FROM ADMIN.NHANVIEN WHERE MANV = USER;
                DBMS_SESSION.SET_CONTEXT(NAMESPACE => 'ctx_nhanvien',
                                                                ATTRIBUTE => 'phg',
                                                                VALUE => L_DEPTNO);
        EXCEPTION WHEN NO_DATA_FOUND THEN
            BEGIN
                DBMS_SESSION.SET_CONTEXT(NAMESPACE => 'ctx_nhanvien',
                                                                ATTRIBUTE => 'phg',
                                                                VALUE => NULL);
            END;
        END SET_DEPTNO;
        ------
        PROCEDURE CLEAR_DEPTNO
        AS
        BEGIN
                DBMS_SESSION.CLEAR_CONTEXT(NAMESPACE => 'ctx_nhanvien', ATTRIBUTE => 'phg');
        END CLEAR_DEPTNO;
END PKG_NHANVIEN;
/

CREATE OR REPLACE TRIGGER TRG_NHANVIEN_PHG
AFTER LOGON ON DATABASE
BEGIN
        PKG_NHANVIEN.CONN_COUNT;
        PKG_NHANVIEN.SET_DEPTNO;
        PKG_NHANVIEN.SET_ROLE;
END;
/
-- ===========================   YÊU CẦU 1 + 2   =================================
-- Chính sách1: Mỗi nhân viên select chính nó với LUONG, PHUCAP (Plaintext)
 -- Cấp view nam.v_own_nhanvien cho mọi người 
 -- Select, Update (ngaysinh, diachi, sodt)
 -- VIEW DA CHINH SUA THEO DECODE
CREATE OR REPLACE VIEW V_NHANVIEN
AS SELECT MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, 
DECODE(MANV, USER, LUONG, NULL) LUONG, 
DECODE(MANV, USER, PHUCAP, NULL) PHUCAP, 
VAITRO, MANQL, PHG FROM ADMIN.NHANVIEN;
/
CREATE OR REPLACE VIEW V_NHANSU_NHANVIEN AS SELECT * FROM ADMIN.NHANVIEN;
/
-- TAO USER 
-- nhanvien
execute create_user('KERR264','123456', NULL);
-- qltructiep
exec create_user('ABE421', '123456', NULL); 
-- truongphong
exec create_user('LEIL369', '123456', NULL);
exec create_user('BARB396', '123456', NULL);
exec create_user('MAUR325', '123456', NULL);
exec create_user('GARA176', '123456', NULL);
exec create_user('ANGE326', '123456', NULL);
-- taichinh
exec create_user('TIMM362', '123456', NULL); 
-- nhansu
exec create_user('RIAN234 ', '123456', NULL); 
-- truongdean
exec create_user('BART317', '123456', NULL); 
-- bangd
exec create_user('LARI250', '123456', NULL); 
exec create_user('KAYC433', '123456', NULL); 
exec create_user('RICC407', '123456', NULL);
-- Chính sách 2: Mỗi nhân viên có thể xem dòng dữ liệu trên table hay view dựa trên vai trò của mình
CREATE OR REPLACE FUNCTION F_NHANVIEN
        (P_SCHEMA VARCHAR2,
        P_OBJECT VARCHAR2
) RETURN VARCHAR2
AS
        VT ADMIN.NHANVIEN.VAITRO%TYPE;
BEGIN
        IF USER = 'ADMIN' THEN RETURN '';
        END IF;
        SELECT VAITRO INTO VT FROM ADMIN.NHANVIEN WHERE MANV = USER;
        IF (UPPER(VT) = 'NHANVIEN' OR UPPER(VT) = 'TRUONGDEAN') THEN
                RETURN '1 != 1';
       ELSIF (UPPER(VT) = 'QLTRUCTIEP') THEN
                RETURN 'manql = user';
        ELSIF (UPPER(VT) = 'TRUONGPHONG') THEN
                RETURN 'manv != user and phg = sys_context(''ctx_nhanvien'', ''phg'')';
        ELSIF ( UPPER(VT) = 'NHANSU' OR UPPER(VT) = 'TAICHINH' OR UPPER(VT) = 'BANGD') THEN
                RETURN 'manv != user';
        END IF;
END;
/

BEGIN
    DBMS_RLS.DROP_POLICY('admin', 'v_nhanvien', 'policy_nhanvien');
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -28102 THEN
    RAISE;
    END IF;
END;
/
BEGIN
        DBMS_RLS.ADD_POLICY (
        OBJECT_SCHEMA => 'admin',
        OBJECT_NAME => 'v_nhanvien',
        POLICY_NAME => 'policy_nhanvien',
        POLICY_FUNCTION => 'f_nhanvien',
        STATEMENT_TYPES => 'select',
        SEC_RELEVANT_COLS => 'LUONG, PHUCAP');
END;
/
-- Nhân sự insert, update
-- Cài trigger cho insert, update
CREATE OR REPLACE TRIGGER TRG_NHANSU_NHANVIEN
INSTEAD OF INSERT OR UPDATE OR DELETE
ON V_NHANSU_NHANVIEN
FOR EACH ROW
DECLARE 
        L_KEY RAW(8);
        L_KEY_XOR RAW(8);
        L_LUONG VARCHAR2(30);
        L_PHUCAP VARCHAR2(30);
BEGIN
        IF (INSERTING) THEN
                -- Sinh key cho nhân viên mới
                L_KEY := NAM.CRYPT_UTIL.GET_KEY();
                INSERT INTO NAM.QUOCGIA (MANV, MAQUOCGIA) VALUES (:NEW.MANV, L_KEY);
                -- Nam
                INSERT INTO NAM.NHANVIEN
                VALUES (:NEW.MANV, :NEW.TENNV, :NEW.PHAI, :NEW.NGAYSINH, :NEW.DIACHI, :NEW.SODT, NULL, NULL, :NEW.VAITRO, :NEW.MANQL, :NEW.PHG);
                -- Admin                        
                INSERT INTO ADMIN.NHANVIEN
                VALUES (:NEW.MANV, :NEW.TENNV, :NEW.PHAI, :NEW.NGAYSINH, :NEW.DIACHI, :NEW.SODT, NULL, NULL, :NEW.VAITRO, :NEW.MANQL, :NEW.PHG);   
        END IF;
        
        IF (UPDATING) THEN
                -- B1: Lấy key ra
                SELECT MAQUOCGIA INTO L_KEY  FROM NAM.QUOCGIA WHERE MANV = :OLD.MANV;
                -- B2: Tính key xor cũ <=> (ngày sinh cũ + key cũ)
                L_KEY_XOR := UTL_RAW.BIT_XOR (L_KEY, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM :OLD.NGAYSINH ))));
                -- B3: Giải mã Luong, phucap. Vì view admin.v_nhansu_nhanvien là Cyphertext
                L_LUONG := :OLD.LUONG;
                L_PHUCAP := :OLD.PHUCAP;
                -- Cập nhật ngày sinh
                IF (:NEW.NGAYSINH != :OLD.NGAYSINH) THEN
                        L_LUONG := NAM.CRYPT_UTIL.DECRYPT(L_LUONG, L_KEY_XOR);
                        L_PHUCAP := NAM.CRYPT_UTIL.DECRYPT(L_PHUCAP, L_KEY_XOR);   
                        -- B4: Tính key_xor mới (key_old xor ngaysinh mới)
                        L_KEY_XOR := UTL_RAW.BIT_XOR (L_KEY, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM :NEW.NGAYSINH) )));                
                        -- B5: Mã lương, phụ cấp ra chuỗi mới với l_key_xor mới - NEW
                        L_LUONG := NAM.CRYPT_UTIL.CRYPT(L_LUONG, L_KEY_XOR);
                        L_PHUCAP := NAM.CRYPT_UTIL.CRYPT(L_PHUCAP, L_KEY_XOR);    
                END IF;
                -- Nam
                UPDATE NAM.NHANVIEN
                SET
                        LUONG = L_LUONG,
                        PHUCAP = L_PHUCAP,
                        NGAYSINH = :NEW.NGAYSINH,
                        PHAI = :NEW.PHAI,
                        DIACHI = :NEW.DIACHI,
                        SODT = :NEW.SODT,    
                        TENNV = :NEW.TENNV,
                        VAITRO = :NEW.VAITRO,
                        MANQL = :NEW.MANQL,
                        PHG = :NEW.PHG
                WHERE MANV = :OLD.MANV;
                -- Admin
                UPDATE ADMIN.NHANVIEN
                SET
                        LUONG = L_LUONG,
                        PHUCAP = L_PHUCAP,
                        NGAYSINH = :NEW.NGAYSINH,
                        PHAI = :NEW.PHAI,
                        DIACHI = :NEW.DIACHI,
                        SODT = :NEW.SODT,
                        TENNV = :NEW.TENNV,
                        VAITRO = :NEW.VAITRO,
                        MANQL = :NEW.MANQL,
                        PHG = :NEW.PHG
                WHERE MANV = :OLD.MANV;  
        END IF;
        
        IF(DELETING) THEN
            DELETE FROM NAM.NHANVIEN WHERE MANV = :OLD.MANV;
            DELETE FROM ADMIN.NHANVIEN WHERE MANV = :OLD.MANV;
            DELETE FROM NAM.QUOCGIA WHERE MANV = :OLD.MANV;
        END IF;
END;
/
-- VPD PHAN CONG
CREATE OR REPLACE FUNCTION F_PHANCONG
        (P_SCHEMA VARCHAR2,
        P_OBJECT VARCHAR2
) RETURN VARCHAR2
AS
        VT ADMIN.NHANVIEN.VAITRO%TYPE;
BEGIN
        IF USER = 'ADMIN' THEN RETURN '';
        END IF;
        SELECT VAITRO INTO VT FROM ADMIN.NHANVIEN WHERE MANV = USER; 
        IF (UPPER(VT) = 'NHANVIEN' OR UPPER(VT) = 'NHANSU' OR UPPER(VT) = 'TRUONGDEAN') THEN
                RETURN 'manv = user';
        ELSIF (UPPER(VT) = 'QLTRUCTIEP') THEN
                RETURN 'manv = user or manv in (select manv from admin.nhanvien where manql = user)';
        ELSIF (UPPER(VT) = 'TRUONGPHONG') THEN
                RETURN 'manv in (select manv from admin.v_nhanvien where phg = sys_context(''ctx_nhanvien'', ''phg''))';
        ELSIF (UPPER(VT) = 'TAICHINH' OR UPPER(VT) = 'BANGD') THEN
                RETURN '';
        END IF;
END;
/
BEGIN
    DBMS_RLS.DROP_POLICY('admin', 'phancong', 'policy_phancong');
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -28102 THEN
    RAISE;
    END IF;
END;
/
BEGIN
        DBMS_RLS.ADD_POLICY(
        OBJECT_SCHEMA => 'admin',
        OBJECT_NAME => 'phancong',
        POLICY_NAME => 'policy_phancong',
        POLICY_FUNCTION => 'f_phancong',
        STATEMENT_TYPES => 'select');
END;
/
-- Trưởng phòng có thể I,D,U phân công của những nhân viê mà nó làm trưởng phòng
CREATE OR REPLACE FUNCTION F_PHANCONG1
        (P_SCHEMA VARCHAR2,
        P_OBJECT VARCHAR2
) RETURN VARCHAR2
AS
        VT ADMIN.NHANVIEN.VAITRO%TYPE;
BEGIN
        IF USER = 'ADMIN' THEN RETURN '';
        END IF;

        SELECT VAITRO INTO VT FROM ADMIN.NHANVIEN WHERE MANV = USER;
        IF (UPPER(VT) = 'TRUONGPHONG') THEN
                RETURN 'manv in (select manv from admin.v_nhanvien where phg = sys_context(''ctx_nhanvien'', ''phg''))';
        END IF;
END;
/
BEGIN
    DBMS_RLS.DROP_POLICY('admin', 'phancong', 'policy_phancong1');
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -28102 THEN
    RAISE;
    END IF;
END;
/
BEGIN
        DBMS_RLS.ADD_POLICY(
        OBJECT_SCHEMA => 'admin',
        OBJECT_NAME => 'phancong',
        POLICY_NAME => 'policy_phancong1',
        POLICY_FUNCTION => 'f_phancong1',
        STATEMENT_TYPES => 'INSERT, DELETE, UPDATE',
        UPDATE_CHECK => TRUE);
END;
/ 