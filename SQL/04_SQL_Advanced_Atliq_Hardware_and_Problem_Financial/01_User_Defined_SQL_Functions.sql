## fields we want
-- Month
-- Product name
-- Variant
-- Sold Quantity
-- Gross Price per Item
-- Gross Price Total

## Search for Croma
select * from dim_customer
	where customer like "%croma%" and market='India';
    
## take the customer code and search the transactions
select * from fact_sales_monthly
	where customer_code = 90002002;
    
## getting date for year -- Calender year
select * from fact_sales_monthly
	where customer_code = 90002002 and YEAR(date)=2021
    order by date desc;
    
## Converting the calender year into Fiscal year
-- Financial year for AtliQ starts from Sep to Aug

select * from fact_sales_monthly
	where customer_code = 90002002 and 
    year(date_add(date, interval 4 month))=2021
    order by date desc;
-- here we are giving the interval as 4 months since the financial year starts from 1st Sep
-- by adding the 4 months to the date we will get the financial year

## SQL User defined functions
-- we will use the Fiscal year formula in Future so we define a function for it
-- click the functions at the Database, there we can define the functions
 select * from fact_sales_monthly
	where customer_code = 90002002 and 
    get_fiscal_year(date)=2021
    order by date asc;
