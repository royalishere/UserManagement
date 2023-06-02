
-----------------------PROCEDURES----------------------
CREATE OR REPLACE PROCEDURE CREATE_USER(USERNAME VARCHAR2, PASSWORD VARCHAR2, ISLOCK VARCHAR2)
AS
BEGIN
	EXECUTE IMMEDIATE('CREATE USER ' || USERNAME || ' IDENTIFIED BY ' || PASSWORD || ' ' || ISLOCK);
	EXECUTE IMMEDIATE('GRANT CONNECT TO ' || USERNAME);
EXCEPTION
	WHEN OTHERS THEN
        IF SQLCODE = -01920 THEN
            RAISE;
        END IF;
END;
/
-- PROCEDURE - DELETE ROLE 
CREATE OR REPLACE PROCEDURE SP_DELETE_ROLE
        (roleName IN VARCHAR2)
AS
        strSQL VARCHAR2(200);
BEGIN
        strSQL := 'DROP ROLE ' || roleName;
        EXECUTE IMMEDIATE (strSQL);
END;
/

 -- PROCEDURE - CREATE ROLE
CREATE OR REPLACE PROCEDURE SP_CREATE_ROLE
        (roleName IN VARCHAR2, rolePassword IN VARCHAR2)
AS
        strSQL VARCHAR2(300);
BEGIN
        if rolePassword IS NULL THEN
                strSQL := 'CREATE ROLE ' || roleName;
                EXECUTE IMMEDIATE (strSQL);
        ELSE 
                strSQL := 'CREATE ROLE ' || roleName || ' IDENTIFIED BY ' || rolePassword;
                EXECUTE IMMEDIATE (strSQL);
                
                strSQL := 'GRANT CREATE SESSION TO ' || roleName;
                 EXECUTE IMMEDIATE (strSQL);
        END IF;
END;
/

-- PROCEDURE CHANGE PASSWORD ROLE
CREATE OR REPLACE PROCEDURE SP_CHANGE_PASSWORD_ROLE
         (roleName IN VARCHAR2, rolePassword IN VARCHAR2)
AS
        strSQL VARCHAR2(300);
BEGIN
        strSQL := 'ALTER ROLE ' || roleName || ' IDENTIFIED BY ' || rolePassword;
        EXECUTE IMMEDIATE (strSQL);
END;
/
 
 -- PROCEDURE -- GRANT TAB PRIVIS FOR ROLE
CREATE OR REPLACE PROCEDURE SP_GRANT_TAB_PRIVS_ROLE
        (roleName IN VARCHAR2,
        objectName IN VARCHAR2,
        tabPrivs IN VARCHAR2,
        columnName IN VARCHAR2
        )
AS
        strSQL VARCHAR2(300);
BEGIN
        IF (columnName IS NULL) THEN
                 strSQL := 'GRANT ' || tabPrivs || ' ON ' || objectName || ' TO "' || roleName || '"' ;
        ELSE
                strSQL := 'GRANT ' || tabPrivs || ' (' || columnName || ') ON ' || objectName || ' TO "' || roleName ||  '"' ;
        END IF;
                
--         DBMS_OUTPUT.PUT_LINE(strSQL);        
         EXECUTE IMMEDIATE (strSQL);
END;
/
--SET SERVEROUTPUT ON;
EXEC SP_GRANT_TAB_PRIVS_ROLE('ANALYSIS', 'NHANVIEN', 'update', 'LUONG');

-- PROCEDURE - GRANT ROLE TO USER
CREATE OR REPLACE PROCEDURE SP_GRANTROLE_TO_USER
        (roleName IN VARCHAR2,
        userName IN VARCHAR2,
        grantable IN BOOLEAN
        )
AS
        strSQL VARCHAR(300);
BEGIN
        IF (grantable = TRUE) THEN
                strSQL := 'GRANT ' || roleName || ' TO ' || userName || ' WITH ADMIN OPTION';
        ELSE
                strSQL := 'GRANT ' || roleName || ' TO ' || userName;
        END IF;
--        DBMS_OUTPUT.PUT_LINE(strSQL);
        EXECUTE IMMEDIATE (strSQL);
END;
/

EXEC SP_GRANTROLE_TO_USER('MANAGER', 'ANN', false)

-- PROCEDURE REVOKE OBJECT PRIVILEGE FROM ROLE
CREATE OR REPLACE PROCEDURE SP_REVOKE_ROLE
        (roleName IN VARCHAR2,
        objectName IN VARCHAR2,
        tabPrivs IN VARCHAR2
        )
AS
        strSQL VARCHAR2(300);
BEGIN
        strSQL := 'REVOKE ' || tabprivs || ' ON ' || objectName || ' FROM ' || roleName;
        
--        DBMS_OUTPUT.PUT_LINE(strSQL);
        EXECUTE IMMEDIATE (strSQL);
END;
/
EXEC SP_REVOKE_ROLE('ANALYSIS', 'NHANVIEN', 'UPDATE');


CREATE USER SHAY25 IDENTIFIED BY 123456;
CREATE USER KARO18 IDENTIFIED BY 123456;

SELECT * FROM ADMIN.NHANVIEN;
--
SELECT * FROM ROLE_TAB_PRIVS WHERE OWNER = 'ADMIN' AND ROLE = 'ANALYSIS';