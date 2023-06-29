
-- ===========================   YÊU CẦU 1 + 2   =================================

-- NHANVIEN
--      admin.v_nhanvien
--      admin.v_nhansu_nhanvien
--      nam.v_own_nhanvien
--      nam.v_nhanvien

-- ==========================================================================

-- -- ===================== NHAN VIEN  =====================

-- Chính sách1: Mỗi nhân viên select chính nó với LUONG, PHUCAP (Plaintext)
 -- Cấp view nam.v_own_nhanvien cho mọi người 
 -- Select, Update (ngaysinh, diachi, sodt)
 
 -- VIEW DA CHINH SUA THEO DECODE
create or replace view v_nhanvien
as select manv, tennv, phai, ngaysinh, diachi, sodt, 
decode(manv, user, luong, null) luong, 
decode(manv, user, phucap, null) phucap, 
vaitro, manql, phg from admin.nhanvien;

declare
        cursor cur is (select manv
        from admin.nhanvien
        where manv in (SELECT USERNAME
                                from ALL_USERS));                                                
        strSQL varchar2(200);
        usr varchar2(200);
begin
        open cur;
        loop
                fetch cur into usr;
                exit when cur%notfound;
                strSQL := 'grant select on nam.v_own_nhanvien to ' || usr;
                execute immediate(strSQL);
                strSQL := 'grant update (ngaysinh, diachi, sodt) on nam.v_own_nhanvien to ' || usr;
                execute immediate(strSQL);
                strSQL := 'grant select on admin.v_nhanvien to ' || usr;             
                execute immediate(strSQL);
        end loop;
        close cur;
end;
/
-- Chính sách 2: Mỗi nhân viên có thể xem dòng dữ liệu trên table hay view dựa trên vai trò của mình
create or replace function f_nhanvien
        (p_schema varchar2,
        p_object varchar2
) return varchar2
as
        vt admin.nhanvien.vaitro%type;
begin
        if user = 'ADMIN' then return '';
        end if;
        select vaitro into vt from admin.nhanvien where manv = USER;
        if (upper(vt) = 'NHANVIEN' or upper(vt) = 'TRUONGDEAN') then
                return '1 != 1';
       elsif (upper(vt) = 'QLTRUCTIEP') then
                return 'manql = user';
        elsif (upper(vt) = 'TRUONGPHONG') then
                return 'manv != user and phg = sys_context(''ctx_nhanvien'', ''phg'')';
        elsif ( upper(vt) = 'NHANSU' or upper(vt) = 'TAICHINH' or upper(vt) = 'BANGD') then
                return 'manv != user';
        end if;
end;
/

begin
    dbms_rls.drop_policy('admin', 'v_nhanvien', 'policy_nhanvien');
end;

BEGIN
        DBMS_RLS.ADD_POLICY (
        object_schema => 'admin',
        object_name => 'v_nhanvien',
        policy_name => 'policy_nhanvien',
        policy_function => 'f_nhanvien',
        statement_types => 'select',
        sec_relevant_cols => 'LUONG, PHUCAP');
END;
/
-- TEST - SELECT
-- 1. Nhân viên
connect KERR264/123456
update nam.v_own_nhanvien set ngaysinh = '17/OCT/1982';
select * from nam.v_own_nhanvien
union
select * from admin.v_nhanvien;
-- 2. Quản lý trực tiếp
connect ABE421/123456
select * from nam.v_own_nhanvien
union
select * from admin.v_nhanvien;

-- 3. Trưởng phòng
connect LEIL369/123456
select * from nam.v_own_nhanvien
union
select * from admin.v_nhanvien;
-- 4. Tài chính
connect TIMM362/123456
select * from nam.v_own_nhanvien
union
select * from admin.v_nhanvien;

connect TIMM362/123456
select * from nam.v_nhanvien;
-- 5. Nhân sự -- Tại sao mình kh add policy cho nó update trên đây luôn cho dễ => tạo v_nhansu_nhanvien => Thử rồi
connect RIAN234/123456
select * from nam.v_own_nhanvien
union
select * from admin.v_nhanvien;
-- 6. Trưởng đề án
connect BART317/123456
select * from nam.v_own_nhanvien
union
select * from admin.v_nhanvien;
-- 7. Ban giám đốc
connect LARI250/123456
select * from nam.v_own_nhanvien
union
select * from admin.v_nhanvien;

