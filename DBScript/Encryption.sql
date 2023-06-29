
-- =============================   YÊU CẦU 2   =================================
 I. Tạo user NAM - thực hiện xử lý mã hóa
CREATE USER NAM IDENTIFIED BY 123456;
ALTER USER NAM
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;
ALTER USER NAM QUOTA UNLIMITED ON "USERS";

-- Cấp quyền cho user Nam
GRANT CREATE SESSION TO NAM;
GRANT CREATE VIEW TO NAM;
GRANT CREATE PUBLIC SYNONYM TO NAM;
GRANT DROP PUBLIC SYNONYM TO NAM;
GRANT CREATE PROCEDURE TO NAM;
GRANT CREATE TRIGGER TO NAM;
GRANT EXECUTE ON DBMS_CRYPTO TO NAM; -- SYS cap quyen
-- DDL
GRANT CREATE TABLE TO NAM;
GRANT ALTER ANY TABLE TO NAM;
GRANT DROP ANY TABLE TO NAM;
-- DML
GRANT SELECT, INSERT, UPDATE, DELETE ON ADMIN.NHANVIEN TO NAM;
-------------------RUN ONCE-TIME TU DAY----------------------
-- Tao package ma hoa
CREATE OR REPLACE PACKAGE CRYPT_UTIL 
AS 
        FUNCTION CRYPT (P_STR IN VARCHAR2, P_KEY IN RAW) 
        RETURN RAW; 
        FUNCTION DECRYPT (P_DATA IN RAW, P_KEY IN RAW) 
        RETURN VARCHAR2;
        FUNCTION GET_KEY
        RETURN RAW;
END CRYPT_UTIL;
/
CREATE OR REPLACE PACKAGE BODY CRYPT_UTIL
AS
        FUNCTION CRYPT (P_STR IN VARCHAR2, P_KEY IN RAW)
        RETURN RAW
        AS
                ENCRYPTED_RAW RAW(2048);
        BEGIN
                ENCRYPTED_RAW := DBMS_CRYPTO.ENCRYPT (SRC => UTL_RAW.CAST_TO_RAW(P_STR), TYP => DBMS_CRYPTO.DES_CBC_PKCS5, KEY => P_KEY);
                RETURN ENCRYPTED_RAW;
        END CRYPT;
        
        FUNCTION GET_KEY
        RETURN RAW
        AS
                L_KEYR RAW(8);
        BEGIN
                L_KEYR := DBMS_CRYPTO.RANDOMBYTES (8);    
                RETURN L_KEYR;
        END GET_KEY;
        
        FUNCTION DECRYPT (P_DATA IN RAW, P_KEY IN RAW)
        RETURN VARCHAR2
        AS
                DECRYPTED_RAW RAW(2048);
        BEGIN
                DECRYPTED_RAW := DBMS_CRYPTO.DECRYPT (SRC => P_DATA, TYP => DBMS_CRYPTO.DES_CBC_PKCS5, KEY => P_KEY);
                RETURN UTL_RAW.CAST_TO_VARCHAR2(DECRYPTED_RAW);
        END DECRYPT;
END CRYPT_UTIL;
/

-- 1. Tạo table NAM.temp đổ dữ liệu từ admin.nhavien qua lưu tạm -- Làm xong xóa bảng NAM.TEMP
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE TEMP CASCADE CONSTRAINT';
EXCEPTION
    WHEN OTHERS THEN 
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/
CREATE TABLE NAM.TEMP
AS SELECT * FROM ADMIN.NHANVIEN;
-- 2. Xóa hết dữ liệu bên admin.nhanvien
TRUNCATE TABLE ADMIN.NHANVIEN;
-- Chỉnh sửa lại datatype 2 thuộc tính của admin.nhanvien;
-- Luong, phucap từ NUMBER => VARCHAR2(30)
ALTER TABLE ADMIN.NHANVIEN MODIFY (LUONG VARCHAR2(30),PHUCAP VARCHAR2(30));
-- 3. Tạo bảng lưu khóa nam.quocgia và sinh key
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE QUOCGIA CASCADE CONSTRAINT';
EXCEPTION
    WHEN OTHERS THEN 
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/
CREATE TABLE QUOCGIA (
        MANV VARCHAR2(7) NOT NULL,
        MAQUOCGIA RAW(8),
        CONSTRAINT PK_QUOCGIA PRIMARY KEY(MANV)
);
/
-- Sinh khóa
DECLARE
        CURSOR CUR IS SELECT MANV FROM NAM.TEMP;
        KEY_RAW RAW(8);
        MANV NAM.TEMP.MANV%TYPE;
