
-- CREATE USER
CREATE OR REPLACE PROCEDURE SP_CREATE_USER
AS
        CURSOR CUR IS (SELECT manv 
                    FROM admin.nhanvien
                    WHERE manv NOT IN (SELECT USERNAME 
                                        FROM ALL_USERS));
        strSQL VARCHAR2(200);
        usr VARCHAR2(200);
BEGIN
        OPEN CUR;
        LOOP
                FETCH CUR INTO usr;
                EXIT WHEN CUR%NOTFOUND;
        
                strSQL := 'CREATE USER '|| usr || ' IDENTIFIED BY ' || '123456';
--                strSQL := 'CREATE USER '|| usr || ' IDENTIFIED BY ' || '123456 PASSWORD EXPIRE';

                EXECUTE IMMEDIATE (strSQL);
        
                strSQL := 'GRANT CREATE SESSION TO '|| usr;
                EXECUTE IMMEDIATE (strSQL);
        END LOOP;
        CLOSE CUR;
END;
/
EXEC SP_CREATE_USER;

CREATE OR REPLACE PROCEDURE SP_DROP_USER
AS
        CURSOR CUR IS (SELECT manv 
                    FROM admin.nhanvien
                    WHERE manv IN (SELECT USERNAME 
                                        FROM ALL_USERS));
        strSQL VARCHAR2(200);
        usr VARCHAR2(200);
BEGIN
        OPEN CUR;
        LOOP
                FETCH CUR INTO usr;
                strSQL := 'DROP USER ' || usr;
--             strSQL := 'CREATE USER '|| usr || ' IDENTIFIED BY ' || '123456 PASSWORD EXPIRE';

                EXECUTE IMMEDIATE (strSQL);
        END LOOP;
        CLOSE CUR;
END;
/
EXEC SP_DROP_USER;
-- *************************************************
-- CS#1 STAFF 
-- * TABLE NHANVIEN
-- select all columns of yourself
-- update (ngaysinh, diachi, sodt)

CREATE OR REPLACE VIEW v_staff_nhanvien
AS SELECT * FROM admin.nhanvien;

GRANT SELECT ON v_staff_nhanvien TO PREN50;
GRANT UPDATE (NGAYSINH, DIACHI, SODT) ON v_staff_nhanvien TO PREN50;

-- FUNTIONN **
CREATE OR REPLACE FUNCTION f_staff_nv (
        p_schema VARCHAR2,
        p_object VARCHAR2
) RETURN VARCHAR2
AS
BEGIN
        RETURN 'MANV = USER';
END;
/
-- ADD POLICY **
       DBMS_RLS.ADD_POLICY (
        object_schema => 'admin',
        object_name => 'v_staff_nhanvien',
        policy_name => 'policy_staff_select_nv',
        policy_function => 'f_staff_nv'
        );
END;
/BEGIN
 
-- SELECT - VPD
CONNECT PREN50/123456
SELECT * FROM admin.v_staff_nhanvien;
-- UPDATE - KIEU DANG THEO HUONG DAC HAY RBAC
CONNECT PREN50/123456
UPDATE  admin.v_staff_nhanvien SET ngaysinh = '11/APR/1995' where manv = 'PREN50';

-- * PHANCONG
-- select nhung phan cong ma duoc phan cong
CREATE OR REPLACE VIEW v_staff_phancong
AS SELECT * FROM admin.phancong;

GRANT SELECT ON v_staff_phancong TO PREN50;

BEGIN
        DBMS_RLS.ADD_POLICY (
        object_schema => 'admin',
        object_name => 'v_staff_phancong',
        policy_name => 'policy_staff_select_pb',
        policy_function => 'f_staff_nv');
END;
/
CONNECT PREN50/123456
select * from admin.v_staff_phancong where manv = 'PREN50';

-- * PHONGBAN & DEAN
GRANT SELECT ON PHONGBAN TO PREN50;
GRANT SELECT ON DEAN TO PREN50;

CONNECT PREN50/123456
SELECT * FROM admin.phongban;

CONNECT PREN50/123456
SELECT * FROM admin.dean;

-- *************************************************
-- CS#2 SUPERVISOR
CREATE OR REPLACE VIEW v_supervisor_nhanvien
AS 
SELECT * FROM admin.nhanvien WHERE manql = USER OR manv = USER;


GRANT SELECT ON v_staff_nhanvien TO GLYN43; -- để tái sử dụng update như staff bình thường
GRANT UPDATE (NGAYSINH, DIACHI, SODT) ON v_staff_nhanvien TO GLYN43;

