select max(date) from fact_forecast_monthly;
select max(date) from fact_sales_monthly;
## we have the data at forecast table till aug 2022, but in sales we have till dec 2021

## Check the count of both tables
select count(*) from fact_forecast_monthly; #1885941
select count(*) from fact_sales_monthly;	#1425706
-- there is a difference in the records

## Perform the join between tables
 select 
	s.*,
	f.forecast_quantity
from 
	fact_sales_monthly s
join 
	fact_forecast_monthly f
    using(date, product_code, customer_code);
## For finding common inner joint count
-- creating a table using the joint
-- Query for getting rows with null values for missing rows
SELECT
    s.date,
    s.fiscal_year,
    s.product_code,
    s.customer_code,
    s.sold_quantity,
    f.forecast_quantity
FROM
    fact_sales_monthly s
LEFT JOIN
    fact_forecast_monthly f
USING (date, customer_code, product_code)

UNION

SELECT
    f.date,
    f.fiscal_year,
    f.product_code,
    f.customer_code,
    s.sold_quantity,
    f.forecast_quantity
FROM
    fact_forecast_monthly f
LEFT JOIN
    fact_sales_monthly s
USING (date, customer_code, product_code)
-- but doing the union, we are including the all the rows