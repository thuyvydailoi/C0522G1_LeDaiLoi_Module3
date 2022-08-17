drop DATABASE if exists quan_ly_diem_thi;
create database quan_ly_diem_thi;
USE quan_ly_diem_thi;

CREATE TABLE hoc_sinh(
    ma_hs VARCHAR(20) PRIMARY KEY,
    ten_hs VARCHAR(50),
    ngay_sinh DATETIME,
    lop VARCHAR(20),
    gt VARCHAR(20)
);

CREATE TABLE mon_hoc(
    ma_mh VARCHAR(20) PRIMARY KEY,
    ten_mh VARCHAR(50)
);

CREATE TABLE bang_diem(
    ma_hs VARCHAR(20),
    ma_mh VARCHAR(20),
    diem_thi INT,
    ngaykt DATETIME,
    PRIMARY KEY (ma_hs, ma_mh),
    FOREIGN KEY (ma_hs) REFERENCES hoc_sinh(ma_hs),
    FOREIGN KEY (ma_mh) REFERENCES mon_hoc(ma_mh)
);

CREATE TABLE giao_vien(
    ma_gv VARCHAR(20) PRIMARY KEY,
    ten_gv VARCHAR(20),
    sdt VARCHAR(10)
);

ALTER TABLE mon_hoc ADD ma_gv VARCHAR(20);
ALTER TABLE mon_hoc ADD CONSTRAINT fk_magV FOREIGN KEY (ma_gv) REFERENCES giao_vien(ma_gv);	