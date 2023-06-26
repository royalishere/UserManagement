
-- ===========================   YÊU CẦU 3   =================================

-- ============= LBACSYS ==================
GRANT LBAC_DBA TO ADMIN;

-- =============== Creating the OLS POLICY ============
BEGIN
    SA_SYSDBA.CREATE_POLICY
    (policy_name => 'ESBD',
    column_name => 'ROWLABEL');
END;
/

GRANT ESBD_DBA TO ADMIN;
ALTER USER ADMIN DEFAULT ROLE ALL; -- SYS

--SELECT * FROM DBA_ROLE_PRIVS;
GRANT EXECUTE ON SA_COMPONENTS TO ADMIN;
GRANT EXECUTE ON SA_LABEL_ADMIN TO ADMIN;
GRANT EXECUTE ON SA_POLICY_ADMIN TO ADMIN;
GRANT EXECUTE ON SA_USER_ADMIN TO ADMIN;
GRANT EXECUTE ON CHAR_TO_LABEL TO ADMIN;


--                          ============= ADMIN ==================
-- =============== Create the label COMPONENTS ============
-- 1. Create level
BEGIN
    SA_COMPONENTS.CREATE_LEVEL
    (policy_name => 'ESBD',
    level_num => 9000,
    short_name => 'GD',
    long_name => 'GIAM DOC');
END;
/
BEGIN
    SA_COMPONENTS.CREATE_LEVEL
    (policy_name => 'ESBD',
    level_num => 8000,
    short_name => 'TP',
    long_name => 'TRUONG PHONG');
END;
/
BEGIN
    SA_COMPONENTS.CREATE_LEVEL
    (policy_name => 'ESBD',
    level_num => 7000,
    short_name => 'NV',
    long_name => 'NHANVIEN');
END;
/
-- 2. Create compartments
BEGIN
    SA_COMPONENTS.CREATE_COMPARTMENT 
    (policy_name => 'ESBD',
    comp_num => 100,
    short_name => 'MB',
    long_name => 'MUA BAN');
END;
/
BEGIN
    SA_COMPONENTS.CREATE_COMPARTMENT 
    (policy_name => 'ESBD',
    comp_num => 10,
    short_name => 'SX',
    long_name => 'SAN XUAT');
END;
/
BEGIN
    SA_COMPONENTS.CREATE_COMPARTMENT 
    (policy_name => 'ESBD',
    comp_num => 1,
    short_name => 'GC',
    long_name => 'GIA CONG');
END;
/
-- 3. Create groups
BEGIN
    SA_COMPONENTS.CREATE_GROUP
    (policy_name => 'ESBD',
    group_num => 100,
    short_name => 'B',
    long_name => 'BAC',
    parent_name => NULL);
END;
/
BEGIN
    SA_COMPONENTS.CREATE_GROUP
    (policy_name => 'ESBD',
    group_num => 10,
    short_name => 'T',
    long_name => 'TRUNG',
    parent_name => NULL);
END;
/
BEGIN
    SA_COMPONENTS.CREATE_GROUP
    (policy_name => 'ESBD',
    group_num => 1,
    short_name => 'N',
    long_name => 'NAM',
    parent_name => NULL);
END;
/

select * from ALL_SA_LEVELS;
select * from  ALL_SA_COMPARTMENTS;
select * from ALL_SA_GROUPS;

-- =============== Create LABEL ============
-- LEVEL
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 10,
    label_value => 'NV');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 20,
    label_value => 'TP');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 30,
    label_value => 'GD');
END;
/
-- LEVEL:COMPARTMENT
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 40,
    label_value => 'NV:MB');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 50,
    label_value => 'NV:SX');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 60,
    label_value => 'NV:GC');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 70,
    label_value => 'NV:GC,SX');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 80,
    label_value => 'TP:MB');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 90,
    label_value => 'TP:SX');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 100,
    label_value => 'TP:GC');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 110,
    label_value => 'TP:SX,GC');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 120,
    label_value => 'TP:MB,SX,GC');
