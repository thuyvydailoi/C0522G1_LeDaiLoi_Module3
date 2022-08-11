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