## Fields required
-- Month
-- Total gross sales amount to Croma India in this month

select * from fact_sales_monthly s
	join
		fact_gross_price g
	on
		g.product_code = s.product_code and
        g.fiscal_year = get_fiscal_year(s.date)
	where customer_code = 90002002
    order by s.date asc;

## For getting Aggregated monthly sales
select s.date, sum(g.gross_price * s.sold_quantity) as gross_price_total 
	from fact_sales_monthly s
	join
		fact_gross_price g
	on
		g.product_code = s.product_code and
        g.fiscal_year = get_fiscal_year(s.date)
	where customer_code = 90002002
    group by s.date
    order by s.date asc;