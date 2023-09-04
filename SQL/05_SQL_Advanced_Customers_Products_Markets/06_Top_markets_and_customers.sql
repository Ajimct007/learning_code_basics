select * from net_sales;

## we have the net_sales, now we can group things by Market
select 
	market,
    round(sum(net_sales)/1000000,2) as net_sales_mln
	from net_sales
    where fiscal_year=2021
    group by market
    order by net_sales_mln desc
    limit 5;
## Since it may require to Run again - have to store this as stored procedure

## Now alter the code for Customers
select 
	c.customer,
    round(sum(net_sales)/1000000,2) as net_sales_mln
	from net_sales n
    join dim_customer c
		on n.customer_code = c.customer_code
    where fiscal_year=2021
    group by c.customer
    order by net_sales_mln desc
    limit 5;