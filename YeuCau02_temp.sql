
-- =============================   YÊU CẦU 2   =================================
-- Mã hóa mức cơ sở dữ liệu''

--drop table nhanvien;
--drop table temp;
--drop table quocgia;
-- ==========================================================================

-- #######################
-- I. Tạo user NAM - thực hiện xử lý mã hóa
create user NAM identified by 123456;
ALTER USER NAM
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;
ALTER USER NAM QUOTA UNLIMITED ON "USERS";

-- Cấp quyền cho user Nam
grant create session to NAM;
grant create view to NAM;
grant create public synonym to NAM;
grant drop public synonym to NAM;
grant create procedure to NAM;
grant create trigger to NAM;

grant execute on DBMS_CRYPTO to NAM; -- SYS

-- DDL
grant create table to NAM;
grant alter any table to NAM;
grant drop any table to NAM;

-- DML
grant select, insert, update, delete on admin.nhanvien to NAM;


-- #######################
-- II. Xây dựng package mã hóa/ giải mã
-- Gói mã - CRYPT_UTIL
-- 2 bước bảo vệ
-- Đóng gói package - làm rối loạn mã - Util package
-- Dù có key nhưng chưa chắc mã giải được. Sau khi xin khóa, mình XOR với ngày sinh,... Lúc giải cũng vậy

create or replace package crypt_util 
as 
        function crypt (p_str in varchar2, p_key in raw) 
        return raw; 
        function decrypt (p_data in raw, p_key in raw) 
        return varchar2;
        function get_key
        return raw;
end crypt_util;

create or replace package body crypt_util
as
        function crypt (p_str in varchar2, p_key in raw)
        return raw
        as
                encrypted_raw RAW(2048);
        begin
                encrypted_raw := DBMS_CRYPTO.ENCRYPT (src => UTL_RAW.cast_to_raw(p_str),
                                                                                        typ => DBMS_CRYPTO.des_cbc_pkcs5,
                                                                                        key => p_key);
                return encrypted_raw;
        end crypt;
        
        function get_key
        return raw
        as
                l_keyr raw(8);
        begin
                l_keyr := DBMS_CRYPTO.RANDOMBYTES (8);    
                return l_keyr;
        end get_key;
        
        function decrypt (p_data in raw, p_key in raw)
        return VARCHAR2
        as
                decrypted_raw RAW(2048);
        begin
                decrypted_raw := DBMS_CRYPTO.DECRYPT (src => p_data,
                                                                                        typ => DBMS_CRYPTO.des_cbc_pkcs5,
                                                                                        key => p_key);

                return UTL_RAW.cast_to_varchar2(decrypted_raw);
        end decrypt;
end crypt_util;
/

-- #######################
-- III. Thực hiện mã hóa và giải mã dữ liệu

-- 1. Tạo table NAM.temp đổ dữ liệu từ admin.nhavien qua lưu tạm -- Làm xong xóa bảng NAM.TEMP
create table nam.temp
as select * from admin.nhanvien;
--select * from temp;

-- 2. Xóa hết dữ liệu bên admin.nhanvien (Nếu có contraint thì xóa constraint trước)
-- nhanvien(manql) -> nhanvien(manv)
alter table admin.nhanvien
        drop constraint NHANVIEN_FK_NQL;
-- phongban(trphg) -> nhanvien(manv)
alter table admin.phongban
        drop constraint PHONGBAN_FK_TRPHG;
-- phancong(manv) -> nhanvien(manv)
alter table admin.phancong
        drop constraint PHANCONG_FK_NV;
        
truncate table admin.nhanvien;
--select * from admin.nhanvien;

-- Chỉnh sửa lại datatype 2 thuộc tính của admin.nhanvien;
-- Luong, phucap từ NUMBER => VARCHAR2(30)
-- desc admin.nhanvien;
alter table admin.nhanvien
        modify 
         (luong varchar2(30),
         phucap varchar2(30));
