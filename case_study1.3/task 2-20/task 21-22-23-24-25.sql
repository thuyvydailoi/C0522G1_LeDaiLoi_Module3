use my_case_study;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là
--  “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view v_nhan_vien as
select nv.ma_nhan_vien ,nv.ho_ten,nv.dia_chi, nv.so_cmnd, hd.ngay_lam_hop_dong
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where dia_chi like '%Hải Châu' and hd.ngay_lam_hop_dong = '2019-12-12';

drop view v_nhan_vien;
select * from v_nhan_vien;	

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

set sql_safe_updates= 0;
update v_nhan_vien set dia_chi = 'Liên Chiểu, Đà Nẵng';
select * from v_nhan_vien;	
set sql_safe_updates= 1;

-- 23. Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin
--  của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

-- delimiter //
-- create procedure sp_xoa_khach_hang(p_ma_khach_hang int)
-- begin 
-- delete from khach_hang
-- where ma_khach_hang = p_ma_khach_hang;
-- select * from khac_hang;
-- end //
-- delimiter ;

-- drop procedure sp_xoa_khach_hang;
-- call sp_xoa_khach_hang(1);

delimiter //
create procedure sp_update_khach_hang(p_ma_khach_hang int)
begin 
update khach_hang
set trang_thai = 1
where ma_khach_hang = p_ma_khach_hang;
select * from khach_hang;
end //
delimiter ;

drop procedure sp_update_khach_hang;
call sp_update_khach_hang(2);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong
--  với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
--  với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