GRANT SELECT ON v_staff_nhanvien TO RHOD73;
GRANT UPDATE (NGAYSINH, DIACHI, SODT) ON v_staff_nhanvien TO RHOD73;

GRANT SELECT ON v_supervisor_nhanvien TO GLYN43; 
GRANT SELECT ON v_supervisor_nhanvien TO RHOD73;

--** NHANVIEN **
CREATE OR REPLACE FUNCTION f_supervisor_nv
        (p_schema VARCHAR2,
        p_object VARCHAR2
) RETURN VARCHAR2
AS
        vt admin.nhanvien.vaitro%type;
BEGIN
        SELECT vaitro INTO vt FROM admin.nhanvien WHERE MANV = USER;
        IF (vt = 'SUPERVISOR') THEN
                RETURN 'MANV = USER';
        END IF;
END;
/
BEGIN
        DBMS_RLS.ADD_POLICY(
        object_schema => 'admin',
        object_name => 'v_supervisor_nhanvien',
        policy_name => 'policy_supervisor_nv',
        policy_function => 'f_supervisor_nv',
        sec_relevant_cols => 'LUONG, PHUCAP',
        sec_relevant_cols_opt => dbms_rls.all_rows
        );
END;
/
CONNECT GLYN43/123456
SELECT * FROM admin.v_supervisor_nhanvien;

CONNECT RHOD73/123456
SELECT * FROM admin.v_supervisor_nhanvien;

--exec dbms_rls.drop_policy(object_name => 'v_supervisor_nhanvien', policy_name => 'policy_supervisor_nv');

-- Tái sử dụng lại update bên staff
CONNECT RHOD73/123456
--update admin.v_staff_nhanvien set ngaysinh = '08/JUL/1999' where manv = 'RHOD73';
update admin.v_staff_nhanvien set tennv = 'ABC' where manv = 'RHOD73';

select  * from nhanv
--** PHAN CONG **
-- Xem phân công của những NV mà nó quản lý + chính nó
CREATE OR REPLACE VIEW v_supervisor_phancong
AS
SELECT pc.*
FROM admin.phancong pc, admin.nhanvien nv
WHERE (nv.manql = USER OR nv.manv = USER) AND nv.manv = pc.manv;

GRANT SELECT ON v_supervisor_phancong TO GLYN43;
GRANT SELECT ON v_supervisor_phancong TO RHOD73;

CONNECT GLYN43/123456  
SELECT * FROM admin.v_supervisor_phancong;

CONNECT RHOD73/123456
SELECT * FROM admin.v_supervisor_phancong;

--** PHONG BAN **
GRANT SELECT ON admin.phongban TO GLYN43;
GRANT SELECT ON admin.phongban TO RHOD73;

--** DE AN **
GRANT SELECT ON admin.dean TO GLYN43;
GRANT SELECT ON admin.dean TO RHOD73;

-- *************************************************
-- CS#3 MANAGER
-- KARO18
-- SHAY25
select * from nhanvien;
--** NHAN VIEN **
-- Có thể sửa NGAYSINH, DIACHI, SODT - Tái sử dụng staff
GRANT SELECT ON v_staff_nhanvien TO KARO18;
GRANT UPDATE (NGAYSINH, DIACHI, SODT) ON v_staff_nhanvien TO KARO18;
GRANT SELECT ON v_staff_nhanvien TO SHAY25;
GRANT UPDATE (NGAYSINH, DIACHI, SODT) ON v_staff_nhanvien TO SHAY25;

CONNECT KARO18/123456
select * from admin.v_staff_nhanvien;
--update admin.v_staff_nhanvien set tennv = 'ABC' where manv = USER;
--update admin.v_staff_nhanvien set ngaysinh = '03/SEP/1995' where manv = user;

CONNECT SHAY25/123456
select * from admin.v_staff_nhanvien;

-- Huong sys_context *
create or replace context ctx_nhanvien using pkg_nhanvien;

create or replace package pkg_nhanvien
as
        procedure set_deptno;
        procedure clear_deptno;
end pkg_nhanvien;

