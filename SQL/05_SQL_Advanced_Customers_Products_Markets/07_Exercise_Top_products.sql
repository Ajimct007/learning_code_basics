select * from net_sales;

select 
	product,
    round(sum(net_sales)/1000000,2) as net_sales_mln
	from net_sales n
    where fiscal_year=2021
    group by product
    order by net_sales_mln desc
    limit 5;