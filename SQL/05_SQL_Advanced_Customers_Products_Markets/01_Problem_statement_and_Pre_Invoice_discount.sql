## Generate Report for
-- Top Markets
-- Top Products
-- Top Customers
-- for given financial year by net sales
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