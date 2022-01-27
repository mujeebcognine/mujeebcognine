use Mujeeb;

--Sql Data Types
--Select
--Where clause
--Order By Clause
--And,OR,Having, With,AS
--Distinct Keyword
--Isnull() function
--Between,In
--Order of processing Queries


--sql data types:- 
--char(n)	Fixed width character string	8,000 characters	Defined width
--varchar(n)	Variable width character string	8,000 characters	2 bytes + number of chars
--varchar(max)	Variable width character string	1,073,741,824 characters	2 bytes + number of chars
--text	Variable width character string	2GB of text data	4 bytes + number of chars
--nchar	Fixed width Unicode string	4,000 characters	Defined width x 2
--nvarchar	Variable width Unicode string	4,000 characters	 
--nvarchar(max)	Variable width Unicode string	536,870,912 characters	 
--ntext	Variable width Unicode string	2GB of text data	 
--binary(n)	Fixed width binary string	8,000 bytes	 
--varbinary	Variable width binary string	8,000 bytes	 
--varbinary(max)	Variable width binary string	2GB	 
--image	Variable width binary strin




use Mujeeb;

select * from Clients;
select distinct working_area,country from clients;
select Clients_NAME,Clients_CODE,COUNTRY from Clients;


select * from agents;

select agent_name,phone_no from agents where COUNTRY='India';

select * from CUSTOMER;

select cust_name,phone_no,agent_code,grade from CUSTOMER where CUST_COUNTRY='India' order by grade;
select cust_name,phone_no,agent_code,grade from CUSTOMER where CUST_COUNTRY='India' order by grade desc;

select agent_name,phone_no,COUNTRY,COMMISSION from agents where COUNTRY='India' and COMMISSION='0.15';
select agent_name,phone_no,COUNTRY from agents where country='india' or country='usa';


select distinct working_area,country from clients;
select count(distinct working_area ) from clients;

select * from ORDERS;

select * from ORDERS where ADVANCE_AMOUNT is null;
select * from ORDERS where ADVANCE_AMOUNT is not null;

select * from AGENTS;

select * from agents where COUNTRY in ('india','canada','usa');

select * from CUSTOMER;

select cust_name,OUTSTANDING_AMT from CUSTOMER where OUTSTANDING_AMT between '5000' and '10000' order by OUTSTANDING_AMT;
select cust_name,OUTSTANDING_AMT from CUSTOMER where OUTSTANDING_AMT between '6000' and '5000' order by OUTSTANDING_AMT;


select
 count(ORD_NUM),ord_amount from orders group by ORD_AMOUNT
 having count(ORD_AMOUNT)>4;

 select agent_name as 'Name' ,agent_code as 'id' from AGENTS;

 select * from CUSTOMER;

 select sum(payment_amt) from CUSTOMER;

 WITH temporaryTable(averageValue) as
(SELECT avg(payment_amt)
from CUSTOMER)
SELECT cust_name,cust_name,cust_city,grade,PAYMENT_AMT
FROM CUSTOMER, temporaryTable 
WHERE CUSTOMER.PAYMENT_AMT > temporaryTable.averageValue;

select * from EMP;
select * from EMP where SAL  between 1000 and 2000;
select * from EMP where SAL not between 1000 and 2000;
select  * from EMP where SAL between 2000 and 1000;
select * from ORDERS;
select * from ORDERS where ADVANCE_AMOUNT in (500,1000,600);
select * from ORDERS where ADVANCE_AMOUNT not in (500,1000,600);


{
select - retrun expression
from, join  - getting data
where - row filter
group by - grouping
having - group filter
orderby, limit - order& paging 
}



