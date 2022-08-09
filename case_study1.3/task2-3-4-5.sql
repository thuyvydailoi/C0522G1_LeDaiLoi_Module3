use my_case_study;

select ma_nhan_vien, ho_ten
from nhan_vien
-- where (ho_ten like 'H%' or ho_ten like 'K%' or ho_ten like 'T%') and char_length(ho_ten) <= 15;
where ho_ten regexp '^[HKT]' and char_length(ho_ten) <= 15;

select ma_khach_hang, ho_ten
from khach_hang
-- where (year(curdate())-year(ngay_sinh) between 18 and 50) and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');
where (year(curdate())-year(ngay_sinh) between 18 and 50) and (dia_chi regexp '[Đà Nẵng | Quảng Trị]$');

select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_khach_hang) as so_lan_dat_phong
from khach_hang join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where khach_hang.ma_loai_khach = 1
group by ma_khach_hang
order by so_lan_dat_phong;

select khach_hang.ma_khach_hang, khach_hang.ho_ten,
 loai_khach.ten_loai_khach, hop_dong.ma_hop_dong,
 dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong,
 hop_dong.ngay_ket_thuc, (ifnull(dich_vu.chi_phi_thue,0) + ifnull(hop_dong_chi_tiet.so_luong,0) * ifnull(dich_vu_di_kem.gia, 0) )as tong_tien
 from khach_hang
 left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
 left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
 left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
 left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
 left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
 group by ma_hop_dong
 order by ma_khach_hang, ma_hop_dong desc;
 
-- desc  sx giảm dần