connect LARI250/123456
select * from admin.v_nhanvien;

-- =================================================
-- Nhân sự insert, update
-- Cài trigger insert Luong, phucap = null
-- Update (tennv, phai, ngaysinh, diachi, sodt, vaitro, manql, phg) -- Ngaysinh => trigger
create or replace view v_nhansu_nhanvien
as select * from admin.nhanvien;

declare
        cursor cur is (select manv
        from admin.nhanvien
        where vaitro = 'NHANSU' and manv in (SELECT USERNAME
                                from ALL_USERS));                                                
        strSQL varchar2(200);
        usr varchar2(200);
begin
        open cur;
        loop
                fetch cur into usr;
                exit when cur%notfound;
                strSQL := 'grant  select on admin.v_nhansu_nhanvien to ' || usr;         
                execute immediate(strSQL);
                strSQL := 'grant insert on admin.v_nhansu_nhanvien to ' || usr;
                execute immediate(strSQL);
                strSQL := 'grant update (tennv, phai, ngaysinh, diachi, sodt, vaitro, manql, phg) on v_nhansu_nhanvien to ' || usr;
                execute immediate(strSQL);
        end loop;
        close cur;
end;
/

-- Test nhân sự

-- Select
-- nam.v_own_nhanvien
--      Xem thông tin chính mình
connect RIAN234/123456
select * from nam.v_own_nhanvien

--      Update (tennv, phai, ngaysinh, diachi, sodt, vaitro, manql, phg) thông tin chính mình
connect RIAN234/123456
update nam.v_own_nhanvien
--set diachi = 'Trung'
--set sodt = '081615245'
set ngaysinh = '05-OCT-1952'
;

select * from nhanvien where manv = 'RIAN234';
select * from nam.nhanvien where manv = 'RIAN234';

-- Insert
--  Có quyền thêm nhân viên với LUONG,PHUCAP mặc định là null
connect RIAN234/123456
insert into admin.v_nhansu_nhanvien (manv, tennv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) 
values ('RANA433', 'RANAYA',  'F', '26/SEP/1981', '6 Moutain Court', '0689676776', 1000, 200, 'NHANVIEN', null, 108);

select * from nhanvien where manv = 'RANA433';
select * from nam.nhanvien where manv = 'RANA433';
select * from nam.v_nhanvien where manv = 'RANA433';
select * from nam.quocgia where manv = 'RANA433';

-- Sau đó chỉ có TÀI CHÍNH vô cập nhật luong, phucap cho nhân viên
connect TIMM362/123456
update nam.v_nhanvien 
set luong = 1000,
        phucap = 200
where manv = 'RANA433';

-- Update
-- admin.v_nhansu_nhanvien
-- Nhân sự phải xem được tất cả thuộc tính trừ LUONG, PHUCAP của người khác thì nó mới biết mà cập nhật chứ
connect RIAN234/123456
select * from admin.v_nhansu_nhanvien;

-- Không có quyền cập nhật LUONG,PHUCAP của nhân viên
connect RIAN234/123456
update admin.v_nhansu_nhanvien
set luong = 150
--set phucap = 50
where manv = 'RANA433';

-- Cập nhật (tennv, phai, ngaysinh, diachi, sodt, vaitro, manql, phg)
connect RIAN234/123456
update admin.v_nhansu_nhanvien
--set tennv = 'Ranay'
--set phai = 'F'
set ngaysinh = '25-SEP-1981' -- lỗi rồi cập nhật tự nhiên luong,phucap về null
--set diachi = 'Nam'
--set sodt = '0606869980'
--set vaitro = 'BANGD'
--set phg = 107
where manv = 'RANA433';

select * from nam.quocgia where manv = 'RANA433';
select * from admin.nhanvien where manv = 'RANA433';
select * from nam.nhanvien where manv = 'RANA433';

