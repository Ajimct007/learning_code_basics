## Duration v/s Fetch
-- Duration -- time query is executed
-- Fetch -- time taken to retrive the data

## use the explain analyze for getting the time of the execution
explain analyze
SELECT
    s.date,
    s.product_code,
    p.product,
    p.variant,
    s.sold_quantity,
    g.gross_price,
    ROUND(g.gross_price * s.sold_quantity, 2) AS gross_price_total,
    pre.pre_invoice_discount_pct
FROM
    fact_sales_monthly s
JOIN
    dim_product p 
    ON p.product_code = s.product_code
JOIN
    fact_gross_price g 
    ON g.product_code = s.product_code AND 
	   g.fiscal_year = get_fiscal_year(s.date)
JOIN
    fact_pre_invoice_deductions pre 
    ON pre.customer_code = s.customer_code AND 
       pre.fiscal_year = get_fiscal_year(s.date)
WHERE
    get_fiscal_year(s.date) = 2021
ORDER BY
    s.date ASC
LIMIT
    1000000;
    
## Since it looks into all the rows for aggregation of date, it take much time for execution
-- for improving the performance, we have to create a new table called -- dim_date
-- which has the fiscal_year along with date

## Create a new table called dim_table
-- Right click the tables and click on create table

## After creating the table and adding the data
-- remove the get_fiscal_year
explain analyze
SELECT
    s.date,
    s.product_code,
    p.product,
    p.variant,
    s.sold_quantity,
    g.gross_price,
    ROUND(g.gross_price * s.sold_quantity, 2) AS gross_price_total,
    pre.pre_invoice_discount_pct
FROM
    fact_sales_monthly s
JOIN
    dim_product p 
    ON p.product_code = s.product_code
JOIN
	dim_date dt
    ON dt.calender_date=s.date
JOIN
    fact_gross_price g 
    ON g.product_code = s.product_code AND 
	   g.fiscal_year = dt.fiscal_year
JOIN
    fact_pre_invoice_deductions pre 
    ON pre.customer_code = s.customer_code AND 
       pre.fiscal_year = dt.fiscal_year
WHERE
    dt.fiscal_year = 2021
ORDER BY
    s.date ASC
LIMIT
    1000000;
-- Previously it took above 24 sec to execute the query
-- Now it took just 9 sec to execute the query
-- check the query without selecting the explain analyze