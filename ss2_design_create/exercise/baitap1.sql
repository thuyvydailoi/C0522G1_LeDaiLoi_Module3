drop database if exists my_product;

create database my_product;

use my_product;

create table phieu_xuat(
so_phieu_xuat int primary key,
ngay_xuat date not null
);

create table vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar(45) not null
);

create table phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap date not null
);

create table so_dien_thoai_nha_cung_cap(
so_dien_thoai varchar(45) primary key
);

create table nha_cung_cap(
ma_nha_cung_cap int primary key,
ten_nha_cung_cap date not null,
dia_chi varchar(45) not null,
so_dien_thoai varchar(45),
foreign key(so_dien_thoai) references so_dien_thoai_nha_cung_cap(so_dien_thoai)
);

create table don_dat_hang(
so_don_hang int primary key,
ngay_don_hang date not null,
ma_nha_cung_cap int,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table chi_tiet_don_hang(
so_don_hang int,
ma_vat_tu int,
primary key(so_don_hang, ma_vat_tu),
foreign key(so_don_hang) references don_dat_hang(so_don_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table chi_tiet_phieu_xuat(
so_phieu_xuat int,
ma_vat_tu int,
primary key(so_phieu_xuat, ma_vat_tu),
don_gia_xuat double not null,
so_luong_xat int not null,
foreign key (so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table chi_tiet_phieu_nhap(
ma_vat_tu int,
so_phieu_nhap int,
don_gia_nhap double,
so_luong_nhap int,
primary key(ma_vat_tu, so_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);