--create ADMIN user
CREATE USER ADMIN IDENTIFIED BY 123456;
GRANT CONNECT, RESOURCE, DBA TO ADMIN;
GRANT ALL PRIVILEGES TO ADMIN;
ALTER USER ADMIN DEFAULT ROLE ALL;

--------------------RUN ONCE-TIME TU DAY------------------------
-- create tables
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
    LUONG NUMBER(10), 
    PHUCAP NUMBER(10), 
    VAITRO VARCHAR2(15) NOT NULL,
    MANQL VARCHAR2(7),
    PHG NUMBER(4),
    -- khoa chinh
    CONSTRAINT NHANVIEN_PK PRIMARY KEY (MANV)
);

ALTER TABLE NHANVIEN
  MODIFY MANQL VARCHAR2(7);

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE PHONGBAN CASCADE CONSTRAINT';
EXCEPTION
    WHEN OTHERS THEN 
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/
CREATE TABLE PHONGBAN (
    MAPB NUMBER(3) NOT NULL,
    TENPB VARCHAR2(50),
    TRPHG VARCHAR(7) NOT NULL,
    -- khoa chinh
    CONSTRAINT PHONGBAN_PK PRIMARY KEY (MAPB)
);

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE DEAN CASCADE CONSTRAINT';
EXCEPTION
    WHEN OTHERS THEN 
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/
CREATE TABLE DEAN (
    MADA VARCHAR2(4) NOT NULL,
    TENDA VARCHAR2(100),
    NGAYBD DATE,
    PHONG NUMBER(4),
    -- khoa chinh
    CONSTRAINT PHONG_PK PRIMARY KEY (MADA)
);

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE PHANCONG CASCADE CONSTRAINT';
EXCEPTION
    WHEN OTHERS THEN 
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/
CREATE TABLE PHANCONG (
    MANV VARCHAR2(7) NOT NULL,
    MADA VARCHAR2(4),
    THOIGIAN DATE,
    -- khoa chinh
    CONSTRAINT PHANCONG_PK PRIMARY KEY (MANV, MADA)
);
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE THONGBAO CASCADE CONSTRAINT';
EXCEPTION
    WHEN OTHERS THEN 
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/
CREATE TABLE THONGBAO (
        NOIDUNG NVARCHAR2(2000)
);
-- insert data into tables
-- NHANVIEN
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Kaycee', 'KAYC433', 'F', '26/SEP/1981', '6 Gina Court', '0689666776', 834, 15, 'BANGD', null, 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ricca', 'RICC407', 'F', '19/APR/1970', '9 Warbler Place', '0845732474', 679, 12, 'BANGD', null, 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Raff', 'RAFF267', 'M', '18/FEB/1961', '2 Sullivan Parkway', '0216770648', 530, 20, 'BANGD', null, 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Brigham', 'BRIG447', 'M', '26/JUN/1954', '4 Main Way', '0852211844', 906, 14, 'BANGD', null, 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Lari', 'LARI250', 'F', '19/DEC/1950', '92366 Waubesa Crossing', '0143560831', 557, 8, 'BANGD', null, 107);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Bartel', 'BART317', 'M', '20/NOV/1957', '6304 Loftsgordon Junction', '0939656751', 377, 12, 'TRUONGDEAN', null, 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Anselma', 'ANSE398', 'F', '18/MAY/1971', '3623 Brown Park', '0556864902', 990, 7, 'TRUONGDEAN', null, 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Erica', 'ERIC413', 'F', '1/JUL/1972', '128 Arizona Trail', '0520795804', 528, 18, 'TRUONGDEAN', null, 103);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Matthaeus', 'MATT112', 'M', '24/OCT/1963', '38 Quincy Park', '0221705454', 906, 18, 'QLTRUCTIEP', null, 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Lianna', 'LIAN235', 'F', '18/OCT/1960', '2077 Sunfield Court', '0881913724', 326, 12, 'QLTRUCTIEP', null, 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Charyl', 'CHAR416', 'F', '18/JUN/1973', '01782 Ronald Regan Crossing', '0478052731', 670, 7, 'QLTRUCTIEP', null, 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Jannel', 'JANN289', 'F', '15/JUL/1956', '59984 Cottonwood Terrace', '0629595133', 804, 8, 'QLTRUCTIEP', null, 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Brew', 'BREW394', 'M', '19/OCT/1971', '031 Morning Lane', '0388537384', 537, 8, 'QLTRUCTIEP', null, 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Frannie', 'FRAN379', 'M', '25/APR/1996', '5514 Ramsey Point', '0618090364', 335, 14, 'QLTRUCTIEP', null, 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ronnie', 'RONN149', 'M', '27/SEP/1998', '49 Ridge Oak Hill', '0606712361', 842, 11, 'QLTRUCTIEP', null, 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Chevy', 'CHEV159', 'M', '27/DEC/1975', '97 1st Point', '0745448458', 660, 5, 'QLTRUCTIEP', null, 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Abe', 'ABE421', 'M', '12/APR/1985', '83 Village Plaza', '0143691824', 519, 13, 'QLTRUCTIEP', null, 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Adaline', 'ADAL197', 'F', '7/DEC/1985', '912 Commercial Trail', '0520998278', 687, 16, 'QLTRUCTIEP', null, 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Candace', 'CAND224', 'F', '6/MAR/1966', '12094 Waxwing Circle', '0187197210', 173, 15, 'QLTRUCTIEP', null, 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Camila', 'CAMI333', 'F', '14/JUN/1985', '893 Main Parkway', '0802512691', 606, 20, 'QLTRUCTIEP', null, 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Merwin', 'MERW327', 'M', '16/OCT/1979', '50161 Vernon Lane', '0161244875', 862, 5, 'QLTRUCTIEP', null, 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Diana', 'DIAN446', 'F', '6/FEB/1984', '4597 Muir Place', '0251513257', 117, 14, 'QLTRUCTIEP', null, 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Juieta', 'JUIE149', 'F', '26/MAY/1988', '90876 Lakewood Gardens Pass', '0702520430', 942, 6, 'QLTRUCTIEP', null, 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Baudoin', 'BAUD110', 'M', '11/APR/1954', '3 Mosinee Plaza', '0735760935', 986, 20, 'QLTRUCTIEP', null, 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Shayne', 'SHAY447', 'F', '30/MAR/1971', '331 Schiller Terrace', '0919012180', 166, 11, 'QLTRUCTIEP', null, 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Bret', 'BRET227', 'M', '29/DEC/1953', '93504 Calypso Center', '0134582231', 533, 7, 'QLTRUCTIEP', null, 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Lorne', 'LORN321', 'F', '24/APR/1972', '1 Hagan Trail', '0431272204', 480, 16, 'QLTRUCTIEP', null, 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Weidar', 'WEID276', 'M', '22/JUN/1951', '3 Cardinal Park', '0628749141', 380, 16, 'QLTRUCTIEP', null, 108);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Barbaraanne', 'BARB396', 'F', '12/APR/1988', '879 Sycamore Point', '0108321220', 830, 5, 'TRUONGPHONG', null, 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Maurizio', 'MAUR325', 'M', '14/MAR/1983', '9031 Carberry Avenue', '0802289311', 958, 16, 'TRUONGPHONG', null, 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Leilah', 'LEIL369', 'F', '14/DEC/1979', '7736 Roth Junction', '0197998326', 135, 8, 'TRUONGPHONG', null, 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Garald', 'GARA176', 'M', '5/SEP/1965', '50134 School Trail', '0163959704', 228, 13, 'TRUONGPHONG', null, 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Gerry', 'GERR263', 'M', '8/APR/1966', '551 Mariners Cove Way', '0930477919', 145, 18, 'TRUONGPHONG', null, 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Wilmar', 'WILM121', 'M', '30/MAR/1978', '7 Jenifer Junction', '0785369083', 366, 17, 'TRUONGPHONG', null, 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Angela', 'ANGE326', 'F', '14/FEB/1958', '35 Swallow Park', '0781730847', 737, 20, 'TRUONGPHONG', null, 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Celie', 'CELI275', 'F', '30/JUN/1961', '5822 Oakridge Court', '0783257498', 612, 15, 'TRUONGPHONG', null, 108);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Kala', 'KALA434', 'F', '28/APR/1951', '07 Forster Center', '0658637716', 250, 12, 'TAICHINH', null, 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Timmi', 'TIMM362', 'F', '23/DEC/1983', '70 Steensland Circle', '0146122425', 314, 12, 'TAICHINH', null, 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ezri', 'EZRI436', 'M', '5/DEC/1950', '7312 Garrison Center', '0689991352', 858, 16, 'TAICHINH', null, 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Johannes', 'JOHA321', 'M', '15/DEC/1989', '62400 South Trail', '0379100141', 626, 10, 'TAICHINH', null, 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Archaimbaud', 'ARCH338', 'M', '17/DEC/1968', '5452 Shasta Center', '0199811792', 546, 6, 'TAICHINH', null, 103);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Rolf', 'ROLF406', 'M', '26/SEP/1987', '798 Clyde Gallagher Way', '0808589012', 857, 10, 'NHANSU', null, 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Adi', 'ADI397', 'F', '4/SEP/1978', '59511 Thackeray Park', '0459187849', 484, 5, 'NHANSU', null, 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Riannon', 'RIAN234', 'F', '7/OCT/1952', '8347 Utah Terrace', '0816152351', 638, 8, 'NHANSU', null, 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Corie', 'CORI191', 'F', '10/NOV/1966', '3 Westport Terrace', '0334835467', 382, 5, 'NHANSU', null, 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ingrid', 'INGR180', 'F', '25/DEC/1994', '697 Arizona Terrace', '0801223891', 520, 17, 'NHANSU', null, 102);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Marco', 'MARC211', 'M', '6/JAN/1996', '5758 Ronald Regan Center', '0100790902', 882, 15, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Rance', 'RANC393', 'M', '28/MAY/1993', '955 Shopko Center', '0204255933', 814, 18, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Gerri', 'GERR315', 'F', '14/DEC/1963', '50592 Lotheville Alley', '0909429914', 347, 12, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Algernon', 'ALGE286', 'M', '10/DEC/1958', '59074 Huxley Junction', '0183423780', 634, 12, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Regen', 'REGE347', 'M', '21/MAR/1981', '7 Dixon Crossing', '0852663512', 124, 17, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Vick', 'VICK395', 'M', '30/MAY/1952', '9248 4th Junction', '0316487708', 544, 11, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Derrik', 'DERR235', 'M', '20/JUN/1981', '1956 Sachtjen Crossing', '0951218294', 464, 10, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Katharine', 'KATH411', 'F', '4/MAR/1958', '0548 Packers Circle', '0498911824', 341, 11, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Alvina', 'ALVI246', 'F', '12/AUG/1961', '6 Lawn Alley', '0338628018', 932, 8, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Millicent', 'MILL419', 'F', '25/AUG/1973', '58389 Rusk Way', '0555125684', 972, 17, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Philip', 'PHIL198', 'M', '2/SEP/1957', '0 Fordem Drive', '0546875426', 669, 12, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Graham', 'GRAH373', 'M', '7/MAR/1994', '9 Dahle Road', '0517543323', 472, 14, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Bard', 'BARD356', 'M', '13/FEB/1993', '17 Sundown Alley', '0468690117', 901, 7, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Danika', 'DANI159', 'F', '31/AUG/1995', '623 Blackbird Place', '0259605436', 126, 7, 'NHANVIEN', 'MATT112', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Eldon', 'ELDO179', 'M', '8/MAY/1989', '6891 Melvin Junction', '0338229951', 994, 10, 'NHANVIEN', 'MATT112', 101);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Gawen', 'GAWE174', 'M', '17/MAR/1963', '097 Farragut Trail', '0836492854', 257, 20, 'NHANVIEN', 'LIAN235', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Egbert', 'EGBE426', 'M', '20/JUL/1951', '6 Nelson Crossing', '0566796835', 805, 5, 'NHANVIEN', 'LIAN235', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Enos', 'ENOS354', 'M', '24/DEC/1992', '309 Mifflin Drive', '0931320401', 749, 16, 'NHANVIEN', 'LIAN235', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Horatia', 'HORA341', 'F', '11/AUG/1967', '6246 Fairfield Parkway', '0519130514', 217, 11, 'NHANVIEN', 'LIAN235', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Petrina', 'PETR334', 'F', '2/OCT/1968', '30972 Eagle Crest Pass', '0962114756', 697, 17, 'NHANVIEN', 'LIAN235', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Urbanus', 'URBA168', 'M', '24/DEC/1997', '71015 Corben Junction', '0122328858', 459, 5, 'NHANVIEN', 'LIAN235', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Roy', 'ROY139', 'M', '17/OCT/1994', '2244 Delaware Circle', '0923182626', 448, 18, 'NHANVIEN', 'LIAN235', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Bastian', 'BAST339', 'M', '31/AUG/1979', '93 Loftsgordon Avenue', '0748357227', 905, 6, 'NHANVIEN', 'LIAN235', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Melloney', 'MELL125', 'F', '20/FEB/1980', '79621 6th Place', '0479207203', 279, 15, 'NHANVIEN', 'LIAN235', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Lulu', 'LULU300', 'F', '5/DEC/1996', '5308 Forster Alley', '0203795991', 364, 9, 'NHANVIEN', 'LIAN235', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Lonna', 'LONN454', 'F', '15/MAR/1958', '33098 Farwell Junction', '0401307301', 398, 19, 'NHANVIEN', 'LIAN235', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Maxy', 'MAXY431', 'F', '25/OCT/1984', '72 Maple Wood Junction', '0753434811', 596, 5, 'NHANVIEN', 'LIAN235', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Modesta', 'MODE197', 'F', '21/SEP/1973', '7808 Texas Lane', '0673302562', 298, 18, 'NHANVIEN', 'LIAN235', 101);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ronni', 'RONN307', 'F', '20/AUG/1984', '34 Granby Pass', '0949218966', 955, 7, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Constanta', 'CONS284', 'F', '7/JUL/1950', '1 Hagan Lane', '0202468430', 537, 15, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Siusan', 'SIUS297', 'F', '14/MAY/1995', '7 Hoffman Avenue', '049611018', 208, 20, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ronny', 'RONN449', 'M', '29/SEP/1978', '307 Green Park', '0551165614', 726, 11, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Netty', 'NETT364', 'F', '4/JUN/1969', '960 Meadow Ridge Pass', '0737852282', 553, 9, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Sadella', 'SADE167', 'F', '15/APR/1984', '9774 Mayfield Hill', '0921474457', 195, 8, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Minda', 'MIND256', 'F', '24/APR/1972', '271 Badeau Circle', '0243446663', 924, 17, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Xavier', 'XAVI177', 'M', '7/SEP/1961', '211 Fuller Lane', '0483296318', 806, 16, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Dougie', 'DOUG371', 'M', '30/OCT/1961', '66 Iowa Point', '0944129342', 824, 19, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Fowler', 'FOWL348', 'M', '13/DEC/1973', '770 Algoma Pass', '0122150532', 735, 14, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Sapphire', 'SAPP365', 'F', '8/MAR/1950', '2343 Cambridge Way', '0589512338', 702, 11, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Wallie', 'WALL218', 'F', '23/DEC/1974', '46911 Fallview Lane', '0617938377', 982, 12, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Arden', 'ARDE182', 'F', '4/FEB/1956', '860 Bultman Street', '0936405214', 480, 18, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Mariel', 'MARI186', 'F', '2/MAY/1974', '574 Parkside Place', '0447211724', 938, 9, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Aube', 'AUBE179', 'M', '20/JUN/1998', '43 Forest Park', '0327608778', 803, 20, 'NHANVIEN', 'CHAR416', 101);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Nan', 'NAN379', 'F', '30/AUG/1970', '20643 Upham Alley', '0981811226', 916, 5, 'NHANVIEN', 'CHAR416', 101);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Allan', 'ALLA375', 'M', '8/SEP/1966', '1 Schiller Road', '0239119705', 815, 13, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Daniele', 'DANI241', 'F', '10/FEB/1955', '0476 Park Meadow Circle', '0518890441', 173, 20, 'NHANVIEN', 'JANN289', 102);
--insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Angel', 'ANGE326', 'F', '25/OCT/1964', '2264 Sutteridge Way', '0212894480', 198, 17, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Hank', 'HANK130', 'M', '26/JUN/1963', '98078 Del Mar Alley', '0358674340', 478, 14, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Abdel', 'ABDE427', 'M', '26/OCT/1971', '1341 Ilene Terrace', '0201872664', 524, 19, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Kerrin', 'KERR140', 'F', '12/OCT/1959', '70 Prentice Avenue', '0156947280', 792, 6, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Codi', 'CODI343', 'M', '30/MAR/1994', '6963 Longview Alley', '0838621292', 127, 12, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Tadio', 'TADI205', 'M', '26/OCT/1975', '31873 Fulton Trail', '0242513873', 456, 9, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Cathrin', 'CATH298', 'F', '29/DEC/1965', '31022 Cambridge Junction', '0817346637', 463, 6, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Fleur', 'FLEU365', 'F', '8/JAN/1951', '59 Melby Junction', '0102137523', 195, 19, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Freida', 'FREI454', 'F', '4/SEP/1967', '90 Bashford Street', '0588387876', 419, 5, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Carmen', 'CARM418', 'F', '6/FEB/1956', '66 Kinsman Parkway', '0279116078', 633, 16, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Alanson', 'ALAN191', 'M', '24/FEB/1956', '5833 Transport Court', '0805038708', 333, 5, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Rolfe', 'ROLF228', 'M', '20/SEP/1988', '77 Starling Street', '0801746608', 994, 14, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Blair', 'BLAI264', 'F', '19/SEP/1963', '82 Elmside Place', '0419929005', 750, 12, 'NHANVIEN', 'JANN289', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Merrie', 'MERR441', 'F', '1/MAR/1994', '9 West Court', '0705327850', 125, 16, 'NHANVIEN', 'JANN289', 102);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ortensia', 'ORTE201', 'F', '16/SEP/1968', '347 Holmberg Alley', '0128481516', 506, 14, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Hurley', 'HURL299', 'M', '5/DEC/1970', '48573 Spaight Center', '0535361779', 178, 12, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Alfons', 'ALFO319', 'M', '29/MAY/1998', '54 Northport Drive', '0174881736', 698, 15, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Alverta', 'ALVE307', 'F', '21/JAN/1969', '1 Schmedeman Road', '0342457664', 300, 11, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Emalee', 'EMAL397', 'F', '8/FEB/1982', '556 Haas Junction', '0852939300', 802, 19, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Terencio', 'TERE422', 'M', '29/APR/1952', '0 Darwin Street', '0727174230', 629, 15, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Catherine', 'CATH409', 'F', '1/MAR/1958', '10252 Fairfield Trail', '0123852925', 479, 8, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Hallie', 'HALL183', 'F', '24/AUG/1954', '1 Menomonie Way', '0558321390', 734, 10, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Almira', 'ALMI433', 'F', '5/MAY/1986', '600 Melby Avenue', '0808868778', 143, 19, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Pammy', 'PAMM350', 'F', '20/JUL/1967', '15 Delladonna Drive', '0710429502', 429, 7, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Florri', 'FLOR426', 'F', '26/APR/1968', '08 Hoepker Plaza', '0732514259', 365, 7, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Kial', 'KIAL286', 'F', '13/SEP/1971', '95503 Eagle Crest Lane', '0429497874', 826, 20, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Jackie', 'JACK170', 'F', '27/JUL/1998', '1288 Center Plaza', '0861618454', 219, 13, 'NHANVIEN', 'BREW394', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Darb', 'DARB200', 'M', '24/FEB/1968', '9557 Coolidge Avenue', '0463731392', 857, 11, 'NHANVIEN', 'BREW394', 102);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Arlana', 'ARLA204', 'F', '13/JAN/1969', '64476 Sunnyside Terrace', '0731599046', 125, 11, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Benedetta', 'BENE427', 'F', '18/OCT/1957', '978 Daystar Plaza', '0285250706', 422, 14, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Chantal', 'CHAN113', 'F', '6/SEP/1982', '439 Spohn Terrace', '0783607254', 117, 14, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Kahaleel', 'KAHA365', 'M', '24/JAN/1961', '6901 Kennedy Drive', '0966609405', 801, 17, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Stacy', 'STAC308', 'M', '12/JUN/1967', '7737 Sullivan Crossing', '0163960049', 318, 7, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Dillon', 'DILL426', 'M', '20/DEC/1997', '9 Di Loreto Alley', '0897830261', 104, 6, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Charmain', 'CHAR251', 'F', '2/FEB/1985', '38429 Crowley Terrace', '0259864249', 412, 13, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Sylvester', 'SYLV389', 'M', '25/MAY/1996', '5 South Circle', '0298771281', 448, 19, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Angelina', 'ANGE438', 'F', '19/DEC/1988', '41 Iowa Court', '0208829664', 212, 7, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Luce', 'LUCE268', 'M', '31/AUG/1986', '51753 Lien Street', '0826991710', 652, 10, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Claribel', 'CLAR431', 'F', '20/OCT/1980', '441 Truax Junction', '0868762721', 907, 6, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Fabe', 'FABE409', 'M', '3/FEB/1961', '869 Burrows Way', '0341685047', 956, 8, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Jacquenetta', 'JACQ332', 'F', '27/JUL/1973', '6 Spaight Park', '0197534475', 564, 14, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ainslie', 'AINS122', 'F', '6/JUN/1968', '1 Maywood Alley', '0643364109', 630, 13, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Janella', 'JANE419', 'F', '29/APR/1950', '31611 Superior Way', '0694808451', 420, 7, 'NHANVIEN', 'FRAN379', 102);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Idaline', 'IDAL414', 'F', '17/SEP/1953', '9 Trailsway Court', '0898168840', 851, 14, 'NHANVIEN', 'FRAN379', 102);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ingrim', 'INGR231', 'M', '18/SEP/1996', '107 Muir Point', '0580664533', 459, 7, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Gratia', 'GRAT386', 'F', '4/MAY/1987', '8191 Esch Terrace', '0385156881', 130, 14, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Peter', 'PETE439', 'M', '27/JUL/1979', '75 Hermina Terrace', '0982294081', 177, 9, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Rancell', 'RANC169', 'M', '15/NOV/1990', '27526 Springview Pass', '0101665496', 955, 14, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Liane', 'LIAN276', 'F', '9/SEP/1987', '6030 Merchant Plaza', '0925786441', 133, 6, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Mitchael', 'MITC173', 'M', '13/SEP/1970', '36246 Ridgeway Parkway', '0247747521', 683, 8, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Marlane', 'MARL289', 'F', '14/JUL/1996', '3972 Carey Pass', '0909596457', 821, 14, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Viva', 'VIVA163', 'F', '18/AUG/1961', '6 Northland Junction', '0115218561', 103, 20, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Madel', 'MADE168', 'F', '4/MAY/1983', '60 Carey Terrace', '0910322773', 160, 6, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Karly', 'KARL327', 'F', '4/SEP/1976', '14 Hooker Way', '0333571322', 285, 15, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Chandra', 'CHAN372', 'F', '2/JUL/1981', '57 Morrow Center', '0441648703', 118, 7, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Moise', 'MOIS149', 'M', '3/MAY/1957', '11030 Grayhawk Park', '0849129905', 561, 11, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Aldon', 'ALDO284', 'M', '4/DEC/1980', '63 Corscot Hill', '0695389441', 902, 8, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Irving', 'IRVI287', 'M', '11/JUL/1963', '6136 Sloan Terrace', '0523387759', 643, 6, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Halette', 'HALE178', 'F', '21/OCT/1974', '92 Meadow Ridge Place', '0886720231', 611, 18, 'NHANVIEN', 'RONN149', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Audrie', 'AUDR427', 'F', '6/MAY/1953', '6 Blaine Way', '0140443778', 155, 17, 'NHANVIEN', 'RONN149', 103);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Conrado', 'CONR223', 'M', '12/OCT/1954', '8 Mallory Circle', '0699796615', 387, 14, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Laina', 'LAIN377', 'F', '13/MAY/1993', '3884 Emmet Circle', '0786470032', 119, 15, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Nora', 'NORA310', 'F', '8/MAY/1971', '7 Myrtle Alley', '0222514415', 561, 13, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Miran', 'MIRA178', 'F', '29/MAR/1954', '6 Utah Place', '0919675027', 544, 14, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Merle', 'MERL169', 'M', '13/FEB/1982', '6433 John Wall Park', '0245970165', 267, 6, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Stillmann', 'STIL272', 'M', '27/JAN/1956', '88138 Dunning Road', '0206441442', 936, 9, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Janka', 'JANK144', 'F', '2/APR/1969', '21448 Briar Crest Drive', '0357094691', 954, 15, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Sande', 'SAND156', 'F', '27/AUG/1973', '450 Melvin Alley', '0530958215', 333, 10, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Cori', 'CORI293', 'M', '28/SEP/1953', '103Summer Ridge Trail', '0673415175', 322, 18, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Sula', 'SULA284', 'F', '23/MAR/1990', '38 Badeau Drive', '0919566487', 903, 7, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Waring', 'WARI404', 'M', '28/JUL/1969', '98 Sommers Junction', '0459697222', 342, 9, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Marillin', 'MARI389', 'F', '29/MAY/1958', '6751 Helena Center', '0751117585', 866, 13, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Robbie', 'ROBB322', 'F', '12/JUN/1984', '09394 Cambridge Hill', '0457323220', 221, 17, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Clotilda', 'CLOT171', 'F', '20/JAN/1958', '00 Ludington Place', '0358309406', 909, 19, 'NHANVIEN', 'ABE421', 103);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Libbey', 'LIBB187', 'F', '12/FEB/1976', '6 Hoard Drive', '0917284297', 940, 5, 'NHANVIEN', 'ABE421', 103);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Dwain', 'DWAI307', 'M', '15/JUN/1967', '4 Golf Course Street', '0218998169', 230, 5, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Laughton', 'LAUG337', 'M', '28/DEC/1998', '748 Parkside Plaza', '0521739995', 894, 15, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Papageno', 'PAPA216', 'M', '17/OCT/1982', '7494 Ridgeview Drive', '0221121508', 918, 19, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Paige', 'PAIG455', 'F', '27/MAR/1979', '4 Logan Terrace', '0537339918', 186, 15, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Barrie', 'BARR182', 'M', '20/JAN/1964', '81370 Lakewood Terrace', '0770651241', 298, 14, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Karee', 'KARE411', 'F', '10/AUG/1990', '4898 Dennis Point', '0104594013', 525, 13, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Malinde', 'MALI274', 'F', '19/SEP/1972', '432 Nancy Pass', '0568919870', 617, 10, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Artemas', 'ARTE423', 'M', '6/APR/1977', '7 Stang Avenue', '0202258020', 330, 15, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Madelyn', 'MADE272', 'F', '5/FEB/1956', '37 Hudson Trail', '0439325587', 576, 9, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Perri', 'PERR228', 'F', '5/JUL/1982', '869 Memorial Crossing', '0470988886', 207, 7, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Mindy', 'MIND413', 'F', '17/MAR/1956', '411 Aberg Junction', '0847701301', 960, 10, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Bidget', 'BIDG373', 'F', '28/JAN/1972', '50736 Northridge Parkway', '0635387803', 285, 8, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Avery', 'AVER191', 'M', '25/FEB/1992', '07 Bluejay Junction', '0399489984', 724, 8, 'NHANVIEN', 'ADAL197', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Meryl', 'MERY203', 'F', '19/APR/1973', '6772 Derek Circle', '0440824990', 563, 5, 'NHANVIEN', 'ADAL197', 104);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Way', 'WAY440', 'M', '15/MAY/1988', '2007 Fisk Crossing', '0189812644', 142, 12, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Dehlia', 'DEHL260', 'F', '27/DEC/1951', '0699 Forest Plaza', '0442845067', 110, 14, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Georges', 'GEOR276', 'M', '14/OCT/1987', '823 Colorado Trail', '0743142682', 582, 10, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Cobbie', 'COBB224', 'M', '16/MAR/1991', '416 Warrior Center', '0558229725', 810, 20, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Frazer', 'FRAZ394', 'M', '14.JUN/1990', '82 Rusk Point', '0302652213', 496, 19, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Bendite', 'BEND398', 'F', '5/MAY/1959', '607 Meadow Valley Terrace', '0618201891', 991, 17, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Katee', 'KATE246', 'F', '2/FEB/1981', '6639 La Follette Way', '0560183048', 647, 9, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Herminia', 'HERM241', 'F', '11/FEB/1980', '3432 Springview Hill', '0262497916', 190, 8, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Audre', 'AUDR343', 'F', '27/AUG/1980', '846 Stephen Lane', '0970102193', 726, 12, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ollie', 'OLLI442', 'F', '12/AUG/1951', '00 Walton Road', '0915770284', 632, 8, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ximenes', 'XIME276', 'M', '20/JUL/1973', '690 Steensland Crossing', '0668607957', 177, 17, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Cy', 'CY198', 'M', '21/JAN/1956', '4581 Nelson Way', '0127607980', 169, 13, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Clovis', 'CLOV424', 'F', '23/OCT/1960', '292 Darwin Junction', '0802495565', 611, 14, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Michael', 'MICH379', 'M', '15/MAY/1973', '87 Ridgeway Street', '0257993104', 795, 5, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Darell', 'DARE236', 'F', '15/SEP/1988', '648 Browning Lane', '0934972515', 639, 6, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Chicky', 'CHIC175', 'F', '6/MAY/1965', '08327 Trailsway Lane', '0791168146', 699, 11, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Kylie', 'KYLI192', 'M', '4/JAN/1968', '8067 Maple Crossing', '0505541433', 446, 9, 'NHANVIEN', 'CAND224', 104);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Lark', 'LARK229', 'F', '18/JUL/1995', '09539 Hanover Park', '0600408236', 775, 12, 'NHANVIEN', 'CAND224', 104);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Jeannette', 'JEAN354', 'F', '31/JAN/1954', '911 Shelley Trail', '0322837275', 230, 10, 'NHANVIEN', 'CAMI333', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Rosabelle', 'ROSA374', 'F', '3/APR/1997', '25 Golf Junction', '0769567499', 355, 16, 'NHANVIEN', 'CAMI333', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Leland', 'LELA256', 'F', '3/FEB/1975', '1 Merry Center', '0949708684', 554, 6, 'NHANVIEN', 'CAMI333', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Winfred', 'WINF317', 'M', '29/SEP/1966', '7760 Norway Maple Road', '0159504022', 518, 19, 'NHANVIEN', 'CAMI333', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Sergio', 'SERG216', 'M', '19/MAR/1969', '38 Forest Run Center', '0758459744', 687, 17, 'NHANVIEN', 'CAMI333', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Carey', 'CARE161', 'M', '2/JUN/1950', '7747 Springs Plaza', '0814541512', 749, 12, 'NHANVIEN', 'CAMI333', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Brinna', 'BRIN340', 'F', '19/MAR/1974', '1 Delladonna Terrace', '0370859646', 877, 11, 'NHANVIEN', 'CAMI333', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Calhoun', 'CALH435', 'M', '11/MAR/1964', '4 Kinsman Alley', '0575225020', 360, 7, 'NHANVIEN', 'CAMI333', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Isidro', 'ISID432', 'M', '21/MAY/1977', '6773 Old Gate Center', '0501590396', 304, 11, 'NHANVIEN', 'CAMI333', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Joline', 'JOLI306', 'F', '4/MAR/1965', '0 Manley Drive', '0330310537', 612, 15, 'NHANVIEN', 'CAMI333', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Alastair', 'ALAS144', 'M', '16/MAR/1968', '51666 Pepper Wood Way', '0332639660', 224, 20, 'NHANVIEN', 'CAMI333', 105);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Dieter', 'DIET343', 'M', '7/SEP/1956', '98188 Reindahl Trail', '0257563529', 783, 18, 'NHANVIEN', 'MERW327', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Emera', 'EMER454', 'F', '9/DEC/1975', '69 Lerdahl Way', '0398496580', 143, 12, 'NHANVIEN', 'MERW327', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Dennis', 'DENN214', 'M', '28/APR/1991', '6 Schiller Trail', '0132626630', 256, 16, 'NHANVIEN', 'MERW327', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ashley', 'ASHL173', 'M', '16/APR/1963', '32 Schlimgen Hill', '0477994896', 747, 20, 'NHANVIEN', 'MERW327', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Wilhelmina', 'WILH165', 'F', '24/AUG/1953', '91995 Florence Lane', '0898833509', 831, 19, 'NHANVIEN', 'MERW327', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Rozalie', 'ROZA264', 'F', '13/FEB/1969', '6930 Moulton Pass', '0562477761', 254, 17, 'NHANVIEN', 'MERW327', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Daveta', 'DAVE180', 'F', '21/DEC/1971', '105 Gerald Plaza', '0957216861', 891, 9, 'NHANVIEN', 'MERW327', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Tedi', 'TEDI370', 'F', '19/APR/1964', '74730 Artisan Pass', '0632672267', 820, 9, 'NHANVIEN', 'MERW327', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Timotheus', 'TIMO231', 'M', '2/MAY/1968', '34528 Sheridan Parkway', '0763292095', 883, 18, 'NHANVIEN', 'MERW327', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Renate', 'RENA276', 'F', '15/FEB/1996', '0 Rusk Park', '0353658415', 172, 7, 'NHANVIEN', 'MERW327', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Carmine', 'CARM440', 'M', '4/FEB/1990', '14886 Eggendart Court', '0509391050', 763, 5, 'NHANVIEN', 'MERW327', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Frasquito', 'FRAS202', 'M', '30/MAR/1994', '4 Donald Park', '0627320569', 545, 14, 'NHANVIEN', 'MERW327', 105);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Lianna', 'LIAN129', 'F', '13/JAN/1951', '76105 Porter Circle', '0658822519', 595, 10, 'NHANVIEN', 'MERW327', 105);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Euphemia', 'EUPH254', 'F', '8/OCT/1993', '930 Lukken Center', '0612174761', 178, 18, 'NHANVIEN', 'DIAN446', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Gerladina', 'GERL234', 'F', '12/FEB/1963', '852 Melby Center', '0460439167', 852, 12, 'NHANVIEN', 'DIAN446', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Nikos', 'NIKO425', 'M', '10/FEB/1985', '79 Golden Leaf Terrace', '0677996531', 901, 16, 'NHANVIEN', 'DIAN446', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Kinny', 'KINN169', 'M', '21/JAN/1951', '07 Declaration Pass', '0517776418', 189, 15, 'NHANVIEN', 'DIAN446', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Benn', 'BENN334', 'M', '2/AUG/1975', '574 Tomscot Avenue', '0628969611', 972, 6, 'NHANVIEN', 'DIAN446', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Jeno', 'JENO451', 'M', '26/JUN/1996', '187 Jay Street', '0684149351', 792, 9, 'NHANVIEN', 'DIAN446', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ailyn', 'AILY140', 'F', '1/MAR/1997', '8742 Montana Street', '0124260883', 704, 20, 'NHANVIEN', 'DIAN446', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Hashim', 'HASH127', 'M', '4/JUL/1996', '52 Burrows Center', '0640408080', 371, 15, 'NHANVIEN', 'DIAN446', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Stephan', 'STEP435', 'M', '27/DEC/1952', '1 Hovde Street', '0931152480', 837, 16, 'NHANVIEN', 'DIAN446', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Lauraine', 'LAUR265', 'F', '30/DEC/1958', '967 East Junction', '0437832543', 252, 5, 'NHANVIEN', 'DIAN446', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Aron', 'ARON366', 'M', '14/JUL/1996', '277 Moose Circle', '0870280058', 586, 7, 'NHANVIEN', 'DIAN446', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Stephan', 'STEP394', 'M', '5/OCT/1988', '84487 Walton Crossing', '0379465427', 790, 14, 'NHANVIEN', 'DIAN446', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Amanda', 'AMAN382', 'F', '8/DEC/1972', '345 Schurz Point', '0791838949', 112, 10, 'NHANVIEN', 'DIAN446', 106);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ede', 'EDE404', 'F', '16/JUN/1971', '681 Jenna Pass', '0334109483', 932, 14, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Yulma', 'YULM395', 'M', '3/DEC/1980', '7556 Calypso Terrace', '0799028808', 763, 12, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Riva', 'RIVA148', 'F', '28/FEB/1978', '60 Hudson Park', '0339924909', 459, 6, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Brucie', 'BRUC131', 'M', '22/APR/1965', '3349 Dayton Plaza', '0118106832', 332, 15, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Carmelina', 'CARM372', 'F', '1/OCT/1951', '2037 Butterfield Park', '0235286775', 553, 11, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Nadeen', 'NADE336', 'F', '9/SEP/1965', '18723 Loomis Way', '0591939842', 526, 19, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Elvin', 'ELVI361', 'M', '11/AUG/1995', '9 Lakeland Crossing', '0396287034', 906, 20, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Earle', 'EARL139', 'M', '23/OCT/1985', '3 Crowley Terrace', '0371928355', 634, 14, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Huntington', 'HUNT403', 'M', '20/MAY/1957', '74602 Namekagon Road', '0674564880', 158, 7, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Taffy', 'TAFF142', 'F', '9/DEC/1997', '9 Boyd Pass', '0668638977', 704, 18, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Bennett', 'BENN383', 'M', '14/OCT/1967', '17863 Scott Hill', '0698663393', 278, 11, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Fern', 'FERN452', 'F', '4/JAN/1972', '8764 Grayhawk Parkway', '0147723511', 292, 17, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Lenora', 'LENO135', 'F', '14/DEC/1991', '616 Karstens Park', '0416891636', 239, 10, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Sampson', 'SAMP262', 'M', '16/SEP/1993', '54 Alpine Hill', '0604595333', 513, 11, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Wilbert', 'WILB150', 'M', '1/FEB/1989', '8 Maple Crossing', '0990722575', 526, 12, 'NHANVIEN', 'JUIE149', 106);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Findley', 'FIND384', 'M', '27/JUN/1983', '92 School Drive', '0314272030', 812, 17, 'NHANVIEN', 'JUIE149', 106);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Gage', 'GAGE198', 'M', '28/AUG/1995', '46 Chinook Junction', '0272179927', 546, 7, 'NHANVIEN', 'BAUD110', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Hilde', 'HILD233', 'F', '9/FEB/1959', '060 Swallow Plaza', '0546591515', 250, 15, 'NHANVIEN', 'BAUD110', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Micheal', 'MICH123', 'M', '21/DEC/1985', '9 Fordem Road', '0471999025', 843, 11, 'NHANVIEN', 'BAUD110', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Brok', 'BROK169', 'M', '5/AUG/1996', '41720 Ramsey Way', '0965518353', 240, 8, 'NHANVIEN', 'BAUD110', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Jedd', 'JEDD254', 'M', '24/MAR/1989', '8 Kedzie Street', '0317148930', 349, 7, 'NHANVIEN', 'BAUD110', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Lydie', 'LYDI205', 'F', '2/MAR/1989', '44 Prentice Place', '0423238515', 268, 14, 'NHANVIEN', 'BAUD110', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Hadley', 'HADL302', 'M', '6/DEC/1994', '3265 Namekagon Center', '0878464148', 320, 18, 'NHANVIEN', 'BAUD110', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Adlai', 'ADLA396', 'M', '3/SEP/1994', '021 Thackeray Lane', '0419230855', 590, 17, 'NHANVIEN', 'BAUD110', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Carrie', 'CARR121', 'F', '29/DEC/1973', '93657 Goodland Point', '0423124621', 430, 14, 'NHANVIEN', 'BAUD110', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Tansy', 'TANS454', 'F', '11/JUL/1991', '560 Bunker Hill Point', '0830599136', 413, 14, 'NHANVIEN', 'BAUD110', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Adela', 'ADEL399', 'F', '29/SEP/1961', '07 Petterle Drive', '0983531264', 234, 20, 'NHANVIEN', 'BAUD110', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Britni', 'BRIT182', 'F', '9/MAR/1955', '837 Amoth Drive', '0776178840', 245, 16, 'NHANVIEN', 'BAUD110', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Melinda', 'MELI298', 'F', '8/JUN/1996', '1 Cherokee Place', '0652219044', 986, 6, 'NHANVIEN', 'BAUD110', 107);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Normie', 'NORM209', 'M', '29/FEB/1984', '8589 American Ash Circle', '0845857312', 791, 19, 'NHANVIEN', 'SHAY447', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Roselia', 'ROSE227', 'F', '16/JUN/1988', '97 Scoville Hill', '0287398379', 561, 12, 'NHANVIEN', 'SHAY447', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Camila', 'CAMI425', 'F', '3/MAY/1977', '1878 Northland Place', '0171286165', 820, 20, 'NHANVIEN', 'SHAY447', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Walden', 'WALD112', 'M', '8/OCT/1994', '7 Toban Way', '0698982996', 934, 5, 'NHANVIEN', 'SHAY447', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Corbett', 'CORB122', 'M', '23/MAR/1952', '60014 Bashford Street', '0474637949', 697, 8, 'NHANVIEN', 'SHAY447', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Bordy', 'BORD188', 'M', '5/MAY/1981', '48 Merry Parkway', '0870948276', 814, 16, 'NHANVIEN', 'SHAY447', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Anjela', 'ANJE224', 'F', '24/SEP/1966', '7 Truax Circle', '0785145745', 885, 9, 'NHANVIEN', 'SHAY447', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Orin', 'ORIN348', 'M', '23/APR/1967', '149 Tennessee Alley', '0713336974', 627, 15, 'NHANVIEN', 'SHAY447', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Cletus', 'CLET159', 'M', '24/APR/1995', '5 Ohio Plaza', '0861680846', 524, 18, 'NHANVIEN', 'SHAY447', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Moishe', 'MOIS126', 'M', '24/DEC/1983', '20973 Lillian Center', '0298039162', 664, 8, 'NHANVIEN', 'SHAY447', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Cornie', 'CORN437', 'M', '10/JUL/1996', '502 Colorado Parkway', '0636677194', 259, 15, 'NHANVIEN', 'SHAY447', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Modestine', 'MODE323', 'F', '8/SEP/1992', '663 Monterey Center', '0381968309', 626, 10, 'NHANVIEN', 'SHAY447', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Darius', 'DARI418', 'M', '24/DEC/1988', '7935 Texas Alley', '0207921440', 636, 6, 'NHANVIEN', 'SHAY447', 107);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Adrian', 'ADRI188', 'M', '30/OCT/1972', '06 Esker Road', '0680663051', 606, 15, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Min', 'MIN267', 'F', '27/SEP/1993', '25 Northview Road', '0344744433', 894, 17, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Joela', 'JOEL159', 'F', '25/JUN/1990', '08765 Iowa Crossing', '0201435302', 711, 5, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Mercedes', 'MERC424', 'F', '12/JUL/1959', '7 Fuller Junction', '0443794709', 720, 10, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Hadrian', 'HADR252', 'M', '23/DEC/1958', '1301 Basil Junction', '0521232671', 175, 6, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Alvis', 'ALVI145', 'M', '13/JAN/1985', '66 Carpenter Point', '0272319134', 586, 6, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Kasey', 'KASE194', 'F', '16/OCT/1969', '9276 Northwestern Plaza', '0323934127', 238, 17, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Odille', 'ODIL273', 'F', '4/FEB/1954', '9624 Crownhardt Hill', '0324351300', 247, 9, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Gladi', 'GLAD244', 'F', '12/MAY/1957', '8 Stoughton Drive', '0125345258', 277, 9, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Susi', 'SUSI403', 'F', '15/NOV/1968', '406 Del Mar Center', '0768129192', 659, 5, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Cyndie', 'CYND194', 'F', '1/JAN/1965', '348 Marcy Circle', '0209355403', 853, 20, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Wallis', 'WALL187', 'F', '7/AUG/1997', '682 Quincy Point', '0562374247', 417, 19, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Gustavo', 'GUST206', 'M', '18/OCT/1988', '411 Cottonwood Alley', '0617823813', 341, 19, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Cthrine', 'CTHR353', 'F', '30/SEP/1968', '1077 Bultman Drive', '0699827621', 343, 17, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Kirby', 'KIRB442', 'F', '2/MAY/1961', '7 Waubesa Center', '0571797551', 679, 14, 'NHANVIEN', 'BRET227', 107);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Stanly', 'STAN338', 'M', '19/JAN/1998', '23505 Carpenter Parkway', '0684590580', 368, 12, 'NHANVIEN', 'BRET227', 107);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Austine', 'AUST301', 'F', '9/AUG/1994', '4648 Buell Junction', '0439713091', 643, 18, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Pen', 'PEN189', 'M', '1/FEB/1984', '59970 Pleasure Alley', '0687194011', 225, 12, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Leanora', 'LEAN270', 'F', '7/JUN/1955', '7 Manufacturers Court', '0755145389', 638, 18, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Fedora', 'FEDO393', 'F', '1/MAR/1955', '97319 Melody Circle', '0747268337', 458, 6, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Donnell', 'DONN165', 'M', '29/JAN/1973', '4361 Tennessee Pass', '0866471450', 428, 13, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Jeremias', 'JERE453', 'M', '12/MAY/1963', '45 Utah Plaza', '0585628042', 460, 10, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Cory', 'CORY147', 'M', '1/NOV/1976', '59167 7th Crossing', '0223510737', 372, 11, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Rudolf', 'RUDO272', 'M', '9/JUN/1994', '0297 Cascade Pass', '0611129039', 926, 8, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Curr', 'CURR140', 'M', '22/JUL/1989', '3 Shopko Crossing', '0754664732', 866, 15, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Miquela', 'MIQU234', 'F', '14/SEP/1998', '4548 Darwin Pass', '0494740422', 633, 8, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Giffer', 'GIFF452', 'M', '1/MAR/1971', '9 Gerald Plaza', '0770818884', 502, 10, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Temp', 'TEMP336', 'M', '3/FEB/1993', '487 Clove Center', '0175608979', 320, 8, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Addie', 'ADDI239', 'F', '5/JAN/1994', '45 Westridge Road', '0786349929', 993, 14, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ebony', 'EBON310', 'F', '14/APR/1973', '5 Manitowish Road', '0786164486', 410, 15, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Norrie', 'NORR329', 'F', '15/JAN/1976', '4400 West Parkway', '0441576001', 346, 16, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Cristobal', 'CRIS261', 'M', '31/MAR/1974', '51 Fair Oaks Street', '0122337168', 162, 16, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Rawley', 'RAWL331', 'M', '5/OCT/1987', '922 Lighthouse Bay Court', '0926605399', 827, 8, 'NHANVIEN', 'LORN321', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Esme', 'ESME132', 'M', '20/OCT/1985', '2075 Pennsylvania Court', '0498049828', 604, 18, 'NHANVIEN', 'LORN321', 108);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Chloe', 'CHLO263', 'F', '8/JUN/1972', '44 8th Junction', '0289408357', 880, 9, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Sarge', 'SARG187', 'M', '19/MAR/1953', '63 Eagan Junction', '0975665724', 895, 11, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Mersey', 'MERS188', 'F', '11/APR/1972', '17643 Mayfield Street', '0720261459', 566, 6, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Prudence', 'PRUD253', 'F', '10/JAN/1950', '528 Nancy Drive', '0687810857', 526, 8, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Augusta', 'AUGU161', 'F', '23/MAY/1975', '872 Anhalt Terrace', '0606391108', 246, 9, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Tonnie', 'TONN315', 'M', '7/JUN/1974', '8657 Chinook Street', '0863843975', 926, 19, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Jerrie', 'JERR238', 'F', '27/SEP/1992', '1253 Sage Trail', '0261281295', 598, 19, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Iona', 'IONA192', 'F', '24/APR/1997', '67 Crownhardt Lane', '0148874319', 426, 20, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Sheffield', 'SHEF241', 'M', '4/JUN/1959', '7020 Washington Avenue', '0473630884', 835, 8, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Frasco', 'FRAS405', 'M', '7/MAR/1978', '460 Surrey Center', '0267163360', 812, 12, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Ogdan', 'OGDA438', 'M', '19/JUL/1996', '4 Dayton Point', '0509203180', 407, 11, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Esteban', 'ESTE441', 'M', '15/FEB/1962', '498 Mandrake Plaza', '0859258768', 188, 19, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Albertine', 'ALBE181', 'F', '24/JAN/1988', '3 Loftsgordon Drive', '0591655601', 910, 11, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Jabez', 'JABE276', 'M', '21/NOV/1988', '9 Cordelia Plaza', '0556381212', 688, 11, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Stacee', 'STAC250', 'M', '10/JAN/1955', '84 Pierstorff Plaza', '0493445355', 816, 15, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Shelly', 'SHEL404', 'F', '18/JUN/1990', '8271 Claremont Road', '0428554322', 510, 12, 'NHANVIEN', 'WEID276', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Tonia', 'TONI252', 'F', '1/MAY/1953', '2 Mifflin Road', '0622458132', 659, 5, 'NHANVIEN', 'WEID276', 108);

insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Vallie', 'VALL373', 'F', '23/SEP/1993', '05891 Mallard Court', '0154375818', 433, 15, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Noll', 'NOLL373', 'M', '13/APR/1953', '2 Longview Alley', '0491449015', 583, 15, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Cassius', 'CASS360', 'M', '24/JUL/1955', '13 Mallory Junction', '0510836502', 390, 14, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Jamison', 'JAMI360', 'M', '17/AUG/1978', '2476 Fieldstone Hill', '0488478224', 699, 16, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Nari', 'NARI220', 'F', '10/MAY/1973', '189 Anderson Center', '0539234473', 547, 5, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Bram', 'BRAM252', 'M', '10/MAR/1998', '48 Vidon Parkway', '0628936699', 569, 5, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Free', 'FREE369', 'M', '21/APR/1970', '976 Stang Way', '0736408082', 818, 14, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Burt', 'BURT229', 'M', '18/SEP/1957', '9 Meadow Ridge Junction', '0711844946', 280, 17, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Jeffie', 'JEFF122', 'M', '24/AUG/1968', '14436 Maryland Center', '0374807448', 709, 8, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Carly', 'CARL363', 'M', '31/JUL/1969', '250 Straubel Alley', '0113308151', 544, 16, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Donny', 'DONN334', 'M', '24/JUL/1986', '6131 Golf View Trail', '0114797831', 411, 14, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Kerr', 'KERR264', 'M', '16/JUL/1982', '30 Golden Leaf Trail', '0606869963', 170, 12, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Barnabas', 'BARN315', 'M', '7/MAR/1960', '70008 Kedzie Way', '0761668013', 877, 18, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Britt', 'BRIT255', 'F', '12/NOV/1984', '0939 Independence Way', '0604048202', 224, 16, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Kevin', 'KEVI304', 'M', '29/SEP/1975', '07 Fieldstone Plaza', '0959990626', 775, 14, 'NHANVIEN', 'CHEV159', 108);
insert into NHANVIEN (tennv, manv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phg) values ('Babs', 'BABS271', 'F', '29/DEC/1997', '22665 Thompson Parkway', '0301853814', 557, 15, 'NHANVIEN', 'CHEV159', 108);