CREATE OR REPLACE PACKAGE BODY pkg_nhanvien
AS
        PROCEDURE set_deptno
        AS
                l_deptno NUMBER;
        BEGIN
                SELECT phg INTO l_deptno FROM admin.nhanvien
                WHERE manv = USER;
    
                DBMS_SESSION.SET_CONTEXT(NAMESPACE => 'ctx_nhanvien',
                                                                ATTRIBUTE => 'phg',
                                                                VALUE => l_deptno);
        END set_deptno;

        PROCEDURE clear_deptno
        AS
        BEGIN
                DBMS_SESSION.CLEAR_CONTEXT(NAMESPACE => 'ctx_nhanvien',
                                                                        ATTRIBUTE => 'phg');
        END clear_deptno;
END pkg_nhanvien;

CREATE OR REPLACE TRIGGER trg_nhanvien_phg
AFTER LOGON ON DATABASE
BEGIN
        pkg_nhanvien.set_deptno;
END;
/

CONNECT SHAY25/123456
SELECT SYS_CONTEXT('ctx_nhanvien', 'phg') from dual;

-- Select chính nó và những nhân viên thuộc phòng ban mà nó quản lý
create or replace view v_manager_nhanvien
as 
select *
from admin.nhanvien nv
where (nv.manv = USER  and nv.vaitro = 'MANAGER') or nv.phg = sys_context('ctx_nhanvien', 'phg');

SELECT * FROM NHANVIEN WHERE PHG = 105;

GRANT SELECT ON v_manager_nhanvien TO KARO18;
GRANT SELECT ON v_manager_nhanvien TO SHAY25;

create or replace function f_manager_nhanvien
        (p_schema VARCHAR2,
        p_object VARCHAR2
) RETURN VARCHAR2
AS
BEGIN
        RETURN 'manv = USER';
END;
/
BEGIN
        DBMS_RLS.ADD_POLICY(
        object_schema => 'admin',
        object_name => 'v_manager_nhanvien',
        policy_name => 'policy_manager_nhanvien',
        policy_function => 'f_manager_nhanvien',
        sec_relevant_cols => 'LUONG, PHUCAP',
        sec_relevant_cols_opt => dbms_rls.all_rows
        );
END;
/

EXEC DBMS_RLS.DROP_POLICY (OBJECT_NAME => 'V_MANAGER_NHANVIEN', POLICY_NAME => 'POLICY_MANAGER_NHANVIEN');

CONNECT KARO18/123456
SELECT * FROM admin.v_manager_nhanvien;

CONNECT SHAY25/123456
SELECT * FROM admin.v_manager_nhanvien;

--** PHAN CONG **
-- S, I, U, D nhung NV thuoc phong ban no lam truong
CREATE OR REPLACE VIEW v_manager_phancong
AS
SELECT pc.*
FROM admin.phancong pc, admin.nhanvien nv
where nv.phg= sys_context('ctx_nhanvien','phg') and nv.manv = pc.manv;

CREATE OR REPLACE FUNCTION f_manager_phancong 
        (p_schema VARCHAR2,
        p_object VARCHAR2
) RETURN VARCHAR2
AS
        vt admin.nhanvien.vaitro%type;
BEGIN
        select vaitro into vt from admin.nhanvien where manv = USER;
        
        IF (vt = 'MANAGER') THEN
                RETURN '';               
        END IF;
END;

BEGIN
        DBMS_RLS.ADD_POLICY (
        object_schema => 'admin',
        object_name => 'v_manager_phancong',
        policy_name => 'policy_manager_phancong',
        policy_function => 'f_manager_phancong',
        statement_types => 'select, insert, update, delete',
        update_check => TRUE);
END;

GRANT SELECT ON v_manager_phancong TO SHAY25;
GRANT SELECT ON v_manager_phancong TO KARO18;

CONNECT SHAY25/123456
SELECT * FROM admin.v_manager_phancong;

CONNECT KARO18/123456
SELECT * FROM admin.v_manager_phancong;

--** PHONG BAN **
GRANT SELECT ON PHONGBAN TO SHAY25;
GRANT SELECT ON PHONGBAN TO KARO18;

CONNECT SHAY25/123456
SELECT * FROM ADMIN.PHONGBAN;
--** DE AN **
GRANT SELECT ON DEAN TO SHAY25;
GRANT SELECT ON DEAN TO KARO18;