END;
/
-- LEVEL:COMPARTMENT:GROUP
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 130,
    label_value => 'NV:GC:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 140,
    label_value => 'NV:MB:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 150,
    label_value => 'NV:SX:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 160,
    label_value => 'NV:MB:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 170,
    label_value => 'NV:SX,GC:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 180,
    label_value => 'NV:GC:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 190,
    label_value => 'NV:MB:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 200,
    label_value => 'NV:SX:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 210,
    label_value => 'TP:GC:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 220,
    label_value => 'TP:MB:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 230,
    label_value => 'TP:SX:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 240,
    label_value => 'TP:MB:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 250,
    label_value => 'TP:SX:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 260,
    label_value => 'TP:GC:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 270,
    label_value => 'TP:GC,SX:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 280,
    label_value => 'TP:MB:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 290,
    label_value => 'TP:SX:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 300,
    label_value => 'TP:GC:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 310,
    label_value => 'TP:MB,SX,GC:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 320,
    label_value => 'TP:MB,SX,GC:B,T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 330,
    label_value => 'GD:MB,SX,GC:B');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 340,
    label_value => 'GD:MB,SX,GC:T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 350,
    label_value => 'GD:MB,SX,GC:N');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 360,
    label_value => 'GD:MB,SX,GC:N,T');
END;
/
BEGIN
    SA_LABEL_ADMIN.CREATE_LABEL
    (policy_name => 'ESBD',
    label_tag => 370,
    label_value => 'GD:MB,SX,GC:B,N,T');
END;
/

SELECT * FROM ALL_SA_LABELS;

-- =============== Applying the policy to table ============
-- Create table and insert data
CREATE TABLE THONGBAO (
        NOIDUNG NVARCHAR2(2000)
);

--DROP TABLE THONGBAO;
--DESC THONGBAO;

BEGIN
    SA_POLICY_ADMIN.APPLY_TABLE_POLICY
    (policy_name => 'ESBD',
    schema_name => 'ADMIN',
    table_name => 'THONGBAO', 
    table_options => 'NO_CONTROL');
END;
/
--DESC THONGBAO;
SELECT * FROM ALL_SA_LABELS;
select * from thongbao;

update thongbao
set rowlabel = char_to_label('ESBD', 'NV');

update thongbao
set rowlabel = char_to_label('ESBD', 'TP')
where noidung like N'%trưởng phòng%';

update thongbao
set rowlabel = char_to_label('ESBD', 'GD')
where noidung like N'%giám đốc%';

update thongbao
set rowlabel = char_to_label('ESBD', 'NV:MB')
where noidung like N'%nhân viên%' and noidung like N'%mua bán%';

update thongbao
set rowlabel = char_to_label('ESBD', 'NV:SX')
where noidung like N'%nhân viên%' and noidung like N'%sản xuất%';

update thongbao
set rowlabel = char_to_label('ESBD', 'NV:GC')
where noidung like N'%nhân viên%' and noidung like N'%gia công%';

update thongbao
set rowlabel = char_to_label('ESBD', 'NV:SX,GC')
where noidung like N'%nhân viên%' and noidung like N'%gia công%' and noidung like N'%sản xuất%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:MB')
where noidung like N'%trưởng phòng%' and noidung like N'%mua bán%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:SX')
where noidung like N'%trưởng phòng%' and noidung like N'%sản xuất%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:GC')
where noidung like N'%trưởng phòng%' and noidung like N'%gia công%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:SX,GC')
where noidung like N'%trưởng phòng%' and noidung like N'%gia công%' and noidung like N'%sản xuất%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:MB,SX,GC')
where noidung like N'%trưởng phòng%' and noidung like N'%tất cả lĩnh vực%';

update thongbao
set rowlabel = char_to_label('ESBD', 'NV:GC:B')
where noidung like N'%nhân viên%' and noidung like N'%gia công%' and noidung like N'%miền Bắc%';

