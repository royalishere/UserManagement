create or replace procedure sp_Update_DB_Address_North
as
    cursor cur is ( select NHANVIEN.phg
                    from NHANVIEN
                    where NHANVIEN.phg = 101 or NHANVIEN.phg = 102 or NHANVIEN.phg = 103);
    maphg varchar2(60);
    strSQL varchar2(200);
begin
    open cur;
    loop
        fetch cur into maphg;
        exit when cur%notfound;
        strSQL := 'UPDATE NHANVIEN SET DIACHI = ''BAC'' where NHANVIEN.phg = 101 or NHANVIEN.phg = 102 or NHANVIEN.phg = 103';
        execute immediate(strSQL);
    end loop;
    close cur;
end;
/
execute sp_Update_DB_Address_North;

create or replace procedure sp_Update_DB_Address_South
as
    cursor cur is ( select NHANVIEN.phg
                    from NHANVIEN
                    where NHANVIEN.phg = 104 or NHANVIEN.phg = 105 or NHANVIEN.phg = 106);
    maphg varchar2(60);
    strSQL varchar2(200);
begin
    open cur;
    loop
        fetch cur into maphg;
        exit when cur%notfound;
        strSQL := 'UPDATE NHANVIEN SET DIACHI = ''NAM'' where NHANVIEN.phg = 104 or NHANVIEN.phg = 105 or NHANVIEN.phg = 106';
        execute immediate(strSQL);
    end loop;
    close cur;
end;
/
execute sp_Update_DB_Address_South;

create or replace procedure sp_Update_DB_Address_Central
as
    cursor cur is ( select NHANVIEN.phg
                    from NHANVIEN
                    where NHANVIEN.phg = 107 or NHANVIEN.phg = 108);
    maphg varchar2(60);
    strSQL varchar2(200);
begin
    open cur;
    loop
        fetch cur into maphg;
        exit when cur%notfound;
        strSQL := 'UPDATE NHANVIEN SET DIACHI = ''TRUNG'' where NHANVIEN.phg = 107 or NHANVIEN.phg = 108';
        execute immediate(strSQL);
    end loop;
    close cur;
end;
/
execute sp_Update_DB_Address_Central;

select * from NHANVIEN;