				/* Basic SQL server Select Statements*/

/*select *from production.brands;
select first_name from sales.customers;
select first_name,last_name,email from sales.customers;
				
				/*B.retrieve all columns*/

select * from sales.customers;		/* not a good practice to use * as it slows down the application
									and also if new columns are added to the table which is not necessary 
									for this application then the application might crash*/
									

				/* c. sort the result set*/

select * 
from sales.customers 
where state='CA';					/* returns the rows where stae=CA . use only single quotes*/

select *
from sales.customers
where state='CA'
order by first_name;				/*to sort by the coulumn first_name in ascending order*/

				/*d. select -group rows into groups example*/

select city,
	   count(*) as count
from sales.customers
where state='CA'
group by city
order by city;

			/*e. filter groups example*/

select city,
		count(*)
from sales.customers
where state='CA'
group by city
having count(*) >25
order by city;


			/*2. Order by*/

			/*a sort one column in ascending order*/

select distinct first_name,
		last_name
from sales.customers
order by first_name;

			/*b. sort by desc order*/

		
select distinct first_name,
		last_name
from sales.customers
order by first_name desc;

		/*c. sort by multiple rows*/

select  distinct city,
		first_name,
		last_name
from sales.customers
order by city,
		first_name;
		
		/*d. sorting multiple rows in different orders*/

select distinct city,
		first_name,
		last_name
from sales.customers
order by city desc,
		first_name;
		
		/* e.sorting by a column not in the select statement*/

select  city,
		first_name,
		last_name
from sales.customers
order by state ;		/* realized that if Distinct is used then that column is to be included in the select part*/

		/* f.sort by an expression*/

select first_name,
	last_name
from sales.customers
order by len(first_name);

		/*g. sort by ordinal position*/

select distinct first_name,
		last_name
from sales.customers
order by 2,1 desc;		/* not a great practice,better to give the names*/

		/*3.limiting rows*/

select product_name,
		list_price
from production.products
order by list_price,
		product_name
offset 10 rows					/* if no fectch option then will give reamining rows except the 1st 10*/
fetch next 10 rows only;		/* will return the next 10 rows only*/

		/* select top , with percent and ties*/

select top 5					/* top 5 records from the original table*/
		product_name,
		list_price
from production.products;


select top 8					/* top 8 records ordered by list_price in descending manner*/
		product_name,
		list_price
from production.products
order by list_price desc;


select top 5 percent			/*GIVE THE TOP 5% ROWS from the original table*/
		product_name,
		list_price
from production.products
order by list_price desc;


select top 8 with ties			/*selects rows with top 8 and the ties-8th to 11th have the same list_price*/ 
		product_name,
		list_price
from production.products
order by list_price desc;



								/*4. Distinct*/

								/*4.b distinmct multiple column*/

select distinct city,state 
from sales.customers
order by state;


								/*c. distinct with Null values*/

select distinct phone 
from sales.customers 
order by phone;
*/

								/* distinct vs group by*/

/*select city , state, phone 
from sales.customers
group by city,state,phone
order by city,state,phone;
*/

								/* is same as*/

/*select distinct city,state,phone 
from sales.customers;
*/
								/*both group by and distinct return rows without duplicating*/

								/*to get rows that satisfy one or more conditions -where clause*/

								/*a. finding rows by using equality*/

/*select product_name,category_id 
from production.products
where category_id=4;
*/
								/*b.finding rows that meet two conditions*/

/*select *
from production.products
where category_id= 4 and model_year=2017;
*/

								/*c. finding rows using comparison operator*/

/*select * 
from production.products
where category_id<5 and list_price>2000;
*/
								/*finding rows using Or condition*/

/*select *
from production.products
where category_id<5 or list_price=3499.99;
*/
								/*in  clause*/

/*select *
from production.products
where list_price in(429.00,269.99) and model_year not in('2018','2015');
*/


/*select s1.manager_id,s1.first_name,s2.staff_id,s2.first_name
from bikestores.sales.staffs s1,bikestores.sales.staffs s2
where s1.staff_id=s2.manager_id
order by s2.manager_id;*/

/*
CREATE SCHEMA hr;
GO
CREATE TABLE hr.candidates(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);

CREATE TABLE hr.employees(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);
INSERT INTO 
    hr.candidates(fullname)
VALUES
    ('John Doe'),
    ('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');


INSERT INTO 
    hr.employees(fullname)
VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');
	*/
/*select* from hr.candidates;
select * from hr.employees;*/

/*select c.*, e.*
from hr.candidates c
inner Join hr.employees e
on c.fullname=e.fullname;				/*gives the  records of candidates and employees having a common full name*/
*/

/*select c.*, e.*
from hr.candidates c
left Join hr.employees e
on c.fullname=e.fullname;			/* gives the records from left table and adds NULL value to thecoilumns from right table*/
*/

/*select c.*, e.*
from hr.candidates c
right Join hr.employees e
on c.fullname=e.fullname;			/* gives the records from right  table and adds NULL value to thecoilumns from left table*/
*/
				/*right and left join can be used to get the same result by interchanging the tables*/

select c.*, e.*
from hr.candidates c
full Join hr.employees e
on c.fullname=e.fullname;			/* gives the records from left table and adds NULL value to thecoilumns from right table
										also gives the records from right table and adds null value to the columns from the lrft table*/



