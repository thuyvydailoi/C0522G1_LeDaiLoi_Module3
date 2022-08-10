drop database if exists my_custommer;

create database my_custommer;

use my_custommer;

create table customer(
customer_id int primary key,
customer_name varchar(45) not null,
customer_age int not null
);

create table `order`(
order_id int primary key,
customer_id int,
order_date date not null,
order_total_price double,
foreign key(customer_id) references customer(customer_id)
);

create table product(
product_id int primary key,
product_name varchar(45) not null,
product_price double
);

create table order_detail(
order_id int,
product_id int,
primary key(order_id, product_id),
order_quantity int,
foreign key(order_id) references `order`(order_id),
foreign key(product_id) references product(product_id)
);

insert into customer(customer_id, customer_name, customer_age)
values
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

insert into `order`(order_id, customer_id, order_date, order_total_price)
values
(1, 1, '2006-3-21', Null),
(2, 2, '2006-3-23', Null),
(3, 1, '2006-3-16', Null);

insert into product(product_id, product_name, product_price)
values
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into order_detail(order_id, product_id, order_quantity)
values
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);
