
-- ===========================   YÊU CẦU 3+4  =================================
GRANT LBAC_DBA TO ADMIN; --LBAC LOG IN
BEGIN
    SA_SYSDBA.DROP_POLICY
    (POLICY_NAME => 'ESBD');
END;
/
BEGIN
    SA_SYSDBA.CREATE_POLICY
    (POLICY_NAME => 'ESBD',
    COLUMN_NAME => 'ROWLABEL');
END;
/
GRANT ESBD_DBA TO ADMIN;
GRANT EXECUTE ON SA_COMPONENTS TO ADMIN;
GRANT EXECUTE ON SA_LABEL_ADMIN TO ADMIN;
GRANT EXECUTE ON SA_POLICY_ADMIN TO ADMIN;
GRANT EXECUTE ON SA_USER_ADMIN TO ADMIN;
GRANT EXECUTE ON CHAR_TO_LABEL TO ADMIN;
-- SYS CAP QUYEN
ALTER USER ADMIN DEFAULT ROLE ALL;
-- LOG IN 1 LAN NUA BANG ADMIN
-- == Create the label COMPONENTS =======
-- 1. Create level
BEGIN
    SA_COMPONENTS.CREATE_LEVEL
    (POLICY_NAME => 'ESBD',
    LEVEL_NUM => 9000,
    SHORT_NAME => 'GD',
    LONG_NAME => 'GIAM DOC');
END;
/
BEGIN
    SA_COMPONENTS.CREATE_LEVEL
    (POLICY_NAME => 'ESBD',
    LEVEL_NUM => 8000,
    SHORT_NAME => 'TP',
    LONG_NAME => 'TRUONG PHONG');
END;
/
BEGIN
    SA_COMPONENTS.CREATE_LEVEL
    (POLICY_NAME => 'ESBD',
    LEVEL_NUM => 7000,
    SHORT_NAME => 'NV',
    LONG_NAME => 'NHANVIEN');
END;
/
-- 2. Create compartments
BEGIN
    SA_COMPONENTS.CREATE_COMPARTMENT 
    (POLICY_NAME => 'ESBD',
    COMP_NUM => 100,
    SHORT_NAME => 'MB',
    LONG_NAME => 'MUA BAN');
END;
/
BEGIN
    SA_COMPONENTS.CREATE_COMPARTMENT 
    (POLICY_NAME => 'ESBD',
    COMP_NUM => 10,
    SHORT_NAME => 'SX',
    LONG_NAME => 'SAN XUAT');
END;
/
BEGIN
    SA_COMPONENTS.CREATE_COMPARTMENT 
    (POLICY_NAME => 'ESBD',
    COMP_NUM => 1,
    SHORT_NAME => 'GC',
    LONG_NAME => 'GIA CONG');
END;
/
-- 3. Create groups
BEGIN
    SA_COMPONENTS.CREATE_GROUP
    (POLICY_NAME => 'ESBD',
    GROUP_NUM => 100,
    SHORT_NAME => 'B',
    LONG_NAME => 'BAC',
    PARENT_NAME => NULL);
END;
/
BEGIN
    SA_COMPONENTS.CREATE_GROUP
    (POLICY_NAME => 'ESBD',
    GROUP_NUM => 10,
    SHORT_NAME => 'T',
    LONG_NAME => 'TRUNG',
    PARENT_NAME => NULL);
END;
/
BEGIN
    SA_COMPONENTS.CREATE_GROUP
    (POLICY_NAME => 'ESBD',
    GROUP_NUM => 1,
    SHORT_NAME => 'N',
    LONG_NAME => 'NAM',
    PARENT_NAME => NULL);
END;
/
-- =============== Create LABEL ============
-- LEVEL
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 10,
    LABEL_VALUE => 'NV');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 20,
    LABEL_VALUE => 'TP');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 30,
    LABEL_VALUE => 'GD');