update thongbao
set rowlabel = char_to_label('ESBD', 'NV:MB:B')
where noidung like N'%nhân viên%' and noidung like N'%mua bán%' and noidung like N'%miền Bắc%';

update thongbao
set rowlabel = char_to_label('ESBD', 'NV:SX:B')
where noidung like N'%nhân viên%' and noidung like N'%sản xuất%' and noidung like N'%miền Bắc%';

update thongbao
set rowlabel = char_to_label('ESBD', 'NV:MB:T')
where noidung like N'%nhân viên%' and noidung like N'%mua bán%' and noidung like N'%miền Trung%';

update thongbao
set rowlabel = char_to_label('ESBD', 'NV:SX,GC:T')
where noidung like N'%nhân viên%' and noidung like N'%sản xuất%' and noidung like N'%gia công%' and noidung like N'%miền Trung%';

update thongbao
set rowlabel = char_to_label('ESBD', 'NV:GC:N')
where noidung like N'%nhân viên%' and noidung like N'%gia công%' and noidung like N'%miền Nam%';

update thongbao
set rowlabel = char_to_label('ESBD', 'NV:MB:N')
where noidung like N'%nhân viên%' and noidung like N'%mua bán%' and noidung like N'%miền Nam%';

update thongbao
set rowlabel = char_to_label('ESBD', 'NV:SX:N')
where noidung like N'%nhân viên%' and noidung like N'%sản xuất%' and noidung like N'%miền Nam%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:GC:B')
where noidung like N'%trưởng phòng%' and noidung like N'%gia công%' and noidung like N'%miền Bắc%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:MB:B')
where noidung like N'%trưởng phòng%' and noidung like N'%mua bán%' and noidung like N'%miền Bắc%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:SX:B')
where noidung like N'%trưởng phòng%' and noidung like N'%sản xuất%' and noidung like N'%miền Bắc%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:MB:T')
where noidung like N'%trưởng phòng%' and noidung like N'%mua bán%' and noidung like N'%miền Trung%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:GC:T')
where noidung like N'%trưởng phòng%' and noidung like N'%gia công%' and noidung like N'%miền Trung%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:SX:T')
where noidung like N'%trưởng phòng%' and noidung like N'%sản xuất%' and noidung like N'%miền Trung%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:GC,SX:T')
where noidung like N'%trưởng phòng%' and noidung like N'%gia công%' and noidung like N'%sản xuất%' and noidung like N'%miền Trung%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:GC:N')
where noidung like N'%trưởng phòng%' and noidung like N'%gia công%' and noidung like N'%miền Nam%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:MB:N')
where noidung like N'%trưởng phòng%' and noidung like N'%mua bán%' and noidung like N'%miền Nam%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:SX:N')
where noidung like N'%trưởng phòng%' and noidung like N'%sản xuất%' and noidung like N'%miền Nam%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:MB,SX,GC:N')
where noidung like N'%trưởng phòng%' and noidung like N'%tất cả lĩnh vực%' and noidung like N'%miền Nam%';

update thongbao
set rowlabel = char_to_label('ESBD', 'TP:MB,SX,GC:B,T')
where noidung like N'%trưởng phòng%' and noidung like N'%tất cả lĩnh vực%' and noidung like N'%miền Bắc%' and noidung like N'%miền Trung%';

update thongbao
set rowlabel = char_to_label('ESBD', 'GD:SX,MB,GC:T')
where noidung like N'%giám đốc%' and noidung like N'%tất cả lĩnh vực%' and noidung like N'%miền Trung%';

update thongbao
set rowlabel = char_to_label('ESBD', 'GD:SX,MB,GC:B')
where noidung like N'%giám đốc%' and noidung like N'%tất cả lĩnh vực%' and noidung like N'%miền Bắc%';

update thongbao
set rowlabel = char_to_label('ESBD', 'GD:SX,MB,GC:N')
where noidung like N'%giám đốc%' and noidung like N'%tất cả lĩnh vực%' and noidung like N'%miền Nam%';

