
-- ===========================   YÊU CẦU 4   =================================

-- A. Những người cập nhật thời gian trên quan hệ Phân công
BEGIN 
        DBMS_FGA.add_policy
        (object_schema => 'admin',
        object_name => 'v_phancong',
        policy_name => 'audit_policy_phancong',
        audit_column => 'thoigian',
        statement_types => 'update');
END;
/                                                        
--BEGIN
--        DBMS_FGA.DROP_POLICY (
--        object_schema => 'admin',
--        object_name => 'v_phancong',
--        policy_name => 'audit_policy_phancong'
--        );
--EXCEPTION WHEN OTHERS THEN
--    IF SQLCODE != -28102 THEN
--        RAISE;
--    END IF;
--END;
--/               

-- B. Những người đã đọc trên trường lương và phụ cấp của người khác
-- Không cần biết user đọc Cyphertext hay Plaintext hay VPD đã ẩn - mình vẫn audit lại hành động đọc lương của người khác
-- Admin
-- view admin.nhanvien
BEGIN 
        DBMS_FGA.add_policy
        (object_schema => 'admin',
        object_name => 'v_nhanvien',
        policy_name => 'audit_policy_nhanvien',
        audit_condition => 'manv != user',
        audit_column => 'luong, phucap',
        statement_types => 'select',
        audit_column_opts => DBMS_FGA.ALL_COLUMNS);
END;
/
-- view admin.v_nhansu_nhanvien
BEGIN 
        DBMS_FGA.add_policy
        (object_schema => 'admin',
        object_name => 'v_nhansu_nhanvien',
        policy_name => 'audit_policy_nhanvien1',
        audit_condition => 'manv != user',
        audit_column => 'luong, phucap',
        statement_types => 'select',
        audit_column_opts => DBMS_FGA.ALL_COLUMNS);
END;
/
-- view nam.v_nhanvien
BEGIN 
        DBMS_FGA.add_policy
        (object_schema => 'nam',
        object_name => 'v_nhanvien',
        policy_name => 'audit_policy_nhanvien2',
        audit_condition => 'manv != user',
        audit_column => 'luong, phucap',
        statement_types => 'select',
        audit_column_opts => DBMS_FGA.ALL_COLUMNS);
END;
/

--C. Một người 'không' phải tài chính những đã cập nhật LUONG, PHUCAP thành công
-- Không biết cập nhật gì (thành công hay không thành công), miễn kh phải Tài chính đều audit hành động lại
-- Theo như mình thiết kế chỉ Taid chính cập nhật LUONG, PHUCAP trên view nam.v_nhanvien
-- Nhưng để an toàn nhưng view có thể tác động LUONG, PHUCAP cứ add policy audit. Có điều kiện chọn lọc rồi
BEGIN 
        DBMS_FGA.add_policy
        (object_schema => 'admin',
        object_name => 'v_nhanvien',
        policy_name => 'audit_policy_nhanvien3',
        audit_condition => 'vaitro != ''TAICHINH''',
        audit_column => 'luong, phucap',
        statement_types => 'update',
        audit_column_opts => DBMS_FGA.ALL_COLUMNS);
END;
/
BEGIN 
        DBMS_FGA.add_policy
        (object_schema => 'nam',
        object_name => 'v_own_nhanvien',
        policy_name => 'audit_policy_nhanvien4',
        audit_condition => 'vaitro != ''TAICHINH''',
        audit_column => 'luong, phucap',
        statement_types => 'update',
        audit_column_opts => DBMS_FGA.ALL_COLUMNS);
END;
/
BEGIN 
        DBMS_FGA.add_policy
        (object_schema => 'nam',
        object_name => 'v_nhanvien',
        policy_name => 'audit_policy_nhanvien4',
        audit_condition => 'vaitro != ''TAICHINH''',
        audit_column => 'luong, phucap',
        statement_types => 'update',
        audit_column_opts => DBMS_FGA.ALL_COLUMNS);
END;
/

-- Ví dụ như Giám đốc đã có quyền xem luong, phucap của nhân viên.
-- Tình huống, giám đốc lách quyền vô cập nhật LUONG, PHUCAP
--grant update (luong, phucap) on nam.v_nhanvien to LARI250;
--revoke update on nam.v_nhanvien from LARI250;

connect LARI250/123456
select * from nam.v_nhanvien where manv = 'DARI418';

--connect LARI250/123456
--update nam.v_nhanvien 
--set luong = 636,
--        phucap = 12
--where manv = 'DARI418';

-- D. Kiểm tra nhật ký hệ thống
SELECT AUDIT_TYPE, DBUSERNAME, EVENT_TIMESTAMP, ACTION_NAME, OBJECT_SCHEMA, OBJECT_NAME, SQL_TEXT, FGA_POLICY_NAME
FROM  UNIFIED_AUDIT_TRAIL
ORDER BY EVENT_TIMESTAMP DESC;