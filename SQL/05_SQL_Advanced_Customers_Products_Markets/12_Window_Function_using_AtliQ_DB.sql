## Write a stored procedure for getting top n products 
-- in each division by their quantity sold in given financial year
-- For Ex -- result of FY=2021
with cte1 as (
SELECT
    p.division,
    p.product,
    SUM(s.sold_quantity) AS total_qty
FROM
    fact_sales_monthly s
JOIN
    dim_product p ON p.product_code = s.product_code
WHERE
    fiscal_year = 2021
GROUP BY
    p.division, p.product),
	cte2 as (
    select 
		*,
		dense_rank() over(partition by division order by total_qty desc) as drnk
	from cte1)
select * from cte2 where drnk <=3;
-- we successfully got the required information
-- now make a stored procedure