END;
/
-- LEVEL:COMPARTMENT
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 40,
    LABEL_VALUE => 'NV:MB');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 50,
    LABEL_VALUE => 'NV:SX');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 60,
    LABEL_VALUE => 'NV:GC');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 70,
    LABEL_VALUE => 'NV:GC,SX');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 80,
    LABEL_VALUE => 'TP:MB');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 90,
    LABEL_VALUE => 'TP:SX');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 100,
    LABEL_VALUE => 'TP:GC');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 110,
    LABEL_VALUE => 'TP:SX,GC');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 120,
    LABEL_VALUE => 'TP:MB,SX,GC');
END;
/
-- LEVEL:COMPARTMENT:GROUP
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 130,
    LABEL_VALUE => 'NV:GC:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 140,
    LABEL_VALUE => 'NV:MB:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 150,
    LABEL_VALUE => 'NV:SX:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 160,
    LABEL_VALUE => 'NV:MB:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 170,
    LABEL_VALUE => 'NV:SX,GC:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 180,
    LABEL_VALUE => 'NV:GC:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 190,
    LABEL_VALUE => 'NV:MB:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 200,
    LABEL_VALUE => 'NV:SX:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 210,
    LABEL_VALUE => 'TP:GC:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 220,
    LABEL_VALUE => 'TP:MB:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 230,
    LABEL_VALUE => 'TP:SX:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 240,
    LABEL_VALUE => 'TP:MB:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 250,
    LABEL_VALUE => 'TP:SX:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 260,
    LABEL_VALUE => 'TP:GC:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 270,
    LABEL_VALUE => 'TP:GC,SX:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 280,
    LABEL_VALUE => 'TP:MB:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 290,
    LABEL_VALUE => 'TP:SX:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 300,
    LABEL_VALUE => 'TP:GC:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 310,
    LABEL_VALUE => 'TP:MB,SX,GC:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 320,
    LABEL_VALUE => 'TP:MB,SX,GC:B,T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 330,
    LABEL_VALUE => 'GD:MB,SX,GC:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 340,
    LABEL_VALUE => 'GD:MB,SX,GC:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 350,
    LABEL_VALUE => 'GD:MB,SX,GC:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 360,
    LABEL_VALUE => 'GD:MB,SX,GC:N,T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (POLICY_NAME => 'ESBD',
    LABEL_TAG => 370,
    LABEL_VALUE => 'GD:MB,SX,GC:B,N,T');
END;
/
-- =============== Applying the policy to table ============

BEGIN
    SA_POLICY_ADMIN.APPLY_TABLE_POLICY
    (POLICY_NAME => 'ESBD',
    SCHEMA_NAME => 'ADMIN',
    TABLE_NAME => 'THONGBAO', 
    TABLE_OPTIONS => 'NO_CONTROL');
