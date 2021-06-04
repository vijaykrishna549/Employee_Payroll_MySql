show databases;
create database payroll_service;
use payroll_service;
select database();

create table employee_payroll
( id int unsigned not null auto_increment,
name varchar(150) not null,
salary double not null,
start date not null,
primary key(id)
);
desc employee_payroll;

insert into employee_payroll (name, salary, start) values 
('Bill', 1000000, '2018-01-03'),
('Mark', 2000000,'2019-11-13'),
('Charlie', 3000000,'2020-05-21');

select * from employee_payroll;
select name from employee_payroll where start between 2018-01-01 and now();
alter table employee_payroll add gender char(1) after name;
update employee_payroll set gender = 'M' where id = 1;
update employee_payroll set gender = 'F' where id = 2;
update employee_payroll set gender = 'M' where id = 3;
update employee_payroll set name = 'Terisa' where id = 2;

select * from employee_payroll where start between '2020-01-01' and now();
select gender, avg(salary) from employee_payroll group by gender;

#UC8

alter table employee_payroll add phone_number varchar(50) after name;
alter table employee_payroll add address varchar(250) after phone_number;
alter table employee_payroll add department varchar(250) not null after address;
alter table employee_payroll alter address set default 'TBD';

insert into employee_payroll (name, salary, start) values 
('Mark', 1000000, '2018-01-03');

#UC9

alter table employee_payroll rename column salary to basic_pay;
alter table employee_payroll add deductions double not null after basic_pay;
alter table employee_payroll add taxable_pay double not null after deductions;
alter table employee_payroll add tax double not null after taxable_pay;
alter table employee_payroll add net_pay double not null after tax; 

#UC10
select * from employee_payroll where name = 'Terisa';