-- *************************************************
-- CS#4
INSERT INTO NHANVIEN 
VALUES ('KAT03', 'KATANA', 'F', '12/FEB/1997', '168 Bangkok', '0999914356', 5500, 450, 'FINANCIAL', NULL, 103);
INSERT INTO NHANVIEN 
VALUES ('PET06', 'PETER', 'M', '12/SEP/1994', '168 California', '0999914287', 6500, 260, 'FINANCIAL', NULL, 104);
-- ***NHAN VIEN**
-- Chi cho financial sửa NGAYSINH, DIACHI, SODT của chính nó - Tái sử dụng STAFF
GRANT SELECT ON v_staff_nhanvien TO KAT03;
GRANT UPDATE (NGAYSINH, DIACHI, SODT) ON v_staff_nhanvien TO KAT03;
GRANT SELECT ON v_staff_nhanvien TO PET06;
GRANT UPDATE (NGAYSINH, DIACHI, SODT) ON v_staff_nhanvien TO PET06;

-- Xem toán bộ và update (LUONG, PHUCAP) của các nhân viên
GRANT SELECT ON NHANVIEN TO KAT03;
GRANT SELECT ON NHANVIEN TO PET06;
GRANT UPDATE (LUONG, PHUCAP) ON NHANVIEN TO KAT03;
GRANT UPDATE (LUONG, PHUCAP) ON NHANVIEN TO PET06;

-- ** PHAN CONG **
GRANT SELECT ON v_staff_phancong TO KAT03;
GRANT SELECT ON v_staff_phancong TO PET06;

-- ** PHONG BAN **
GRANT SELECT ON PHONGBAN TO KAT03;
GRANT SELECT ON PHONGBAN TO PET06;

-- ** DEAN **
GRANT SELECT ON DEAN TO KAT03;
GRANT SELECT ON DEAN TO PET06;

-- *************************************************
-- CS#5 - VAITRO <=>HR
INSERT INTO NHANVIEN 
VALUES ('QUE05', 'Queenland', 'F', '13/FEB/1999', '168 Chiago', '0999914289', 7000, 650, 'HR', NULL, 102);
INSERT INTO NHANVIEN 
VALUES ('ELL07', 'ELLY', 'M', '12/DEC/1996', '170 California', '0999914290', 6000, 750, 'HR', NULL, 104);
-- ** NHAN VIEN **
CREATE OE REPLACE PROCEDURE SP_HR_INSERT_NHANVIEN (
        p_tennv VARCHAR2(30),
        p_phai VARCHAR2(3),
        p_ngaysinh DATE,
        p_diachi VARCHAR(30),
        p_sodt VARCHAR2(10),
        p_vaitro VARCHAR2(15),
        p_manql VARCHAR2(6),
        p_phg NUMBER(4),
        )
AS
BEGIN
       a = max(manv) + 1
       temp := cat_chuoi(tenv,3) + a
       insert(temp, )
END;


select * from nhanvien;


-- CS#6 - PROJECT MANAGER
INSERT INTO NHANVIEN 
VALUES ('ALIS02', 'ALISSA', 'F', '12/FEB/1990', '168 Atwood Junction', '0999914450', 6500, 560, 'PROJECT MANAGER', NULL, 101);
INSERT INTO NHANVIEN 
VALUES ('WIL54', 'WILLIAM', 'M', '12/FEB/1992', '168 Seattle', '0999914420', 7200, 800, 'PROJECT MANAGER', NULL, 102);

-- *************************************************
-- ** NHANVIEN **
GRANT SELECT ON v_staff_nhanvien TO ALIS02;
GRANT SELECT ON v_staff_nhanvien TO WIL54;

GRANT UPDATE (NGAYSINH, DIACHI, SODT) ON v_staff_nhanvien TO ALIS02;
GRANT UPDATE (NGAYSINH, DIACHI, SODT) ON v_staff_nhanvien TO WIL54;

CONNECT ALIS02/123456
--SELECT * FROM admin.v_staff_nhanvien;
UPDATE admin.v_staff_nhanvien SET tennv = 'ABC' where manv = 'ALIS02';

-- ** PHANCONG **
GRANT SELECT ON v_staff_phancong TO ALIS02;
GRANT SELECT ON v_staff_phancong TO WIL54;

-- ** PHONGBAN **
GRANT SELECT ON PHONGBAN TO ALIS02;
GRANT SELECT ON PHONGBAN TO WIL54;

-- ** DEAN **
GRANT INSERT, UPDATE, DELETE ON DEAN TO ALIS02;
GRANT INSERT, UPDATE, DELETE ON DEAN TO WIL54;


-- *************************************************
-- PRESIDENT - SELECT ALL


CREATE USER NAM IDENTIFIED BY nam1
PASSWORD EXPIRE;
GRANT CREATE SESSION TO NAM;

connect NAM/nam1;
connect NAM/123456;
DROP USER NAM;

