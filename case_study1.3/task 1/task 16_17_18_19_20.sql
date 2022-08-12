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

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.