BEGIN
        OPEN CUR;
        LOOP
                FETCH CUR INTO MANV;
                EXIT WHEN CUR%NOTFOUND;
                KEY_RAW := CRYPT_UTIL.GET_KEY();
                
                INSERT INTO QUOCGIA VALUES (MANV, KEY_RAW);
        END LOOP;
        CLOSE CUR;
END;
/
-- 3. Tiến hành mã hóa dữ liệu
-- BẢNG DỮ LIỆU MÃ HÓA BÊN (NAM)
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE NHANVIEN CASCADE CONSTRAINT';
EXCEPTION
    WHEN OTHERS THEN 
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/
CREATE TABLE NHANVIEN (
        MANV VARCHAR2(7) NOT NULL,
        TENNV VARCHAR2(30),
        PHAI VARCHAR2(3), 
        NGAYSINH DATE, 
        DIACHI VARCHAR(30),
        SODT VARCHAR2(10),
        LUONG VARCHAR2(30), 
        PHUCAP VARCHAR2(30), 
        VAITRO VARCHAR2(15) NOT NULL,
        MANQL VARCHAR2(7),
        PHG NUMBER(4),
        CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV)
);
/
-- INSERT DU LIEU MA HOA
INSERT INTO NAM.NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
SELECT
        N.MANV,
         N.TENNV,
         N.PHAI,
         N.NGAYSINH,
         N.DIACHI,
         N.SODT,
         CAST( CRYPT_UTIL.CRYPT(N.LUONG, UTL_RAW.BIT_XOR (Q.MAQUOCGIA, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM N.NGAYSINH) )))) AS VARCHAR2(30) ),
         CAST( CRYPT_UTIL.CRYPT(N.PHUCAP, UTL_RAW.BIT_XOR (Q.MAQUOCGIA, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM N.NGAYSINH) )))) AS VARCHAR2(30) ),
         N.VAITRO,
         N.MANQL,
         N.PHG
FROM NAM.TEMP N, NAM.QUOCGIA Q
WHERE N.MANV = Q.MANV;

-- BẢNG MÃ HÓA BÊN (ADMIN)
-- Đổ "Cyphertext" vào table ADMIN.NHANVIEN
INSERT INTO ADMIN.NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
SELECT * FROM NAM.NHANVIEN;

-- 4. Tạo VIEW giải mã  
-- NAM giữ những VIEW giải mã 
-- ADMIN lấy những view cần thiết bên NAM cấp cho user
-- View này dùng cho TAICHINH thực thi (Select, Insert,Delete,Update) => cài trigger và BANGD Select
CREATE OR REPLACE VIEW NAM.V_NHANVIEN
AS 
SELECT
        N.MANV, N.TENNV,  N.PHAI, N.NGAYSINH, N.DIACHI, N.SODT,
         CAST( CRYPT_UTIL.DECRYPT(N.LUONG, UTL_RAW.BIT_XOR (Q.MAQUOCGIA, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM N.NGAYSINH) )))) AS VARCHAR2(30) ) "LUONG",
         CAST( CRYPT_UTIL.DECRYPT(N.PHUCAP, UTL_RAW.BIT_XOR (Q.MAQUOCGIA, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM N.NGAYSINH) )))) AS VARCHAR2(30) ) "PHUCAP",
         N.VAITRO, N.MANQL, N.PHG
FROM NAM.NHANVIEN N, NAM.QUOCGIA Q
WHERE N.MANV = Q.MANV;
/
-- **** NAM.V_OWN_NHANVIEN (nam.nhanvien + nam.quocgia) **** View in ra một dòng chính nó với Luong, PhuCap (plaintext) -- 
-- Admin cấp view này cho tất cả nhân viên view này
CREATE OR REPLACE VIEW V_OWN_NHANVIEN
AS 
SELECT
        N.MANV, N.TENNV, N.PHAI, N.NGAYSINH, N.DIACHI, N.SODT,
         CAST( CRYPT_UTIL.DECRYPT(N.LUONG, UTL_RAW.BIT_XOR (Q.MAQUOCGIA, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM N.NGAYSINH) )))) AS VARCHAR2(30) ) "LUONG",
         CAST( CRYPT_UTIL.DECRYPT(N.PHUCAP, UTL_RAW.BIT_XOR (Q.MAQUOCGIA, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM N.NGAYSINH) )))) AS VARCHAR2(30) ) "PHUCAP",
         N.VAITRO, N.MANQL, N.PHG
FROM NAM.NHANVIEN N, NAM.QUOCGIA Q
WHERE N.MANV = Q.MANV AND N.MANV = USER;
/
-- Yêu cầu 1: Tất cả nhân viên được phép cập nhật (ngaysinh, diachi, sodt) của chính mình 
-- Do chỉ có quyền update nên chỉ viết trigger update
CREATE OR REPLACE TRIGGER TRG_UPDATE_V_OWNNHANVIEN
INSTEAD OF UPDATE
ON V_OWN_NHANVIEN
FOR EACH ROW
DECLARE
        L_KEY RAW(8);
        L_KEY_XOR RAW(8);
        L_LUONG VARCHAR2(30);
        L_PHUCAP VARCHAR2(30);