INSERT INTO DEAN VALUES('PJ01', 'Warehouse maintenance', '03/FEB/2022', 101);
INSERT INTO DEAN VALUES('PJ02', 'Weekly financial report', '10/FEB/2022', 101);
INSERT INTO DEAN VALUES('PJ03', 'New product improvement', '20/JAN/2022', 102);
INSERT INTO DEAN VALUES('PJ04', 'Executive Board Meeting', '21/FEB/2022', 102);
INSERT INTO DEAN VALUES('PJ05', 'Promote advertising campaign', '06/APR/2022', 103);
INSERT INTO DEAN VALUES('PJ06', 'Seek for potential candidates', '02/APR/2022', 103);

INSERT INTO PHANCONG VALUES('BART317', 'PJ01', '18/JAN/2023');
INSERT INTO PHANCONG VALUES('BART317', 'PJ02', '20/JAN/2023');
INSERT INTO PHANCONG VALUES('EGBE426', 'PJ01', '18/MAR/2023');
INSERT INTO PHANCONG VALUES('ENOS354', 'PJ02', '20/MAR/2023');
INSERT INTO PHANCONG VALUES('HORA341', 'PJ01', '19/MAR/2023');
INSERT INTO PHANCONG VALUES('PETR334', 'PJ02', '24/JAN/2023');
INSERT INTO PHANCONG VALUES('URBA168', 'PJ01', '18/JAN/2023');
INSERT INTO PHANCONG VALUES('ANSE398', 'PJ03', '21/JAN/2023');
INSERT INTO PHANCONG VALUES('ANSE398', 'PJ04', '06/APR/2023');
INSERT INTO PHANCONG VALUES('ORTE201', 'PJ03', '21/JAN/2023');
INSERT INTO PHANCONG VALUES('HURL299', 'PJ04', '06/APR/2023');
INSERT INTO PHANCONG VALUES('ALFO319', 'PJ03', '21/JAN/2023');
INSERT INTO PHANCONG VALUES('EMAL397', 'PJ04', '06/APR/2023');
INSERT INTO PHANCONG VALUES('ERIC413', 'PJ05', '03/APR/2023');
INSERT INTO PHANCONG VALUES('ERIC413', 'PJ06', '18/JAN/2023');
INSERT INTO PHANCONG VALUES('CONR223', 'PJ05', '08/APR/2023');
INSERT INTO PHANCONG VALUES('LAIN377', 'PJ06', '15/JAN/2023');
INSERT INTO PHANCONG VALUES('NORA310', 'PJ05', '30/APR/2023');
INSERT INTO PHANCONG VALUES('MIRA178', 'PJ06', '12/JAN/2023');
INSERT INTO PHANCONG VALUES('MERL169', 'PJ05', '13/APR/2023');
INSERT INTO PHANCONG VALUES('JANK144', 'PJ06', '20/JAN/2023');