delete from admin.v_nhansu_nhanvien where manv = 'RANA433';

-- Cài trigger cho insert, update
create or replace trigger trg_nhansu_nhanvien
instead of insert or update or delete
on v_nhansu_nhanvien
for each row
declare 
        l_key RAW(8);
        l_key_xor RAW(8);
        l_luong VARCHAR2(30);
        l_phucap VARCHAR2(30);
begin
        if (inserting) then
                -- Sinh key cho nhân viên mới
                l_key := nam.crypt_util.get_key();
                insert into nam.quocgia (manv, maquocgia) 
                values (:new.manv, l_key);
                -- Nam
                insert into nam.nhanvien
                values (:new.manv, :new.tennv, :new.phai, :new.ngaysinh, :new.diachi, :new.sodt, null, null, :new.vaitro, :new.manql, :new.phg);
                -- Admin                        
                insert into admin.nhanvien
                values (:new.manv, :new.tennv, :new.phai, :new.ngaysinh, :new.diachi, :new.sodt, null, null, :new.vaitro, :new.manql, :new.phg);   
        end if;
        
        if (updating) then
                -- B1: Lấy key ra
                select maquocgia into l_key  from nam.quocgia where manv = :old.manv;
                -- B2: Tính key xor cũ <=> (ngày sinh cũ + key cũ)
                l_key_xor := UTL_RAW.BIT_XOR (l_key, UTL_RAW.cast_to_raw(to_char(extract(day from :old.ngaysinh ))));
                -- B3: Giải mã Luong, phucap. Vì view admin.v_nhansu_nhanvien là Cyphertext
                l_luong := :old.luong;
                l_phucap := :old.phucap;
                -- Cập nhật ngày sinh
                if (:new.ngaysinh != :old.ngaysinh) then
                        l_luong := nam.crypt_util.decrypt(l_luong, l_key_xor);
                        l_phucap := nam.crypt_util.decrypt(l_phucap, l_key_xor);   
                        -- B4: Tính key_xor mới (key_old xor ngaysinh mới)
                        l_key_xor := UTL_RAW.BIT_XOR (l_key, UTL_RAW.cast_to_raw(to_char(EXTRACT(DAY FROM :new.ngaysinh) )));                
                        -- B5: Mã lương, phụ cấp ra chuỗi mới với l_key_xor mới - NEW
                        l_luong := nam.crypt_util.crypt(l_luong, l_key_xor);
                        l_phucap := nam.crypt_util.crypt(l_phucap, l_key_xor);    
                end if;
                -- B6: Cập nhật lương phụ cấp
                -- Nam
                update nam.nhanvien
                set
                        luong = l_luong,
                        phucap = l_phucap,
                        ngaysinh = :new.ngaysinh,
                        phai = :new.phai,
                        diachi = :new.diachi,
                        sodt = :new.sodt,    --DA RUT GON 
                        tennv = :new.tennv,
                        vaitro = :new.vaitro,
                        manql = :new.manql,
                        phg = :new.phg
                where manv = :old.manv;
                -- Admin
                update admin.nhanvien
                set
                        luong = l_luong,
                        phucap = l_phucap,
                        ngaysinh = :new.ngaysinh,
                        phai = :new.phai,
                        diachi = :new.diachi,
                        sodt = :new.sodt,
                        tennv = :new.tennv,
                        vaitro = :new.vaitro,
                        manql = :new.manql,
                        phg = :new.phg
                where manv = :old.manv;  
        end if;
        
        if(deleting) then
            delete from nam.nhanvien where manv = :old.manv;
            delete from admin.nhanvien where manv = :old.manv;
            delete from nam.quocgia where manv = :old.manv;
        end if;
end;
/

-- Tài chính
-- Select: toàn bộ quan hệ nhân viên
-- Update: Luong, phucap của tất cả mọi người

declare
        cursor cur is (select manv
        from admin.nhanvien
        where vaitro = 'TAICHINH' and manv in (SELECT USERNAME
                                from ALL_USERS));                                                
        strSQL varchar2(200);
        usr varchar2(200);
