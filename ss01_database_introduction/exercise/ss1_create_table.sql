drop database if exists my_database;
create database my_database;

use my_database;

create table student(
id int primary key,
`name` varchar(45),
age int,
country varchar(45)
); 

create table class(
id int primary key ,	
`name` varchar(45)
);

create table teacher(
id int primary key,
`name` varchar(45),
age int,
country varchar(45)
);