insert into PHONGBAN (MAPB, TENPB, TRPHG) values (101,'Phong 101', 'BARB396');
insert into PHONGBAN (MAPB, TENPB, TRPHG) values (102,'Phong 102', 'MAUR325');
insert into PHONGBAN (MAPB, TENPB, TRPHG) values (103,'Phong 103', 'LEIL369');
insert into PHONGBAN (MAPB, TENPB, TRPHG) values (104,'Phong 104', 'GARA176');
insert into PHONGBAN (MAPB, TENPB, TRPHG) values (105,'Phong 105', 'GERR263');
insert into PHONGBAN (MAPB, TENPB, TRPHG) values (106,'Phong 106', 'WILM121');
insert into PHONGBAN (MAPB, TENPB, TRPHG) values (107,'Phong 107', 'ANGE326');
insert into PHONGBAN (MAPB, TENPB, TRPHG) values (108,'Phong 108', 'CELI275');
-- CHINH SACH OLS
--level
insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên không phân biệt chi nhánh.');
insert into thongbao values (N'Thông báo này dành cho tất cả trưởng phòng không phân biệt chi nhánh.');
insert into thongbao values (N'Thông báo này dành cho tất cả giám đốc không phân biệt chi nhánh: cuối năm nay sẽ thưởng 2 tháng lương.');

