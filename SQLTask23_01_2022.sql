/*Scalar Functions-UPPER,LOWER,LEN, DATALENGTH,GETDATE,COALESCE*/

use mujeeb;

select * from AGENTS;
select * from CUSTOMER;
select * from Employees;
select * from ORDERS;

select UPPER (agent_name)as Name,working_area from AGENTS;
select LOWER(working_area) as area_of_work,agent_name from AGENTS;

select LEN(cust_name) as length_of_name,cust_name,upper(cust_city) as city from CUSTOMER;
select LEN(cust_city) as length_of_name,cust_city from CUSTOMER;
select DATALENGTH(CUST_CITY) as length,CUST_CITY,GRADE from CUSTOMER;
select DATALENGTH(cust_name) as length,cust_name from CUSTOMER;
select DATALENGTH(grade) as length,grade from CUSTOMER;
select LEN(grade) as length,grade from CUSTOMER;
select DATALENGTH(RECEIVE_AMT) as length,RECEIVE_AMT from CUSTOMER;
select LEN(RECEIVE_AMT) as length,RECEIVE_AMT from CUSTOMER;


select GETDATE();

 select * from Employees;
 select coalesce(null,1,'manager',3,2);

 /*Numeric Functions-ABS, FLOOR, CEILing, ISNUMERIC*/

 select ABS(-245) as absnum;
 select ABS(245) as absnum;
 select CEILING(-24.1) as ceilingnumber;
  select CEILING(24.1) as ceilingnumber;
 select CEILING(24.5) as ceilingnumber;
 select CEILING(24.9)as ceilingnumber;
 select FLOOR(35.1) as floornum;
  select FLOOR(-35.1) as floornum;
 select FLOOR(35.5) as floornum;
 select FLOOR(35.9) as floornum;
 select ISNUMERIC('a12');
 select ISNUMERIC('1245');

 /*Character/String Functions -ASCII,LTRIM, RTRIM,CHARINDEX,CONCAT,FORMAT,*/
 
 select ascii(cust_name) as asciichar,cust_name from CUSTOMER;

 select LTRIM('begin    the session now') as 'removed before spaces';
 select RTRIM('begin    the session now         ')as 'removed after spaces';
 select CHARINDEX('m',cust_name) as matchpoint,CUST_NAME from CUSTOMER;
 select CONCAT(firstname,lastname) as fullname from Employees;
 select FORMAT(ord_date,'d','en-us')as us_dates from orders;
 select FORMAT(24012022,'##-##-####') as format;


/* LEFT, LEN,LOWER,PATINDEX,REPLACE,REPLICATE,REVERSE,RIGHT,STUFF, SUBSTRING,*/
select * from CUSTOMER;
select left(cust_name,4)as First4Letters from CUSTOMER;
select LEN(cust_city) as lengthOfCharacters from CUSTOMER;
select LOWER(working_area) as area_of_work,agent_name from AGENTS;
select PATINDEX('%[m]%',cust_name)as 'position',CUST_NAME from customer; 
select * from Employees;
select REPLACE('last_name','last','End') as 'replacedName';
select REVERSE(cust_name) as 'reversename',CUST_NAME from CUSTOMER;
select right(cust_name,4)as First4Letters,CUST_NAME from CUSTOMER;
select STUFF(cust_name,4,2,'REDDIF') as 'stuffname',cust_name from CUSTOMER;
select SUBSTRING(cust_name,3,4) as 'rightextract',cust_name from CUSTOMER;

/*Conversion Functions-CAST, CONVERT, TRY_CONVERT, TRY_CAST,PARSE*/
select * from EMP;

select CONVERT(int,25.23);
select convert(text,4);
select convert ( varchar,23.45);
select CONVERT(int,sal),sal from EMP as Int_type; 

select cast(34.438 as int);
select cast(4 as text);
select CAST(237.326 as varchar);
select cast(sal as int),sal from emp as int_type;


SELECT TRY_CONVERT(INT, 123456.55); -- 123456  
SELECT TRY_CONVERT(DATETIME, 23020221); -- NULL  
Select CONVERT(datetime,23022021);

SELECT TRY_CAST(123456.56686 AS INT); -- 123456  
SELECT TRY_CAST(23022021 AS datetime); -- null 
SELECT CAST(23022021 AS datetime); -- null 

