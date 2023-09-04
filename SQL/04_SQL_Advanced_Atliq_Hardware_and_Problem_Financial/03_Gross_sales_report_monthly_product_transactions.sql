## fields we want
-- Month
-- Product name
-- Variant
-- Sold Quantity
-- Gross Price per Item
-- Gross Price Total

select s.date, s.product_code, p.product, p.variant, s.sold_quantity 
	from fact_sales_monthly s
	join dim_product p
    on p.product_code = s.product_code;

## Now we have to select Gross price per item
select s.date, s.product_code, p.product, p.variant, 
		s.sold_quantity, g.gross_price
	from 
		fact_sales_monthly s
	join 
		dim_product p
    on 
		p.product_code = s.product_code
    join 
		fact_gross_price g
    on 
		g.product_code = s.product_code and g.fiscal_year = get_fiscal_year(s.date)
    where 
		customer_code = 90002002 and
        get_fiscal_year(date) = 2021
	order by date asc
	limit 1000000;


## Now we have to get Gross price Total
select s.date, s.product_code, p.product, p.variant, 
		s.sold_quantity, g.gross_price,
        round(g.gross_price * s.sold_quantity,2) as gross_price_total
	from 
		fact_sales_monthly s
	join 
		dim_product p
    on 
		p.product_code = s.product_code
    join 
		fact_gross_price g
    on 
		g.product_code = s.product_code and g.fiscal_year = get_fiscal_year(s.date)
    where 
		customer_code = 90002002 and
        get_fiscal_year(date) = 2021
	order by date asc
	limit 1000000;