-- level:compartment
insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực mua bán không phân biệt chi nhánh.');
insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực sản xuất không phân việt chi nhánh.');
insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực gia công không phân biệt chi nhánh.');
insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực gia công và sản xuất không phân biệt chi nhánh.');

insert into thongbao values (N'Thông báo này dành cho tất cả trưởng phòng phụ trách lĩnh vực mua bán không phân biệt chi nhánh.');
insert into thongbao values (N'Thông báo này dành cho tất cả trưởng phòng phụ trách lĩnh vực sản xuất không phân biệt chi nhánh.');
insert into thongbao values (N'Thông báo này dành cho tất cả trưởng phòng phụ trách lĩnh vực gia công không phân biệt chi nhánh.');
insert into thongbao values (N'Thông báo này dành cho tất cả trưởng phòng phụ trách lĩnh vực sản xuất và gia công không phân biệt chi nhánh.');
-- cau b
insert into thongbao values (N'Thông báo này dành cho tất cả trưởng phòng phụ trách tất cả lĩnh vực không phân biệt chi nhánh.');

-- level:compartment:group
insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực gia công ở miền Bắc.');
insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực mua bán ở miền Bắc.');
insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực sản xuất ở miền Bắc');

insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực mua bán ở miền Trung');
insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh sản xuất và gia công ở miền Trung');

insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực gia công ở miền Nam');
insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực mua bán ở miền Nam');
insert into thongbao values (N'Thông báo này dành cho tất cả nhân viên làm trong lĩnh vực sản xuất ở miền Nam');

insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực gia công ở miền Bắc');
insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực mua bán ở miền Bắc');
insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực sản xuất ở miền Bắc');

insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực mua bán ở miền Trung');
-- Cau c
insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực sản xuất ở miền Trung');
insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực gia công ở miền Trung');
insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực gia công và sản xuất ở miền Trung');

insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực mua bán ở miền Nam');
insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực sản xuất ở miền Nam');
insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách lĩnh vực gia công ở miền Nam');
insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách tất cả lĩnh vực ở miền Nam');
insert into thongbao values (N'Thông báo này dành cho trưởng phòng phụ trách tất cả lĩnh vực ở miền Bắc và miền Trung');

insert into thongbao values (N'Thông báo này dành cho giám đốc phụ trách tất cả lĩnh vực ở chi nhánh miền Bắc');
insert into thongbao values (N'Thông báo này dành cho giám đốc phụ trách tất cả lĩnh vực chi nhánh miền Trung');
insert into thongbao values (N'Thông báo này dành cho giám đốc phụ trách tất cả lĩnh vực ở chi nhánh miền Nam');
insert into thongbao values (N'Thông báo này dành cho giám đốc phụ trách quản lý tất cả lĩnh vực chi nhánh miền Nam và miền Trung');
------------------------------PROC CAP NHAT DIA CHI-----------------------------------
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
--------------------------------PROC PH2----------------------------------------
CREATE OR REPLACE PROCEDURE GRANT_PRIVS_NHANVIEN AS
    TYPE R_CUR IS REF CURSOR;
    CUR R_CUR;
    USR ADMIN.NHANVIEN.MANV%TYPE;
    STRSQL VARCHAR(200);