--desc admin.nhanvien;         

-- 3. Tạo bảng lưu khóa nam.quocgia và sinh key
-- Tạo bảng lưu key - **** NAM.QUOCGIA **** (NAM)
create table quocgia (
        manv VARCHAR2(7) not null,
        maquocgia RAW(8),
        constraint pk_quocgia primary key(manv)
);

-- Sinh khóa
declare
        cursor cur is select manv from nam.temp;
        key_raw RAW(8);
        manv nam.temp.manv%type;
begin
        open cur;
        loop
                fetch cur into manv;
                exit when cur%notfound;
                key_raw := crypt_util.get_key();
                
                insert into quocgia values (manv, key_raw);
        end loop;
        close cur;
end;
/

--desc nam.quocgia;
--select * from nam.quocgia;

-- 3. Tiến hành mã hóa dữ liệu 

-- BẢNG DỮ LIỆU MÃ HÓA BÊN (NAM)
create table nhanvien (
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

--select * from nhanvien;
--select * from temp;
--select * from quocgia;

insert into nam.nhanvien (manv, tennv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg)
select
        n.manv,
         n.tennv,
         n.phai,
         n.ngaysinh,
         n.diachi,
         n.sodt,
         CAST( crypt_util.crypt(n.Luong, UTL_RAW.BIT_XOR (q.maquocgia, UTL_RAW.cast_to_raw(to_char(EXTRACT(DAY FROM n.ngaysinh) )))) AS varchar2(30) ),
         CAST( crypt_util.crypt(n.Phucap, UTL_RAW.BIT_XOR (q.maquocgia, UTL_RAW.cast_to_raw(to_char(EXTRACT(DAY FROM n.ngaysinh) )))) AS varchar2(30) ),
         n.vaitro,
         n.manql,
         n.phg
from nam.temp n, nam.quocgia q
where n.manv = q.manv;

-- BẢNG MÃ HÓA BÊN (ADMIN)
-- Đổ "Cyphertext" vào table ADMIN.NHANVIEN
insert into admin.nhanvien (manv, tennv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg)
select * from nam.nhanvien;

--select * from nam.nhanvien  where manv = 'VIVA163';
--select * from admin.nhanvien where manv = 'VIVA163';


-- 4. Tạo VIEW giải mã  
-- NAM giữ những VIEW giải mã 
-- ADMIN lấy những view cần thiết bên NAM cấp cho user

-- **** NAM.V_NHANVIEN (nam.nhanvien + nam.quocgia) **** Giải mã FULL
-- View này dùng cho TAICHINH thực thi (Select, Insert,Delete,Update) => cài trigger và BANGD Select
create or replace view nam.v_nhanvien
as 
select
        n.manv, n.tennv,  n.phai, n.ngaysinh, n.diachi, n.sodt,
         CAST( crypt_util.decrypt(n.Luong, UTL_RAW.BIT_XOR (q.maquocgia, UTL_RAW.cast_to_raw(to_char(EXTRACT(DAY FROM n.ngaysinh) )))) AS varchar2(30) ) "LUONG",
         CAST( crypt_util.decrypt(n.Phucap, UTL_RAW.BIT_XOR (q.maquocgia, UTL_RAW.cast_to_raw(to_char(EXTRACT(DAY FROM n.ngaysinh) )))) AS varchar2(30) ) "PHUCAP",
         n.vaitro, n.manql, n.phg
from nam.nhanvien n, nam.quocgia q
where n.manv = q.manv;
--select * from nam.v_nhanvien;


-- **** NAM.V_OWN_NHANVIEN (nam.nhanvien + nam.quocgia) **** View in ra một dòng chính nó với Luong, PhuCap (plaintext) -- 
-- Admin cấp view này cho tất cả nhân viên view này
create or replace view v_own_nhanvien
as 
select
        n.manv, n.tennv, n.phai, n.ngaysinh, n.diachi, n.sodt,
         CAST( crypt_util.decrypt(n.Luong, UTL_RAW.BIT_XOR (q.maquocgia, UTL_RAW.cast_to_raw(to_char(EXTRACT(DAY FROM n.ngaysinh) )))) AS varchar2(30) ) "LUONG",
         CAST( crypt_util.decrypt(n.Phucap, UTL_RAW.BIT_XOR (q.maquocgia, UTL_RAW.cast_to_raw(to_char(EXTRACT(DAY FROM n.ngaysinh) )))) AS varchar2(30) ) "PHUCAP",
         n.vaitro, n.manql, n.phg
from nam.nhanvien n, nam.quocgia q
where n.manv = q.manv and n.manv = USER;

-- OUTPUT: SAU KHI MÃ HÓA VÀ GIẢI MÃ
-- 2 table mã hóa (ADMIN và NAM) -- Mỗi người giữ 1 bảng
select * from admin.nhanvien;
select * from nam.nhanvien;
-- 1 table key -- NAM giữ
select * from nam.quocgia;
--  2 view giải mã NAM giữ -- Admin lấy cấp USER tùy theo chính sách
select * from nam.v_nhanvien;
select * from nam.v_own_nhanvien;


-- IV. Làm trong suốt 2 VIEW để ngta tưởng không có gì - thực hiện thao tác như bình thường

-- 1. VIEW        NAM.V_OWN_NHANVIEN
-- Yêu cầu 1: Tất cả nhân viên được phép cập nhật (ngaysinh, diachi, sodt) của chính mình 
-- Problem: đụng vô ngày sinh viết trigger
-- Do chỉ có quyền update nên chỉ viết trigger update

create or replace trigger trg_update_v_ownnhanvien
instead of update
on v_own_nhanvien
for each row
declare
        l_key RAW(8);
        l_key_xor RAW(8);
        l_luong VARCHAR2(30);
        l_phucap VARCHAR2(30);
begin        
        -- Cập nhật ngày sinh
        if (:new.ngaysinh != :old.ngaysinh) then
                -- B1: Lấy key ra
                select maquocgia into l_key  from nam.quocgia where manv = :old.manv;
                        
                -- B2: Tính key xor cũ <=> (ngày sinh cũ + key cũ)
                l_key_xor := UTL_RAW.BIT_XOR (l_key, UTL_RAW.cast_to_raw(to_char(extract(day from :old.ngaysinh ))));
                
                -- B3: Tính key_xor mới (key_old xor ngaysinh mới)
                l_key_xor := UTL_RAW.BIT_XOR (l_key, UTL_RAW.cast_to_raw(to_char(EXTRACT(DAY FROM :new.ngaysinh) )));
                
                -- B4: Mã lương, phụ cấp ra chuỗi mới với l_key_xor mới - NEW
                l_luong := crypt_util.crypt(:old.luong, l_key_xor);
                l_phucap := crypt_util.crypt(:old.phucap, l_key_xor);
                
                -- B5: Cập nhật lương phụ cấp
                -- Nam
                update nam.nhanvien
                set
                        ngaysinh = :new.ngaysinh,
                        luong = l_luong,
                        phucap = l_phucap
                where manv = :old.manv;
                -- Admin
                update admin.nhanvien
                set
                        ngaysinh = :new.ngaysinh,
                        luong = l_luong,
                        phucap = l_phucap
                where manv = :old.manv;  
          end if;
          
          -- Update diachi
          if (:new.diachi != :old.diachi) then
                -- Nam
                update nam.nhanvien
                set diachi = :new.diachi
                where manv = :old.manv;
                -- Admin
                update admin.nhanvien
                set diachi = :new.diachi
                where manv = :old.manv;                
          end if;
          -- Update Sodt
          if (:new.sodt != :old.sodt) then
                -- Nam
                update nam.nhanvien
                set sodt = :new.sodt
                where manv = :old.manv;
                -- Admin
                update admin.nhanvien
                set sodt = :new.sodt
                where manv = :old.manv;                
          end if;
        -- Update Tennv
        if (:new.tennv != :old.tennv) then
                -- Nam
                update nam.nhanvien
                set tennv = :new.tennv
                where manv = :old.manv;
                -- Admin
                update admin.nhanvien
                set tennv = :new.tennv
                where manv = :old.manv;                
        end if;
        -- Update Phai
        if (:new.phai != :old.phai) then
                -- Nam
                update nam.nhanvien
                set phai = :new.phai
                where manv = :old.manv;
                -- Admin
                update admin.nhanvien
                set phai = :new.phai
                where manv = :old.manv;                
        end if;
        -- Update Vaitro
        if (:new.vaitro != :old.vaitro) then
                -- Nam
                update nam.nhanvien
                set vaitro = :new.vaitro
                where manv = :old.manv;
                -- Admin
                update admin.nhanvien
                set vaitro = :new.vaitro
                where manv = :old.manv;                
        end if;
                -- Update Manql
        if (:new.manql != :old.manql) then
                -- Nam
                update nam.nhanvien
                set manql = :new.manql
                where manv = :old.manv;
                -- Admin
                update admin.nhanvien
                set manql = :new.manql
                where manv = :old.manv;                
        end if;
        -- Update Phg
        if (:new.phg != :old.phg) then
                -- Nam
                update nam.nhanvien
                set phg = :new.phg
                where manv = :old.manv;
                -- Admin
                update admin.nhanvien
                set phg = :new.phg
                where manv = :old.manv;                
        end if;
end;
/

-- A. VIEW        NAM.V_NHANVIEN
-- Yêu cầu 1: Tài chính được phép cập nhật (Luong, Phucap) toan bo nhan vien
-- Problem: đụng vô luong, ngaysinh viết trigger
-- Do chỉ có quyền update nên chỉ viết trigger update
create or replace trigger trg_update_v_nhanvien
instead of update
on nam.v_nhanvien
for each row
declare
        l_key RAW(8);
        l_key_xor RAW(8);
        l_luong VARCHAR2(30);
        l_phucap VARCHAR2(30);
begin
        if (:new.luong != :old.luong or :old.luong is null) then
                -- B1: Lấy key
                select maquocgia into l_key  from nam.quocgia where manv = :old.manv;
                -- B2: Tính key xor
                l_key_xor := UTL_RAW.BIT_XOR (l_key, UTL_RAW.cast_to_raw(to_char(extract(day from :old.ngaysinh ))));
                -- B3: Mã lương mới với key_xor
                l_luong := crypt_util.crypt(:new.luong, l_key_xor);              
                -- B4: Cập nhật lương mới
                -- Nam
                update nam.nhanvien
                set luong = l_luong
                where manv = :old.manv;
                -- Admin
                update admin.nhanvien
                set luong = l_luong
                where manv = :old.manv;
        end if;
        
        if (:new.phucap != :old.phucap or :old.phucap is null) then
                -- B1: Lấy key
                select maquocgia into l_key  from nam.quocgia where manv = :old.manv;
                
                -- B2: Tính key xor
                l_key_xor := UTL_RAW.BIT_XOR (l_key, UTL_RAW.cast_to_raw(to_char(extract(day from :old.ngaysinh ))));

                -- B3: Mã lương mới với key_xor
                l_phucap := crypt_util.crypt(:new.phucap, l_key_xor);

                -- B4: Cập nhật lương mới
                -- Nam
                update nam.nhanvien
                set phucap = l_phucap
                where manv = :old.manv;
                -- Admin
                update admin.nhanvien
                set phucap = l_phucap
                where manv = :old.manv;        
        end if;
end;
/

-- V: Nam thực hiện trả dữ liệu lại như ban đầu 
-- Nam thực hiện tạo lại constraint trên bảng admin.nhanvien trên schema ADMIN
ALTER TABLE ADMIN.NHANVIEN
    ADD CONSTRAINT NHANVIEN_FK_NQL FOREIGN KEY (MANQL) REFERENCES ADMIN.NHANVIEN(MANV);
    
ALTER TABLE ADMIN.PHONGBAN
    ADD CONSTRAINT PHONGBAN_FK_TRPHG FOREIGN KEY (TRPHG) REFERENCES ADMIN.NHANVIEN(MANV);
    
ALTER TABLE ADMIN.PHANCONG
    ADD CONSTRAINT PHANCONG_FK_NV FOREIGN KEY (MANV) REFERENCES ADMIN.NHANVIEN(MANV);

-- VI: Nam xóa bảng temp đã tạo để trung chuyển dữ liệu -- Tránh nhọc nhằng về sau
drop table temp;


-- VI. Thay khóa đồng loạt sau một thời gian - Chiến lược 3-6 tháng thay khóa một lần
create or replace package crypt_manage_key
as
        procedure sinhkhoa;
        procedure thaykhoa;
end;

create or replace package body crypt_manage_key
as        
        procedure sinhkhoa
        as
                cursor cur is select manv from nam.temp;
                key_raw RAW(8);
                manv nam.temp.manv%type;
        begin
                open cur;
                loop
                        fetch cur into manv;
                        exit when cur%notfound;
                        key_raw := crypt_util.get_key();
                
                        insert into quocgia values (manv, key_raw);
                end loop;
                close cur;
        end;
        
        procedure thaykhoa
        as
                cursor cur is select manv, ngaysinh, luong, phucap from nam.nhanvien;
                key_raw RAW(8);
                l_key RAW(8);
                l_key_xor RAW(8);
                l_manv nam.nhanvien.manv%type;
                l_ngaysinh nam.nhanvien.ngaysinh%type;
                l_luong nam.nhanvien.luong%type;
                l_phucap nam.nhanvien.phucap%type;
        begin
                open cur;
                loop
                        fetch cur into l_manv, l_ngaysinh, l_luong, l_phucap;
                        exit when cur%notfound;
                        
                        -- B1: Lấy key cũ 
                        select maquocgia into l_key from nam.quocgia where manv = l_manv;
                        
                        -- B2: Tính key xor
                        l_key_xor := UTL_RAW.BIT_XOR ( l_key, 
                                                                                UTL_RAW.cast_to_raw(to_char(extract(day from l_ngaysinh ))));
                        
                        -- B3: Giải mã - Output Plaintext
                        l_luong := crypt_util.decrypt(l_luong, l_key_xor);
                        l_phucap := crypt_util.decrypt(l_phucap, l_key_xor);
                        
                        --B4: Sinh key mới à tính key_xor mới
                        key_raw := crypt_util.get_key();

                        l_key_xor := UTL_RAW.BIT_XOR ( key_raw,
                                                                                UTL_RAW.cast_to_raw(to_char(extract(day from l_ngaysinh ))));
            
                        -- B5: Mã lương và phụ cấp - Output Cypher text
                        l_luong := crypt_util.crypt(l_luong, l_key_xor);
                        l_phucap := crypt_util.crypt(l_phucap, l_key_xor);

                        -- B5: Lưu key mới, Lương và phụ cấp mã mới
                        -- Nam
                        update nam.quocgia 
                        set maquocgia = key_raw 
                        where manv = l_manv;                       
                       -- Nam
                        update nam.nhanvien
                        set
                                luong = l_luong,
                                phucap = l_phucap
                        where manv = l_manv;
                        -- Admin
                        update admin.nhanvien
                        set
                                luong = l_luong,
                                phucap = l_phucap
                        where manv = l_manv;
                end loop;
                close cur;
        end;
end crypt_manage_key;
/

-- Tạo job 3 tháng chạy một lần