SELECT TRY_PARSE('2021-02-23' AS date); --NULL  
SELECT TRY_PARSE('2015/09/13' AS DATEtime USING 'Fr-FR'); -- 2015-09-13  
SELECT TRY_PARSE('23022021' AS DATE); -- 2015-09-13
select parse('23022021' as date);

--Date Functions-GETDATE,CURRENT_TIMESTAMP,DATENAME,DAtePART,DAY,Month,Year,DAtediff,dateadd,EOMONTH,ISDate

select * from EMP;
select getdate();
select CURRENT_TIMESTAMP;
select DATEPART(DD,hiredate) from emp as date;
select day(hiredate) from emp;
select month(hiredate) from emp;
select year(hiredate) from emp;

select * from orders;
select ord_date,ord_no,DATEADD(day,3,ord_date)from orders;
select ord_date,ord_no,DATEDIFF(day,'2011-10-08',ord_date) from orders;
select ord_date,ord_no,DATEDIFF(day,ord_date,'2011-10-08') from orders;
select ord_date,ord_no,DATEDIFF(month,'2011-10-08',ord_date) from orders;

SELECT DATENAME(year, '2017/08/25') AS DatePartString;
SELECT DATENAME(month, '2017/08/25') AS DatePartString;
SELECT DATEpart(month, '2017/08/25') AS DatePartString;

select EOMONTH('2022-01-26');

select ISDATE('2022-01-26');
select isdate('2022012k');
select isdate('2022-01-32');

--Aggregate Functions-AVG,COUNT,MIN, SUM,MAX,COUNT_BIG

select * from emp;
select avg(sal) from emp;
select count(empno) from emp;
select min(sal) from emp;
select sum(sal) from emp;
select max(sal) from emp;
select top 3 (sal)from emp;
select max(sal) from emp;
select COUNT_BIG(sal) from emp;
select count(sal) from emp;

--1)Check with CTE & schema.
--A Common Table Expression, also called as CTE in short form, is a temporary named result set that you can reference
-- within a SELECT, INSERT, UPDATE, or DELETE statement. The CTE can also be used in a View.



;with ROWCTE(ROW_NO) as  
   (  
     SELECT 
  ROW_NUMBER() OVER(ORDER BY name ASC) AS ROWNO
FROM sys.databases 
WHERE database_id <= 10
    )  
 
SELECT * FROM ROWCTE 




Declare @RowNo int =1;
;with ROWCTE as  
   (  
      SELECT @RowNo as ROWNO    
		UNION ALL  
      SELECT  ROWNO+1  
  FROM  ROWCTE  
  WHERE RowNo < 10
    )  
 
SELECT * FROM ROWCTE 





declare @startDate datetime,  
        @endDate datetime;  
  
select  @startDate = getdate(),  
        @endDate = getdate()+16;  
-- select @sDate StartDate,@eDate EndDate  
;with myCTE as  
   (  
      select 1 as ROWNO,@startDate StartDate,'W - '+convert(varchar(2),  
            DATEPART( wk, @startDate))+' / D ('+convert(varchar(2),@startDate,106)+')' as 'WeekNumber'       
  union all  
       select  ROWNO+1 ,dateadd(DAY, 1, StartDate) ,  
              'W - '+convert(varchar(2),DATEPART( wk, StartDate))+' / D ('+convert(varchar(2),  
               dateadd(DAY, 1, StartDate),106)+')' as 'WeekNumber'     
  FROM  myCTE  
  WHERE dateadd(DAY, 1, StartDate)<=  @endDate    
    )  
select ROWNO,Convert(varchar(10),StartDate,105)  as StartDate ,WeekNumber from myCTE 








USE Mujeeb;
SELECT * FROM ORDERS;

--2)check with the date format for between operator.
select * from EMP;
select * from EMP where SAL  between 1000 and 2000;
select * from EMP where SAL not between 1000 and 2000;
select  * from EMP where SAL between 2000 and 1000;

--3)check with table diagrams in ssms tool
-- This table diagrams in ssms is used to add,remove,arrange,adjust the layout,auto size the tables then copying it and pasting that in ms word and adjusting the
-- max and minimize the window