BEGIN
        -- NHAN VIEN
        OPEN CUR FOR SELECT MANV FROM ADMIN.NHANVIEN WHERE MANV IN (SELECT USERNAME FROM ALL_USERS);
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'grant select on nam.v_own_nhanvien to ' || USR;
                EXECUTE IMMEDIATE(STRSQL);
                STRSQL := 'grant update (ngaysinh, diachi, sodt) on nam.v_own_nhanvien to ' || USR;
                EXECUTE IMMEDIATE(STRSQL);
                STRSQL := 'grant select on admin.v_nhanvien to ' || USR;             
                EXECUTE IMMEDIATE(STRSQL);
                STRSQL := 'grant select on admin.phancong to ' || USR;             
                EXECUTE IMMEDIATE(STRSQL);
                STRSQL := 'grant select on admin.dean to ' || USR;
                EXECUTE IMMEDIATE(STRSQL);
                STRSQL := 'grant select on admin.thongbao to ' || USR;
                EXECUTE IMMEDIATE(STRSQL);

        END LOOP;
        CLOSE CUR;
        -- NHAN SU
        OPEN CUR FOR SELECT MANV FROM ADMIN.NHANVIEN WHERE VAITRO = 'NHANSU' AND MANV IN (SELECT USERNAME FROM ALL_USERS);
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'grant  select on admin.v_nhansu_nhanvien to ' || USR;         
                EXECUTE IMMEDIATE(STRSQL);
                STRSQL := 'grant insert on admin.v_nhansu_nhanvien to ' || USR;
                EXECUTE IMMEDIATE(STRSQL);
                STRSQL := 'grant update (tennv, phai, ngaysinh, diachi, sodt, vaitro, manql, phg) on v_nhansu_nhanvien to ' || USR;
                EXECUTE IMMEDIATE(STRSQL);
        END LOOP;
        CLOSE CUR;
         -- TAI CHINH
        OPEN CUR FOR SELECT MANV FROM ADMIN.NHANVIEN WHERE VAITRO = 'TAICHINH' AND MANV IN (SELECT USERNAME FROM ALL_USERS);
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'grant select on nam.v_nhanvien to ' || USR;             
                EXECUTE IMMEDIATE(STRSQL);        
                STRSQL := 'grant update (luong, phucap) on nam.v_nhanvien  to ' || USR;         
                EXECUTE IMMEDIATE(STRSQL);
        END LOOP;
        CLOSE CUR;
        -- GIAM DOC
        OPEN CUR FOR SELECT MANV FROM ADMIN.NHANVIEN WHERE VAITRO = 'BANGD' AND MANV IN (SELECT USERNAME FROM ALL_USERS);
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'grant select on nam.v_nhanvien to ' || USR;
                EXECUTE IMMEDIATE(STRSQL);
        END LOOP;
        CLOSE CUR;
        -- TRUONG PHONG
        OPEN CUR FOR SELECT MANV FROM ADMIN.NHANVIEN WHERE VAITRO = 'TRUONGPHONG' AND MANV IN (SELECT USERNAME FROM ALL_USERS);
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;
                STRSQL := 'grant insert, delete, update on admin.phancong to ' || USR;             
                EXECUTE IMMEDIATE(STRSQL);
        END LOOP;
        CLOSE CUR;
        -- TRUONG DEAN
        OPEN CUR FOR SELECT MANV FROM ADMIN.NHANVIEN WHERE VAITRO = 'TRUONGDEAN' AND MANV IN (SELECT USERNAME FROM ALL_USERS);
        LOOP
                FETCH CUR INTO USR;
                EXIT WHEN CUR%NOTFOUND;              
                STRSQL := 'grant insert, update, delete on admin.dean to ' || USR;
                EXECUTE IMMEDIATE (STRSQL);
        END LOOP;
        CLOSE CUR;
