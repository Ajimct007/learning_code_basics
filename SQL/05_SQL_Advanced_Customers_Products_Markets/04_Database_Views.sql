## Now we have pre invoice discount, Now we need net invoice sales
-- we can apply the discount on the gross price total
-- We are using the Common Table Expression for getting the Net Invoice Sales
with cte1 as (SELECT
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
	   g.fiscal_year = s.fiscal_year
JOIN
    fact_pre_invoice_deductions pre 
    ON pre.customer_code = s.customer_code AND 
       pre.fiscal_year = s.fiscal_year
WHERE
    s.fiscal_year = 2021)

select *,
	   (gross_price_total - gross_price_total * pre_invoice_discount_pct) as net_invoice_sales
from cte1;

## Database Views
-- A way of creating a Virtual Table called Views
-- It derived on the query, gives an impression as real table
-- Right click view and select create view
-- Now insted of CTE use the views
select *,
	(gross_price_total - gross_price_total * pre_invoice_discount_pct) as net_invoice_sales
from sales_preinv_discount