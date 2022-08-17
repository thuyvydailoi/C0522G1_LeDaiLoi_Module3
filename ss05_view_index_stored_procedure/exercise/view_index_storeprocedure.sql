drop database if exists my_demo;
create database my_demo;
use my_demo;

create table products(
id int primary key,	
product_code int not null,
product_name varchar(45) not null,
product_price int not null,
product_amount int not null,
product_description varchar(100) not null,
product_status bit not null
);

insert into products(id, product_code, product_name, product_price, product_amount, product_description, product_status)
values
(1, 001, 'kem danh rang', 10000, 5, 'trang rang, thom mat, hoi tho dai lau, tat tho thi nho nhau', 0),
(2, 002, 'gel boi tron', 20000, 1, 'goc nuoc, mui dau, khong dinh, tat tho thi nho nhau', 1),
(3, 003, 'chip-chip', 30000, 1000, 'keo deo, mui trai cay, ngot nhe, tat tho thi nho nhau', 0),
(4, 004, 'bao cao su', 40000, 20, 'sieu mong, chuoi, gai, keo dai thoi gian quan he', 1);

create unique index product_index
on products(product_code);

create index product_composite_index
on products(product_name, product_price);

explain select * 
from products
where product_price >= 10000;

create view w_products as
select p.id, p.product_code, p.product_name, p.product_price, p.product_amount, p.product_description
from products p;

select * from w_products ;
 
update w_products set product_price = 20000 where id = 1;

delete from w_products where id = 3;

delimiter //
create procedure sp_get_all_products()
begin 
select * from products;
end //
delimiter ;

call sp_get_all_products();

delimiter //
create procedure sp_get_all_products1()
begin 
insert into products(id, product_code, product_name, product_price, product_amount, product_description, product_status)
values
(5, 005, 'khoan hong', 10000, 5, 'giai thoat cho nguoi xung dang', 0);
select * from products;
end //
delimiter ;

call sp_get_all_products1();

delimiter //
create procedure sp_update_products(p_id int, p_product_code varchar(45), p_product_name varchar(45), p_product_price int, p_product_amount int, p_product_description varchar(100), p_product_status bit)
begin 
update products
set product_code = p_product_code,
 product_name = p_product_name,
 product_price = p_product_price,
 product_amount = p_product_amount,
 product_description = p_product_description,
 product_status = p_product_status
where id= p_id;
select * from products;
end //
-- Query OK, 0 rows affected (0.24 sec)

delimiter ;

call sp_update_products(1,006,'kiem sung', 70000, 10, 'fighting', 1);

delimiter //
create procedure sp_delete_products(p_id int)
begin 
delete from products
where id = p_id;
select * from products;
end //
delimiter ;

call sp_delete_products(1);