END;
/
----------------------------------PROC PH1--------------------------------------
CREATE OR REPLACE PROCEDURE CREATE_USER(USERNAME VARCHAR2, PASSWORD VARCHAR2, ISLOCK VARCHAR2)
AS
BEGIN
	EXECUTE IMMEDIATE('CREATE USER ' || USERNAME || ' IDENTIFIED BY ' || PASSWORD || ' ' || ISLOCK);
	EXECUTE IMMEDIATE('GRANT CONNECT TO ' || USERNAME);
    ADMIN.GRANT_PRIVS_NHANVIEN();
EXCEPTION
	WHEN OTHERS THEN
        IF SQLCODE = -01920 THEN
            RAISE;
        END IF;
END;
/

CREATE OR REPLACE PROCEDURE USR_CHANGE_PASS(USERNAME VARCHAR2, PASSWORD VARCHAR2, ISLOCK VARCHAR2)
AS
BEGIN
	IF PASSWORD IS NOT NULL THEN
		EXECUTE IMMEDIATE ('ALTER USER ' || USERNAME || ' IDENTIFIED BY ' || PASSWORD || ' ' || ISLOCK);
	ELSIF ISLOCK IS NOT NULL THEN
		EXECUTE IMMEDIATE ('ALTER USER ' || USERNAME ||' ' || ISLOCK);
	END IF;
END;
/

CREATE OR REPLACE PROCEDURE CREATE_VIEW (VIEWNAME VARCHAR2, COLS VARCHAR2, OBJ VARCHAR2) AS
BEGIN
    EXECUTE IMMEDIATE('CREATE OR REPLACE VIEW ' || VIEWNAME || ' AS SELECT ' || COLS || ' FROM ' || OBJ);
	EXECUTE IMMEDIATE('COMMIT');
END;
/

CREATE OR REPLACE PROCEDURE GRANT_USER_PRIVS(PRIVS VARCHAR2, OBJ VARCHAR2, GRANTEE VARCHAR2, GRANTABLE VARCHAR2)
AS
BEGIN
	EXECUTE IMMEDIATE ('GRANT ' || PRIVS || ' ON ' || OBJ || ' TO ' || GRANTEE || GRANTABLE);
END;
/

CREATE OR REPLACE PROCEDURE REVOKE_USER_PRIVS(PRIVS VARCHAR2, OBJ VARCHAR2, GRANTEE VARCHAR2)
AS
BEGIN
	EXECUTE IMMEDIATE ('REVOKE ' || PRIVS || ' ON ' || OBJ || ' FROM ' || GRANTEE);
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
 
-- PROCEDURE EDIT ROLE
CREATE OR REPLACE PROCEDURE SP_EDIT_ROLE
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
        columnName IN VARCHAR2,
        tabPrivs IN VARCHAR2)
AS
        strSQL VARCHAR2(300);
BEGIN
        IF (columnName IS NULL) THEN
                strSQL := 'GRANT ' || tabPrivs || ' ON ' || objectName || ' TO "' || roleName || '" ' ;
        ELSE
                strSQL := 'GRANT ' || tabPrivs || ' (' || columnName || ') ON ' || objectName || ' TO "' || roleName ||  '" ' ;
        END IF;
--         DBMS_OUTPUT.PUT_LINE(strSQL);
        
         EXECUTE IMMEDIATE (strSQL);
END;
/

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