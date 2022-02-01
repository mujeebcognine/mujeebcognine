use Mujeeb
select * from Employees;

drop table Employees

create table Employees(EMP_ID INT,EMP_NAME VARCHAR(199),EMP_FATHER_NAME VARCHAR(199),DOB DATE,DEPT VARCHAR(199), SALARY INT);

INSERT INTO Employees values 
(101,'Mujeeb Ur Rahaman','Anees Ur Rahaman','1998/02/13','QA',45000),
(102,'Shesha Sairaj Chandra','Shesha Mahendra Chandra','1995/08/26','Dev',40000),
(103,'Kutthadi Srikanth','Kuthadi Srinivas','1992/12/02','Dev',80000),
(104,'Ramesh Chary','Rudhra Chary','1999/06/21','Dev',15000),
(105,'Chandra Prakash','Akhil Chandra','1995/10/06','Clerk',8000),
(106,'Ahmed Khan','Sohail Khan','1996/07/19','Labour',4000),
(107,'Keshava Arun Kumar','Keshava Suresh Kumar','1985/01/11','Project Manager',122000),
(108,'Mohammed Sohail','Mohammed Sajid','1997/03/20','Admin',30000),
(109,'Sneha Suresh','Ramnath Suresh','1998/10/23','QA',50000),
(110,'Radhe Shyam','Radhe Vikas','1997/12/11','Dev',20000),
insert into Employees values (111,'Z.Ramesh','Z.Suresh','1988/03/12','QA',65000);

select * from Employees;


--1.Write a query to Get a List of Employees who have a one part name.
select LEFT(emp_name,charindex(' ',emp_name))AS 'firstname' from Employees;

--2.Write a query to Get a List of Employees who have a three part name.
select emp_name from Employees where emp_name like '% % %';

--3.write a query to get a list of Employees who have a First Middle Or last name as Ram, and not anything else

 select emp_name from Employees where EMP_NAME like 'ram%' or EMP_NAME like '%ram';

 --4.Write a query which gives employee types in the organization.
 select distinct(DEPT) as departments from Employees;

/* 5.Write a query which returns Name, FatherName, DOB of employees whose PresentBasic is
i. Greater than 30000.
ii. Less than 3000.
iii. Between 3000 and 5000. (Note:Assume 1 as least unit in currency)*/

select emp_name,EMP_FATHER_NAME,DOB,SALARY from Employees WHERE SALARY > 30000;
select emp_name,EMP_FATHER_NAME,DOB,SALARY from Employees WHERE SALARY <3000;
select emp_name,EMP_FATHER_NAME,DOB,SALARY from Employees WHERE SALARY BETWEEN 3000 AND 5000;

/*6.Write a query which returns All the details of employees whose Name
i. Ends with 'KHAN'
ii. Starts with 'CHANDRA'
iii. Is 'RAMESH' and their initial will be in the range of alphabets a-t.
EX:If an employee name is T.Ramesh then your query should return his record.*/
select * from Employees where EMP_NAME like '%khan';
select * from employees where EMP_NAME like 'chandra%';
select * from Employees where EMP_NAME like '%Ramesh%' and emp_name between 'A' and 'T';

select * from EMP;
select * from employees;
--UNION
select emp_name,SALARY from employees union select ename,SAL from EMP;
--Union All
select emp_name,SALARY from employees union all select ename,SAL from EMP;

--Intersect

select emp_name,salary from Employees intersect select Ename, SAL from EMP;

select job from EMP intersect select DEPT from Employees;

--Except

select job from EMP except select DEPT from Employees;