END;
/
-- ==================UPDATE OLS POLICY=======================
UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV');

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP')
WHERE NOIDUNG LIKE N'%trưởng phòng%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'GD')
WHERE NOIDUNG LIKE N'%giám đốc%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV:MB')
WHERE NOIDUNG LIKE N'%nhân viên%' AND NOIDUNG LIKE N'%mua bán%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV:SX')
WHERE NOIDUNG LIKE N'%nhân viên%' AND NOIDUNG LIKE N'%sản xuất%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV:GC')
WHERE NOIDUNG LIKE N'%nhân viên%' AND NOIDUNG LIKE N'%gia công%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV:SX,GC')
WHERE NOIDUNG LIKE N'%nhân viên%' AND NOIDUNG LIKE N'%gia công%' AND NOIDUNG LIKE N'%sản xuất%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:MB')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%mua bán%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:SX')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%sản xuất%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:GC')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%gia công%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:SX,GC')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%gia công%' AND NOIDUNG LIKE N'%sản xuất%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:MB,SX,GC')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%tất cả lĩnh vực%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV:GC:B')
WHERE NOIDUNG LIKE N'%nhân viên%' AND NOIDUNG LIKE N'%gia công%' AND NOIDUNG LIKE N'%miền Bắc%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV:MB:B')
WHERE NOIDUNG LIKE N'%nhân viên%' AND NOIDUNG LIKE N'%mua bán%' AND NOIDUNG LIKE N'%miền Bắc%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV:SX:B')
WHERE NOIDUNG LIKE N'%nhân viên%' AND NOIDUNG LIKE N'%sản xuất%' AND NOIDUNG LIKE N'%miền Bắc%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV:MB:T')
WHERE NOIDUNG LIKE N'%nhân viên%' AND NOIDUNG LIKE N'%mua bán%' AND NOIDUNG LIKE N'%miền Trung%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV:SX,GC:T')
WHERE NOIDUNG LIKE N'%nhân viên%' AND NOIDUNG LIKE N'%sản xuất%' AND NOIDUNG LIKE N'%gia công%' AND NOIDUNG LIKE N'%miền Trung%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV:GC:N')
WHERE NOIDUNG LIKE N'%nhân viên%' AND NOIDUNG LIKE N'%gia công%' AND NOIDUNG LIKE N'%miền Nam%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV:MB:N')
WHERE NOIDUNG LIKE N'%nhân viên%' AND NOIDUNG LIKE N'%mua bán%' AND NOIDUNG LIKE N'%miền Nam%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'NV:SX:N')
WHERE NOIDUNG LIKE N'%nhân viên%' AND NOIDUNG LIKE N'%sản xuất%' AND NOIDUNG LIKE N'%miền Nam%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:GC:B')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%gia công%' AND NOIDUNG LIKE N'%miền Bắc%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:MB:B')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%mua bán%' AND NOIDUNG LIKE N'%miền Bắc%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:SX:B')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%sản xuất%' AND NOIDUNG LIKE N'%miền Bắc%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:MB:T')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%mua bán%' AND NOIDUNG LIKE N'%miền Trung%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:GC:T')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%gia công%' AND NOIDUNG LIKE N'%miền Trung%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:SX:T')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%sản xuất%' AND NOIDUNG LIKE N'%miền Trung%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:GC,SX:T')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%gia công%' AND NOIDUNG LIKE N'%sản xuất%' AND NOIDUNG LIKE N'%miền Trung%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:GC:N')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%gia công%' AND NOIDUNG LIKE N'%miền Nam%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:MB:N')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%mua bán%' AND NOIDUNG LIKE N'%miền Nam%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:SX:N')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%sản xuất%' AND NOIDUNG LIKE N'%miền Nam%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:MB,SX,GC:N')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%tất cả lĩnh vực%' AND NOIDUNG LIKE N'%miền Nam%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'TP:MB,SX,GC:B,T')
WHERE NOIDUNG LIKE N'%trưởng phòng%' AND NOIDUNG LIKE N'%tất cả lĩnh vực%' AND NOIDUNG LIKE N'%miền Bắc%' AND NOIDUNG LIKE N'%miền Trung%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'GD:SX,MB,GC:T')
WHERE NOIDUNG LIKE N'%giám đốc%' AND NOIDUNG LIKE N'%tất cả lĩnh vực%' AND NOIDUNG LIKE N'%miền Trung%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'GD:SX,MB,GC:B')
WHERE NOIDUNG LIKE N'%giám đốc%' AND NOIDUNG LIKE N'%tất cả lĩnh vực%' AND NOIDUNG LIKE N'%miền Bắc%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'GD:SX,MB,GC:N')
WHERE NOIDUNG LIKE N'%giám đốc%' AND NOIDUNG LIKE N'%tất cả lĩnh vực%' AND NOIDUNG LIKE N'%miền Nam%';