begin
        open cur;
        loop
                fetch cur into usr;
                exit when cur%notfound;
                strSQL := 'grant select on nam.v_nhanvien to ' || usr;             
                execute immediate(strSQL);        
                strSQL := 'grant update (luong, phucap) on nam.v_nhanvien  to ' || usr;         
                execute immediate(strSQL);
        end loop;
        close cur;
end;
/

-- Tài chính select ALL
connect TIMM362/123456
select * from nam.v_nhanvien;

-- Cập nhật (ngaysinh, diachi, sodt) của chính mình nam.v_own_nhanvien

-- Cập nhật lương, phụ cấp của nhân viên trong công ty
connect TIMM362/123456
update nam.v_nhanvien 
set LUONG = 150
where manv = 'VIVA163';

connect TIMM362/123456
update nam.v_nhanvien 
set phucap = 20
where manv = 'VIVA163';

select * from admin.nhanvien where manv = 'VIVA163';
select * from nam.nhanvien where manv = 'VIVA163';
select * from nam.quocgia where manv = 'VIVA163';
select * from nam.v_nhanvien where manv = 'VIVA163'; 

-- Giám đốc
-- Select: toàn bộ quan hệ nhân viên

declare
        cursor cur is (select manv
        from admin.nhanvien
        where vaitro = 'BANGD' and manv in (SELECT USERNAME
                                from ALL_USERS));                                                
        strSQL varchar2(200);
        usr varchar2(200);
begin
        open cur;
        loop
                fetch cur into usr;
                exit when cur%notfound;
                strSQL := 'grant select on nam.v_nhanvien to ' || usr;
                execute immediate(strSQL);
        end loop;
        close cur;
end;
/

connect LARI250/123456
select * from nam.v_nhanvien;

-- Context application
create or replace context ctx_nhanvien using pkg_nhanvien;

create or replace package pkg_nhanvien
as
        procedure conn_count; -- KIEM TRA LUONG DANG NHAP
        procedure set_role;  -- CHO BIET VAI TRO KHI DANG NHAP
        procedure set_deptno;
        procedure clear_deptno;
end pkg_nhanvien;
/

create or replace package body pkg_nhanvien
as
        procedure conn_count as
            c_count number;
        begin
            select count(*) into c_count from v$session where username = user and program not like '%SQL Developer%';
            dbms_session.set_context(namespace => 'ctx_nhanvien', attribute => 'con_count', value => c_count);
        end;
        
        procedure set_role
        as
            u_role varchar2(20);
        begin
        select vaitro into u_role from admin.nhanvien where manv = user;
        dbms_session.set_context(namespace => 'ctx_nhanvien', attribute => 'role', value => u_role);
        exception when no_data_found then
            begin
                DBMS_SESSION.SET_CONTEXT(NAMESPACE => 'ctx_nhanvien',ATTRIBUTE => 'phg', VALUE => null);
            end;
        end;
    
        procedure set_deptno
        as
                l_deptno number;
        begin
                select phg into l_deptno from admin.nhanvien where manv = user;
                DBMS_SESSION.SET_CONTEXT(NAMESPACE => 'ctx_nhanvien',
                                                                ATTRIBUTE => 'phg',
                                                                VALUE => l_deptno);
        exception when no_data_found then
            begin
                DBMS_SESSION.SET_CONTEXT(NAMESPACE => 'ctx_nhanvien',
                                                                ATTRIBUTE => 'phg',
                                                                VALUE => null);
            end;
        end set_deptno;

        procedure clear_deptno
        as
        begin
                DBMS_SESSION.CLEAR_CONTEXT(NAMESPACE => 'ctx_nhanvien', ATTRIBUTE => 'phg');
        end clear_deptno;
end pkg_nhanvien;
/


create or replace trigger trg_nhanvien_phg
after logon on database
begin
        pkg_nhanvien.conn_count;
        pkg_nhanvien.set_deptno;
        pkg_nhanvien.set_role;
end;
/
--drop trigger trg_nhanvien_phg;
-- VPD - PHANCONG
create or replace view phancong
as
select p.*, n.manql, n.phg
from phancong p join nhanvien n on p.manv = n.manv;