BEGIN        
        -- Cập nhật ngày sinh
        -- B1: Lấy key ra
        SELECT MAQUOCGIA INTO L_KEY  FROM NAM.QUOCGIA WHERE MANV = :OLD.MANV;
        -- B2: Tính key xor cũ <=> (ngày sinh cũ + key cũ)
        L_KEY_XOR := UTL_RAW.BIT_XOR (L_KEY, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM :OLD.NGAYSINH ))));
        L_LUONG := CRYPT_UTIL.CRYPT(:OLD.LUONG, L_KEY_XOR);
        L_PHUCAP := CRYPT_UTIL.CRYPT(:OLD.PHUCAP, L_KEY_XOR);
        IF (:NEW.NGAYSINH != :OLD.NGAYSINH) THEN
                -- B3: Tính key_xor mới (key_old xor ngaysinh mới)
                L_KEY_XOR := UTL_RAW.BIT_XOR (L_KEY, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM :NEW.NGAYSINH) )));
                -- B4: Mã lương, phụ cấp ra chuỗi mới với l_key_xor mới - NEW
                L_LUONG := CRYPT_UTIL.CRYPT(:OLD.LUONG, L_KEY_XOR);
                L_PHUCAP := CRYPT_UTIL.CRYPT(:OLD.PHUCAP, L_KEY_XOR);
        END IF;
        -- B5: Cập nhật lương phụ cấp
        -- Nam
        UPDATE NAM.NHANVIEN
        SET
                NGAYSINH = :NEW.NGAYSINH,
                DIACHI = :NEW.DIACHI,
                SODT = :NEW.SODT,
                LUONG = L_LUONG,
                PHUCAP = L_PHUCAP
        WHERE MANV = :OLD.MANV;
        -- Admin
        UPDATE ADMIN.NHANVIEN
        SET
                NGAYSINH = :NEW.NGAYSINH,
                DIACHI = :NEW.DIACHI,
                SODT = :NEW.SODT,
                LUONG = L_LUONG,
                PHUCAP = L_PHUCAP
        WHERE MANV = :OLD.MANV;  
END;
/
-- Yêu cầu 1: Tài chính được phép cập nhật (Luong, Phucap) toan bo nhan vien
-- Do chỉ có quyền update nên chỉ viết trigger update
CREATE OR REPLACE TRIGGER TRG_UPDATE_V_NHANVIEN
INSTEAD OF UPDATE
ON NAM.V_NHANVIEN
FOR EACH ROW
DECLARE
        L_KEY RAW(8);
        L_KEY_XOR RAW(8);
        L_LUONG VARCHAR2(30);
        L_PHUCAP VARCHAR2(30);
BEGIN
        IF (:NEW.LUONG != :OLD.LUONG OR :OLD.LUONG IS NULL) THEN
                SELECT MAQUOCGIA INTO L_KEY  FROM NAM.QUOCGIA WHERE MANV = :OLD.MANV;
                L_KEY_XOR := UTL_RAW.BIT_XOR (L_KEY, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM :OLD.NGAYSINH ))));
                L_LUONG := CRYPT_UTIL.CRYPT(:NEW.LUONG, L_KEY_XOR);              
                -- Nam
                UPDATE NAM.NHANVIEN
                SET LUONG = L_LUONG
                WHERE MANV = :OLD.MANV;
                -- Admin
                UPDATE ADMIN.NHANVIEN
                SET LUONG = L_LUONG
                WHERE MANV = :OLD.MANV;
        END IF;
        IF (:NEW.PHUCAP != :OLD.PHUCAP OR :OLD.PHUCAP IS NULL) THEN
                SELECT MAQUOCGIA INTO L_KEY  FROM NAM.QUOCGIA WHERE MANV = :OLD.MANV;
                L_KEY_XOR := UTL_RAW.BIT_XOR (L_KEY, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM :OLD.NGAYSINH ))));
                L_PHUCAP := CRYPT_UTIL.CRYPT(:NEW.PHUCAP, L_KEY_XOR);
                -- Nam
                UPDATE NAM.NHANVIEN
                SET PHUCAP = L_PHUCAP
                WHERE MANV = :OLD.MANV;
                -- Admin
                UPDATE ADMIN.NHANVIEN
                SET PHUCAP = L_PHUCAP
                WHERE MANV = :OLD.MANV;        
        END IF;