UPDATE THONGBAO
SET ROWLABEL = CHAR_TO_LABEL('ESBD', 'GD:SX,MB,GC:N,T')
WHERE NOIDUNG LIKE N'%giám đốc%' AND NOIDUNG LIKE N'%tất cả lĩnh vực%' AND NOIDUNG LIKE N'%miền Nam%' AND NOIDUNG LIKE N'%miền Trung%';
/
BEGIN
 SA_POLICY_ADMIN.REMOVE_TABLE_POLICY (
  POLICY_NAME    => 'ESBD',
  SCHEMA_NAME    => 'ADMIN', 
  TABLE_NAME     => 'THONGBAO');
END;
/
BEGIN
SA_POLICY_ADMIN.APPLY_TABLE_POLICY
    (POLICY_NAME => 'ESBD',
    SCHEMA_NAME => 'ADMIN',
    TABLE_NAME => 'THONGBAO',
    TABLE_OPTIONS => 'READ_CONTROL, HIDE');
END;
/
-- Gán label cho user
-- ========= Gán label cho user nhân viên ==============
--  miền Bắc
-- PHÒNG 101 - GIA CÔNG
DECLARE 
        CURSOR CUR IS (SELECT MANV FROM ADMIN.NHANVIEN WHERE PHG = 101 AND VAITRO = 'NHANVIEN');
        STRSQL VARCHAR2(400);
        USR VARCHAR2(50);
