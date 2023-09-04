## Get the monthly sales for Quartely basis
-- 9, 10, 11 --> Q1
-- 12, 1, 2 --> Q2
-- 3, 4, 5 --> Q3
-- 6, 7, 8 --> Q4

 select * from fact_sales_monthly
	where customer_code = 90002002 and 
    get_fiscal_year(date)=2021 and
    get_fiscal_quarter(date) = "Q4"
    order by date asc;