END;
/
-- Nam thực hiện tạo lại constraint trên bảng admin.nhanvien trên schema ADMIN
ALTER TABLE ADMIN.NHANVIEN
    ADD CONSTRAINT NHANVIEN_FK_NQL FOREIGN KEY (MANQL) REFERENCES ADMIN.NHANVIEN(MANV);
/
ALTER TABLE ADMIN.PHONGBAN
    ADD CONSTRAINT PHONGBAN_FK_TRPHG FOREIGN KEY (TRPHG) REFERENCES ADMIN.NHANVIEN(MANV);
/   
ALTER TABLE ADMIN.PHANCONG
    ADD CONSTRAINT PHANCONG_FK_NV FOREIGN KEY (MANV) REFERENCES ADMIN.NHANVIEN(MANV);
/
-- Thay khóa đồng loạt sau một thời gian - Chiến lược 3-6 tháng thay khóa một lần
CREATE OR REPLACE PACKAGE CRYPT_MANAGE_KEY
AS
        PROCEDURE SINHKHOA;
        PROCEDURE THAYKHOA;
END;
/
CREATE OR REPLACE PACKAGE BODY CRYPT_MANAGE_KEY
AS        
        PROCEDURE SINHKHOA
        AS
                CURSOR CUR IS SELECT MANV FROM NAM.TEMP;
                KEY_RAW RAW(8);
                MANV NAM.TEMP.MANV%TYPE;
        BEGIN
                OPEN CUR;
                LOOP
                        FETCH CUR INTO MANV;
                        EXIT WHEN CUR%NOTFOUND;
                        KEY_RAW := CRYPT_UTIL.GET_KEY();
                
                        INSERT INTO QUOCGIA VALUES (MANV, KEY_RAW);
                END LOOP;
                CLOSE CUR;
        END;
        
        PROCEDURE THAYKHOA
        AS
                CURSOR CUR IS SELECT MANV, NGAYSINH, LUONG, PHUCAP FROM NAM.NHANVIEN;
                KEY_RAW RAW(8);
                L_KEY RAW(8);
                L_KEY_XOR RAW(8);
                L_MANV NAM.NHANVIEN.MANV%TYPE;
                L_NGAYSINH NAM.NHANVIEN.NGAYSINH%TYPE;
                L_LUONG NAM.NHANVIEN.LUONG%TYPE;
                L_PHUCAP NAM.NHANVIEN.PHUCAP%TYPE;
        BEGIN
                OPEN CUR;
                LOOP
                        FETCH CUR INTO L_MANV, L_NGAYSINH, L_LUONG, L_PHUCAP;
                        EXIT WHEN CUR%NOTFOUND;
                        -- B1: Lấy key cũ 
                        SELECT MAQUOCGIA INTO L_KEY FROM NAM.QUOCGIA WHERE MANV = L_MANV;
                        -- B2: Tính key xor
                        L_KEY_XOR := UTL_RAW.BIT_XOR ( L_KEY, UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM L_NGAYSINH ))));
                        -- B3: Giải mã - Output Plaintext
                        L_LUONG := CRYPT_UTIL.DECRYPT(L_LUONG, L_KEY_XOR);
                        L_PHUCAP := CRYPT_UTIL.DECRYPT(L_PHUCAP, L_KEY_XOR);
                        --B4: Sinh key mới à tính key_xor mới
                        KEY_RAW := CRYPT_UTIL.GET_KEY();
                        L_KEY_XOR := UTL_RAW.BIT_XOR ( KEY_RAW,UTL_RAW.CAST_TO_RAW(TO_CHAR(EXTRACT(DAY FROM L_NGAYSINH ))));
                        -- B5: Mã lương và phụ cấp - Output Cypher text
                        L_LUONG := CRYPT_UTIL.CRYPT(L_LUONG, L_KEY_XOR);
                        L_PHUCAP := CRYPT_UTIL.CRYPT(L_PHUCAP, L_KEY_XOR);
                        -- B5: Lưu key mới, Lương và phụ cấp mã mới
                        -- Nam
                        UPDATE NAM.QUOCGIA 
                        SET MAQUOCGIA = KEY_RAW WHERE MANV = L_MANV;                       
                       -- Nam
                        UPDATE NAM.NHANVIEN
                        SET
                                LUONG = L_LUONG,
                                PHUCAP = L_PHUCAP
                        WHERE MANV = L_MANV;
                        -- Admin
                        UPDATE ADMIN.NHANVIEN
                        SET
                                LUONG = L_LUONG,
                                PHUCAP = L_PHUCAP
                        WHERE MANV = L_MANV;
                END LOOP;
                CLOSE CUR;
        END;
END CRYPT_MANAGE_KEY;
/
-- Tạo job 6 tháng chạy một lần