BEGIN
        OPEN CUR;
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'BEGIN SA_USER_ADMIN.SET_USER_LABELS(policy_name =>''ESBD'', user_name => '''|| USR || ''', max_read_label =>  ''NV:GC:B''); END;';
                EXECUTE IMMEDIATE(STRSQL);
        END LOOP;
        CLOSE CUR;
END;
/
-- PHÒNG 102 - SẢN XUẤT
DECLARE 
        CURSOR CUR IS (SELECT MANV FROM ADMIN.NHANVIEN WHERE PHG = 102 AND VAITRO = 'NHANVIEN');
        STRSQL VARCHAR2(400);
        USR VARCHAR2(50);
BEGIN
        OPEN CUR;
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'BEGIN SA_USER_ADMIN.SET_USER_LABELS(policy_name =>''ESBD'', user_name => '''|| USR || ''', max_read_label =>  ''NV:SX:B''); END;';
                EXECUTE IMMEDIATE(STRSQL);
        END LOOP;
        CLOSE CUR;
END;
/
-- PHÒNG 103 - MUA BÁN
DECLARE 
        CURSOR CUR IS (SELECT MANV FROM ADMIN.NHANVIEN WHERE PHG = 103 AND VAITRO = 'NHANVIEN');
        STRSQL VARCHAR2(400);
        USR VARCHAR2(50);
BEGIN
        OPEN CUR;
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'BEGIN SA_USER_ADMIN.SET_USER_LABELS(policy_name =>''ESBD'', user_name => '''|| USR || ''', max_read_label =>  ''NV:MB:B''); END;';
                EXECUTE IMMEDIATE(STRSQL);
        END LOOP;
        CLOSE CUR;
END;
/
-- Miền Trung
-- PHÒNG 104 - MUA BÁN
DECLARE 
        CURSOR CUR IS (SELECT MANV FROM ADMIN.NHANVIEN WHERE PHG = 104 AND VAITRO = 'NHANVIEN');
        STRSQL VARCHAR2(400);
        USR VARCHAR2(50);
BEGIN
        OPEN CUR;
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'BEGIN SA_USER_ADMIN.SET_USER_LABELS(policy_name =>''ESBD'', user_name => '''|| USR || ''', max_read_label =>  ''NV:MB:T''); END;';
                EXECUTE IMMEDIATE(STRSQL);
        END LOOP;
        CLOSE CUR;
END;
/
-- PHÒNG 105 - SẢN XUẤT, GIA CÔNG
DECLARE 
        CURSOR CUR IS (SELECT MANV FROM ADMIN.NHANVIEN WHERE PHG = 105 AND VAITRO = 'NHANVIEN');
        STRSQL VARCHAR2(400);
        USR VARCHAR2(50);
BEGIN
        OPEN CUR;
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'BEGIN SA_USER_ADMIN.SET_USER_LABELS(policy_name =>''ESBD'', user_name => '''|| USR || ''', max_read_label =>  ''NV:SX,GC:T''); END;';
                EXECUTE IMMEDIATE(STRSQL);
        END LOOP;
        CLOSE CUR;
END;
/

-- Miền Nam
-- PHÒNG 106 - MUA BÁN
DECLARE 
        CURSOR CUR IS (SELECT MANV FROM ADMIN.NHANVIEN WHERE PHG = 106 AND VAITRO = 'NHANVIEN');
        STRSQL VARCHAR2(400);
        USR VARCHAR2(50);
BEGIN
        OPEN CUR;
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'BEGIN SA_USER_ADMIN.SET_USER_LABELS(policy_name =>''ESBD'', user_name => '''|| USR || ''', max_read_label =>  ''NV:MB:N''); END;';
                EXECUTE IMMEDIATE(STRSQL);
        END LOOP;
        CLOSE CUR;
END;
/
-- PHÒNG 107 - SẢN XUẤT
DECLARE 
        CURSOR CUR IS (SELECT MANV FROM ADMIN.NHANVIEN WHERE PHG = 107 AND VAITRO = 'NHANVIEN');
        STRSQL VARCHAR2(400);
        USR VARCHAR2(50);
BEGIN
        OPEN CUR;
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'BEGIN SA_USER_ADMIN.SET_USER_LABELS(policy_name =>''ESBD'', user_name => '''|| USR || ''', max_read_label =>  ''NV:SX:N''); END;';
                EXECUTE IMMEDIATE(STRSQL);
        END LOOP;
        CLOSE CUR;
END;
/
-- PHÒNG 108 - GIA CÔNG
DECLARE 
        CURSOR CUR IS (SELECT MANV FROM ADMIN.NHANVIEN WHERE PHG = 108 AND VAITRO = 'NHANVIEN');
        STRSQL VARCHAR2(400);
        USR VARCHAR2(50);
BEGIN
        OPEN CUR;
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'BEGIN SA_USER_ADMIN.SET_USER_LABELS(policy_name =>''ESBD'', user_name => '''|| USR || ''', max_read_label =>  ''NV:GC:N''); END;';
                EXECUTE IMMEDIATE(STRSQL);
        END LOOP;
        CLOSE CUR;
END;
/
-- ========= Gán label cho user trưởng phòng ==============
--select * from nhanvien where vaitro = 'TRUONGPHONG';
-- Miền bắc
-- BARB396 - GIA CÔNG
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'BARB396',
    MAX_READ_LABEL => 'TP:GC:B');
END;
/
-- MAUR325 - SẢN XUẤT
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'MAUR325',
    MAX_READ_LABEL => 'TP:SX:B');
END;
/
-- LEIL369 - MUA BÁN
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'LEIL369',
    MAX_READ_LABEL => 'TP:MB:B');
END;
/
-- Miền Trung
-- GARA176 - MUA BÁN
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'GARA176',
    MAX_READ_LABEL => 'TP:MB:T');
END;
/
-- GERR263 - SẢN XUẤT, GIA CÔNG
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'GERR263',
    MAX_READ_LABEL => 'TP:SX,GC:T');
END;
/
-- Miền Nam
-- WILM121 - MUA BÁN
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'WILM121',
    MAX_READ_LABEL => 'TP:MB:N');
END;
/
-- ANGE326 - SẢN XUẤT (Một trưởng phòng phụ trách lĩnh vực sản xuất ở miền Nam - ĐỒ ÁN)
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'ANGE326',
    MAX_READ_LABEL => 'TP:SX:N');
END;
/
-- CELI275 - GIA CÔNG
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'CELI275',
    MAX_READ_LABEL => 'TP:GC:N');
END;
/
-- ========= Gán label cho user giám đốc ==============
-- Miền Bắc
-- KAYC433 - TỔNG GIÁM ĐỐC CẢ 3 MIỀN BẮC, TRUNG, NAM (xem toàn bộ dữ liệu bảng thông báo - ĐỒ ÁN)
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'KAYC433',
    MAX_READ_LABEL => 'GD:MB,SX,GC:B,T,N');
END;
/
-- RICC407 - GIÁM ĐỐC MIỀN BẮC (quản lý bất ký lĩnh vực ở chi nhánh miền Bắc - ĐỒ ÁN)
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'RICC407',
    MAX_READ_LABEL => 'GD:MB,SX,GC:B');
END;
/
-- Miền Trung
-- RAFF267 - GIÁM ĐỐC MIỀN TRUNG
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'RAFF267',
    MAX_READ_LABEL => 'GD:MB,SX,GC:T');
END;
/
--Miền Nam
-- LARI250 - GIÁM ĐỐC MIỀN NAM
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'LARI250',
    MAX_READ_LABEL => 'GD:MB,SX,GC:N');
END;
/
-- BRIG447 - GIÁM ĐỐC MIỀN NAM VÀ MIỀN TRUNG
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS
    (POLICY_NAME => 'ESBD',
    USER_NAME => 'BRIG447',
    MAX_READ_LABEL => 'GD:MB,SX,GC:N,T');
END;
/
-- GÁN QUYỀN ĐỌC GHI CHO ADMIN
BEGIN
    SA_USER_ADMIN.SET_USER_PRIVS
    (
    POLICY_NAME => 'ESBD',
    USER_NAME => 'ADMIN',
    PRIVILEGES => 'FULL'
    );
END;
/
-- ===========================   YÊU CẦU 4   =================================
-- A. Những người cập nhật thời gian trên quan hệ Phân công
BEGIN
        DBMS_FGA.DROP_POLICY (
        OBJECT_SCHEMA => 'admin',
        OBJECT_NAME => 'phancong',
        POLICY_NAME => 'audit_policy_phancong'
        );
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -28102 THEN
        RAISE;
    END IF;
END;
/  
BEGIN 
        DBMS_FGA.ADD_POLICY
        (OBJECT_SCHEMA => 'admin',
        OBJECT_NAME => 'phancong',
        POLICY_NAME => 'audit_policy_phancong',
        AUDIT_COLUMN => 'thoigian',
        STATEMENT_TYPES => 'update');
END;
/                                                        
           
-- B. Những người đã đọc trên trường lương và phụ cấp của người khác
-- view admin.nhanvien
BEGIN
        DBMS_FGA.DROP_POLICY (
        OBJECT_SCHEMA => 'admin',
        OBJECT_NAME => 'v_nhanvien',
        POLICY_NAME => 'audit_policy_nhanvien'
        );
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -28102 THEN
        RAISE;
    END IF;
END;
/  
BEGIN 
        DBMS_FGA.ADD_POLICY
        (OBJECT_SCHEMA => 'admin',
        OBJECT_NAME => 'v_nhanvien',
        POLICY_NAME => 'audit_policy_nhanvien',
        AUDIT_CONDITION => 'manv != user',
        AUDIT_COLUMN => 'luong, phucap',
        STATEMENT_TYPES => 'select',
        AUDIT_COLUMN_OPTS => DBMS_FGA.ANY_COLUMNS);
END;
/
BEGIN
        DBMS_FGA.DROP_POLICY (
        OBJECT_SCHEMA => 'nam',
        OBJECT_NAME => 'v_nhanvien',
        POLICY_NAME => 'audit_policy_nhanvien1'
        );
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -28102 THEN
        RAISE;
    END IF;
END;
/  
-- view nam.v_nhanvien
BEGIN 
        DBMS_FGA.ADD_POLICY
        (OBJECT_SCHEMA => 'nam',
        OBJECT_NAME => 'v_nhanvien',
        POLICY_NAME => 'audit_policy_nhanvien1',
        AUDIT_CONDITION => 'manv != user',
        AUDIT_COLUMN => 'luong, phucap',
        STATEMENT_TYPES => 'select',
        AUDIT_COLUMN_OPTS => DBMS_FGA.ANY_COLUMNS);
END;
/

--C. Một người 'không' phải tài chính những đã cập nhật LUONG, PHUCAP thành công
-- Không biết cập nhật gì (thành công hay không thành công), miễn kh phải Tài chính đều audit hành động lại
-- admin.nhanvien
BEGIN
        DBMS_FGA.DROP_POLICY (
        OBJECT_SCHEMA => 'admin',
        OBJECT_NAME => 'nhanvien',
        POLICY_NAME => 'audit_policy_nhanvien2'
        );
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -28102 THEN
        RAISE;
    END IF;
END;
/  
BEGIN 
        DBMS_FGA.ADD_POLICY
        (OBJECT_SCHEMA => 'admin',
        OBJECT_NAME => 'nhanvien',
        POLICY_NAME => 'audit_policy_nhanvien2',
        AUDIT_CONDITION => 'sys_context(''ctx_nhanvien'', ''role'') != ''TAICHINH''',
        AUDIT_COLUMN => 'luong, phucap',
        STATEMENT_TYPES => 'update',
        AUDIT_COLUMN_OPTS => DBMS_FGA.ANY_COLUMNS);
