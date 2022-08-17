use my_case_study;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

set sql_safe_updates= 0;
update nhan_vien  
set trang_thai = 1
where ma_nhan_vien 
not in (
select ma_nhan_vien
from hop_dong hd 
where year(hd.ngay_lam_hop_dong) between 2019 and 2021
group by ma_nhan_vien
);

select *
from nhan_vien
where trang_thai = 0;
set sql_safe_updates= 1;

-- 17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

set sql_safe_updates= 0;
update khach_hang set ma_loai_khach = 1 where ma_khach_hang in(
select ma_khach_hang
from(select kh.ma_khach_hang, 
sum(ifnull(dv.chi_phi_thue , 0)+ ifnull(hdct.so_luong , 0)* ifnull(dvdk.gia , 0)) as tong_tien
from khach_hang kh
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong= hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where year(ngay_lam_hop_dong) =2021 and lk.ten_loai_khach = 'Platinium'
group by ma_khach_hang
having tong_tien > 10000000)as temp);

select * from khach_hang
where ma_loai_khach = 1;
set sql_safe_updates= 1;

-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

set sql_safe_updates= 0;
update khach_hang set trang_thai = 1 where ma_khach_hang in (
select ma_khach_hang
from hop_dong 
where year(ngay_lam_hop_dong) < 2021);

select * 
from khach_hang
where trang_thai = 1;
set sql_safe_updates= 1;

-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi..

set sql_safe_updates= 0;
update dich_vu_di_kem set gia = gia * 2 where ma_dich_vu_di_kem  in (
select *
from (select dvdk.ma_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
where year(ngay_lam_hop_dong) = 2020
group by ma_dich_vu_di_kem
having sum(hdct.so_luong) > 10) as temp);

select *
from dich_vu_di_kem;
set sql_safe_updates= 1;

-- 20.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
--  thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi, trang_thai
from khach_hang
union all
select ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi, trang_thai
from nhan_vien;