update thongbao
set rowlabel = char_to_label('ESBD', 'GD:SX,MB,GC:N,T')
where noidung like N'%giám đốc%' and noidung like N'%tất cả lĩnh vực%' and noidung like N'%miền Nam%' and noidung like N'%miền Trung%';

select * from thongbao;

-- Testing the labels
BEGIN
 SA_POLICY_ADMIN.REMOVE_TABLE_POLICY (
  POLICY_NAME    => 'ESBD',
  SCHEMA_NAME    => 'ADMIN', 
  TABLE_NAME     => 'THONGBAO');
END;
/
BEGIN
SA_POLICY_ADMIN.APPLY_TABLE_POLICY
    (policy_name => 'ESBD',
    schema_name => 'ADMIN',
    table_name => 'THONGBAO',
    table_options => 'READ_CONTROL');
END;
/


-- level
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên không phân biệt chi nhánh.');
--insert into thongbao values (N'Thông báo này dành cho tất cả trưởng phòng không phân biệt chi nhánh.');
--insert into thongbao values (N'Thông báo này dành cho tất cả giám đốc không phân biệt chi nhánh: cuối năm nay sẽ thưởng 2 tháng lương.');
--
---- level:compartment
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực mua bán không phân biệt chi nhánh.');
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực sản xuất không phân việt chi nhánh.');
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực gia công không phân biệt chi nhánh.');
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực gia công và sản xuất không phân biệt chi nhánh.');
--
--insert into thongbao values (N'Thông báo này dành cho tất cả trưởng phòng phụ trách lĩnh vực mua bán không phân biệt chi nhánh.');
--insert into thongbao values (N'Thông báo này dành cho tất cả trưởng phòng phụ trách lĩnh vực sản xuất không phân biệt chi nhánh.');
--insert into thongbao values (N'Thông báo này dành cho tất cả trưởng phòng phụ trách lĩnh vực gia công không phân biệt chi nhánh.');
--insert into thongbao values (N'Thông báo này dành cho tất cả trưởng phòng phụ trách lĩnh vực sản xuất và gia công không phân biệt chi nhánh.');
---- cau b
--insert into thongbao values (N'Thông báo này dành cho tất cả trưởng phòng phụ trách tất cả lĩnh vực không phân biệt chi nhánh.');
--
---- level:compartment:group
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực gia công ở miền Bắc.');
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực mua bán ở miền Bắc.');
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực sản xuất ở miền Bắc');
--
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực mua bán ở miền Trung');
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh sản xuất và gia công ở miền Trung');
--
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực gia công ở miền Nam');
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực mua bán ở miền Nam');
--insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực sản xuất ở miền Nam');
--
--insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực gia công ở miền Bắc');
--insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực mua bán ở miền Bắc');
--insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực sản xuất ở miền Bắc');
--
--insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực mua bán ở miền Trung');
---- Cau c
--insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực sản xuất ở miền Trung');
--insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực gia công ở miền Trung');
--insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực gia công và sản xuất ở miền Trung');
--
--insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực mua bán ở miền Nam');
--insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực sản xuất ở miền Nam');
--insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực gia công ở miền Nam');
--insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách tất cả lĩnh vực ở miền Nam');
--insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách tất cả lĩnh vực ở miền Bắc và miền Trung');
--
--insert into thongbao values (N'Thông báo này dành cho giám đốc phụ trách tất cả lĩnh vực ở chi nhánh miền Bắc');
--insert into thongbao values (N'Thông báo này dành cho giám đốc phụ trách tất cả lĩnh vực chi nhánh miền Trung');
--insert into thongbao values (N'Thông báo này dành cho giám đốc phụ trách tất cả lĩnh vực ở chi nhánh miền Nam');
--insert into thongbao values (N'Thông báo này dành cho giám đốc phụ trách quản lý tất cả lĩnh vực chi nhánh miền Nam và miền Trung');