END;
/
-- nam.v_own_nhanvien
BEGIN
        DBMS_FGA.DROP_POLICY (
        OBJECT_SCHEMA => 'nam',
        OBJECT_NAME => 'v_own_nhanvien',
        POLICY_NAME => 'audit_policy_nhanvien3'
        );
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -28102 THEN
        RAISE;
    END IF;
END;
/  
BEGIN 
        DBMS_FGA.ADD_POLICY
        (OBJECT_SCHEMA => 'nam',
        OBJECT_NAME => 'v_own_nhanvien',
        POLICY_NAME => 'audit_policy_nhanvien3',
        AUDIT_CONDITION => 'sys_context(''ctx_nhanvien'', ''role'') != ''TAICHINH''',
        AUDIT_COLUMN => 'luong, phucap',
        STATEMENT_TYPES => 'update',
        AUDIT_COLUMN_OPTS => DBMS_FGA.ANY_COLUMNS);
END;
/
-- nam.nhanvien
BEGIN
        DBMS_FGA.DROP_POLICY (
        OBJECT_SCHEMA => 'nam',
        OBJECT_NAME => 'nhanvien',
        POLICY_NAME => 'audit_policy_nhanvien4'
        );
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -28102 THEN
        RAISE;
    END IF;
END;
/  
BEGIN 
        DBMS_FGA.ADD_POLICY
        (OBJECT_SCHEMA => 'nam',
        OBJECT_NAME => 'nhanvien',
        POLICY_NAME => 'audit_policy_nhanvien4',
        AUDIT_CONDITION => 'sys_context(''ctx_nhanvien'', ''role'') != ''TAICHINH''',
        AUDIT_COLUMN => 'luong, phucap',
        STATEMENT_TYPES => 'update',
        AUDIT_COLUMN_OPTS => DBMS_FGA.ANY_COLUMNS);
END;
/
--grant update (luong, phucap) on nam.v_nhanvien to LARI250;
--revoke update on nam.v_nhanvien from LARI250;
--connect LARI250/123456
--update nam.v_nhanvien 
--set luong = 636, phucap = 12
--where manv = 'DARI418';

-- D. Kiểm tra nhật ký hệ thống
SELECT AUDIT_TYPE, DBUSERNAME, EVENT_TIMESTAMP, ACTION_NAME, OBJECT_SCHEMA, OBJECT_NAME, SQL_TEXT, FGA_POLICY_NAME
FROM  UNIFIED_AUDIT_TRAIL 
ORDER BY EVENT_TIMESTAMP DESC;
