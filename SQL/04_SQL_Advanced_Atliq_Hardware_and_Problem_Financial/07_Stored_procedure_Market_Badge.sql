## Create a stored procedure that can determine the market badge  based on the following logic,
-- if total sold quantity > 5 million that market is considered as Gold, else it is Silver
-- My input will be
	-- market
    -- fiscal year
-- Output
	-- market badge
    
select sum(sold_quantity) as total_qty
	from fact_sales_monthly s
	join dim_customer c
    on s.customer_code=c.customer_code
    where get_fiscal_year(s.date) = 2021 and c.market='india'
    group by c.market;