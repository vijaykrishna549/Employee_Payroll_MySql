show databases;
create database payroll_service;
use payroll_service;
select database();
show tables;
desc employee_payroll;

create table employee_payroll
( id int unsigned not null auto_increment,
name varchar(150) not null,
salary double not null,
start date not null,
primary key(id)
);
desc employee_payroll;

insert into employee_payroll (name, basicpay, start) values 
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
insert into employee (name, address, start) values 
('Mark','tbd','2016-04-05');

select * from employee_payroll where start between '2020-01-01' and now();
select gender, avg(salary) from employee_payroll group by gender;

#UC8

alter table employee_payroll add phone_number varchar(50) after name;
alter table employee_payroll add address varchar(250) after phone_number;
alter table employee_payroll add department varchar(250) not null after address;
alter table employee_payroll alter address set default 'TBD';



#UC9

alter table employee_payroll rename column salary to basic_pay;
alter table employee_payroll add deductions double not null after basic_pay;
alter table employee_payroll add taxable_pay double not null after deductions;
alter table employee_payroll add tax double not null after taxable_pay;
alter table employee_payroll add net_pay double not null after tax; 

#UC10
select * from employee_payroll where name = 'Terisa';
select * from employee_payroll;
alter table employee_payroll drop column department;
alter table employee_payroll drop column deductions;
alter table employee_payroll drop column basic_pay;
alter table employee_payroll drop column taxable_pay;
alter table employee_payroll drop column tax;
alter table employee_payroll drop column net_pay;
update employee set gender = 'M' where Emp_id = 4;

alter table employee_payroll rename to Employee;
alter table employee rename column Eid to Emp_id;
desc employee;
select * from employee;

create table Emp_Department ( Dept_id int, Emp_ref_id int unsigned , Dept_name varchar(250));
drop table Emp_Department;
desc Emp_Department;
alter table Emp_Department add foreign key(Emp_ref_id) references Employee(Emp_id) on delete cascade;
insert into Emp_Department(Dept_id,Emp_ref_id,Dept_name) values
(1,1,'Account'),
(2,2,'sales'),
(3,2,'Marketing'),
(4,4,'HR');
select * from Emp_department;
alter table department rename to Emp_Department;


create table Company ( Comp_id int, Emp_ref_id int unsigned , Comp_name varchar(250),
foreign key(Emp_ref_id) references Employee(Emp_id) on delete cascade);
insert into Company (Comp_id , Emp_ref_id, Comp_name) values
(1,1,'TCS'),
(2,3,'Wipro'),
(3,2,'IBM'),
(1,4,'TCS');

select * from Company;

create table Payroll(Emp_ref_id int unsigned, basic_pay double, deduction double,
taxable_pay double,tax double ,net_pay double );
alter table Payroll add foreign key(Emp_ref_id) references Employee(Emp_id) on delete cascade;
insert into Payroll (Emp_ref_id, basic_pay,net_pay) values
(1,1000000,12000000),
(2,3000000,32000000),
(3,2000000,23000000),
(4,25000000,27000000);


desc payroll;
select * from payroll;


SELECT Employee.Emp_id, Employee.name, Emp_Department.Dept_name, Company.Comp_name
FROM ((Employee
INNER JOIN Emp_Department
ON Employee.Emp_id = Emp_Department.Emp_ref_id)
INNER JOIN Company
on Employee.Emp_id = Company.Emp_ref_id);

SELECT NOW();
SELECT E.name NAME,D.Dept_name Department_NAME
FROM Employee E JOIN Emp_Department D
ON (E.Emp_id = D.Emp_ref_id);

show databases;
use payroll_service;














