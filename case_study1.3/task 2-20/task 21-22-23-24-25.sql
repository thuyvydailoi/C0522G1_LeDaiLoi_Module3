use my_case_study;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là
--  “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view v_nhan_vien as
select nv.ma_nhan_vien ,nv.ho_ten,nv.dia_chi, nv.so_cmnd, hd.ngay_lam_hop_dong
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where dia_chi like '%Hải Châu%' and hd.ngay_lam_hop_dong = '2021-04-25';

drop view v_nhan_vien;
select * from v_nhan_vien;