declare
        cursor cur is (select manv
        from admin.nhanvien
        where manv in (SELECT USERNAME
                                from ALL_USERS));                                                
        strSQL varchar2(200);
        usr varchar2(200);
begin
        open cur;
        loop
                fetch cur into usr;
                exit when cur%notfound;
                strSQL := 'grant select on admin.phancong to ' || usr;             
                execute immediate(strSQL);
        end loop;
        close cur;
end;
/

create or replace function f_phancong
        (p_schema varchar2,
        p_object varchar2
) return varchar2
as
        vt admin.nhanvien.vaitro%type;
begin
        if user = 'ADMIN' then return '';
        end if;
        select vaitro into vt from admin.nhanvien where manv = USER; 
        if (upper(vt) = 'NHANVIEN' or upper(vt) = 'NHANSU' or upper(vt) = 'TRUONGDEAN') then
                return 'manv = user';
        elsif (upper(vt) = 'QLTRUCTIEP') then
                return 'manv = user or manv in (select manv from admin.nhanvien where manql = user)';
        elsif (upper(vt) = 'TRUONGPHONG') then
                return 'manv in (select manv from admin.v_nhanvien where phg = sys_context(''ctx_nhanvien'', ''phg''))';
        elsif (upper(vt) = 'TAICHINH' or upper(vt) = 'BANGD') then
                return '';
        end if;
end;
/
BEGIN
        DBMS_RLS.ADD_POLICY(
        object_schema => 'admin',
        object_name => 'phancong',
        policy_name => 'policy_phancong',
        policy_function => 'f_phancong',
        statement_types => 'select');
END;
/

-- nhanvien
connect KERR264/123456
select * from admin.phancong;
-- qltructiep
connect ABE421/123456
select * from admin.phancong;
--select manv, mada, thoigian from admin.phancong;
-- truongphong
connect CELI275/123456
select * from admin.phancong;

connect LEIL369/123456
select * from admin.phancong;

-- taichinh
connect TIMM362/123456
select * from admin.phancong;
-- nhansu
connect RIAN234/123456
select * from admin.phancong;
-- truongdean
connect BART317/123456
select * from admin.phancong;
-- bangd
connect LARI250/123456
select * from admin.phancong;

-- Trưởng phòng có thể I,D,U phân công của những nhân viê mà nó làm trưởng phòng
create or replace function f_phancong1
        (p_schema varchar2,
        p_object varchar2
) return varchar2
as
        vt admin.nhanvien.vaitro%type;
begin
        if user = 'ADMIN' then return '';
        end if;

        select vaitro into vt from admin.nhanvien where manv = USER;
        if (upper(vt) = 'TRUONGPHONG') then
                return 'manv in (select manv from admin.v_nhanvien where phg = sys_context(''ctx_nhanvien'', ''phg''))';
        end if;
end;
/

BEGIN
        DBMS_RLS.ADD_POLICY(
        object_schema => 'admin',
        object_name => 'phancong',
        policy_name => 'policy_phancong1',
        policy_function => 'f_phancong1',
        statement_types => 'INSERT, DELETE, UPDATE',
        update_check => TRUE);
END;
/
-- Test
declare
        cursor cur is (select manv
        from admin.nhanvien
        where vaitro = 'TRUONGPHONG' and manv in (SELECT USERNAME
                                from ALL_USERS));                                                
        strSQL varchar2(200);
        usr varchar2(200);
begin
        open cur;
        loop
                fetch cur into usr;
                exit when cur%notfound;
                strSQL := 'grant insert, delete, update on admin.phancong to ' || usr;             
                execute immediate(strSQL);
        end loop;
        close cur;
end;
--/

-- Select
connect LEIL369/123456
select * from admin.phancong;
connect LEIL369/123456
select manv, mada, thoigian from admin.phancong;
-- Insert
-- Insert cùng phòng 103
connect LEIL369/123456
insert into admin.phancong (manv, mada, thoigian)
values ('JANK144', 'PJ03', '15-JUN-2023');

-- Insert khác phòng 103 - problem
    connect LEIL369/123456
insert into admin.phancong
values ('BART317', 'PJ03', '15-JUN-2023');
-- Kiểm tra xem nó có insert
select * from phancong where manv = 'JANK144';
select * from phancong where manv = 'BART317';
-- Update
-- Cùng phòng 103
connect LEIL369/123456
update admin.phancong
set thoigian = '25-JAN-23'
where manv = 'JANK144' and mada = 'PJ06';
-- Khác phòng 103
connect LEIL369/123456
update admin.phancong
set thoigian = '20-JAN-23'
where manv = 'BART317' and mada = 'PJ02';

-- Delete
-- Cùng phòng 103
connect LEIL369/123456
delete from admin.phancong
where manv = 'JANK144' and mada = 'PJ03';
-- Khác phòng 103
connect LEIL369/123456
delete from admin.phancong
where manv = 'BART317' and mada = 'PJ01';

-- VPD - PHONG BAN

declare
        cursor cur is (select manv
        from admin.nhanvien
        where manv in (SELECT USERNAME
                                from ALL_USERS));                                                
        strSQL varchar2(200);
        usr varchar2(200);
begin
        open cur;
        loop
                fetch cur into usr;
                exit when cur%notfound;
                strSQL := 'grant select on admin.phongban to ' || usr;             
                execute immediate(strSQL);
        end loop;
        close cur;
end;
/

-- nhanvien
connect KERR264/123456
select * from admin.phongban;
-- qltructiep
connect ABE421/123456
select * from admin.phongban;
-- truongphong
connect CELI275/123456
select * from admin.phongban;

connect LEIL369/123456
select * from admin.phongban;
-- taichinh
connect TIMM362/123456
select * from admin.phongban;
-- nhansu
connect RIAN234/123456
select * from admin.phongban;
-- truongdean
connect BART317/123456
select * from admin.phongban;
-- bangd
connect LARI250/123456
select * from admin.phongban;

-- RBAC - cho nhansu insert, cập nhật phòng ban
declare
        cursor cur is (select manv
        from admin.nhanvien
        where vaitro = 'NHANSU' and manv in (SELECT USERNAME
                                from ALL_USERS));    
        manv admin.nhanvien.manv%type;
        strSQL varchar2(200);        
begin
        open cur;
        loop
                fetch cur into manv;
                exit when cur%notfound;
                
                strSQL := 'grant insert, update on admin.phongban to ' || manv;
                execute immediate (strSQL);
        end loop;
        close cur;
end;
/

-- VPD - DE AN
declare
        cursor cur is (select manv
        from admin.nhanvien
        where manv in (SELECT USERNAME
                                from ALL_USERS));    
        manv admin.nhanvien.manv%type;
        strSQL varchar2(200);        
begin
        open cur;
        loop
                fetch cur into manv;
                exit when cur%notfound;
                
                strSQL := 'grant select on admin.dean to ' || manv;
                execute immediate (strSQL);
        end loop;
        close cur;
end;
/

-- nhanvien
connect KERR264/123456
select * from admin.dean;
-- qltructiep
connect ABE421/123456
select * from admin.dean;
-- truongphong
connect CELI275/123456
select * from admin.dean;

connect LEIL369/123456
select * from admin.dean;
-- taichinh
connect TIMM362/123456
select * from admin.dean;
-- nhansu
connect RIAN234/123456
select * from admin.dean;
-- truongdean
connect BART317/123456
select * from admin.dean;
-- bangd
connect LARI250/123456
select * from admin.dean;

-- RBAC - cho truongdean insert, cập nhật phòng ban
declare
        cursor cur is (select manv
        from admin.nhanvien
        where vaitro = 'TRUONGDEAN' and manv in (SELECT USERNAME
                                from ALL_USERS));  
        manv admin.nhanvien.manv%type;
        strSQL varchar2(200);        
begin
        open cur;
        loop
                fetch cur into manv;
                exit when cur%notfound;              
                strSQL := 'grant insert, update, delete on dean to ' || manv;
                execute immediate (strSQL);
        end loop;
        close cur;
end;
/

