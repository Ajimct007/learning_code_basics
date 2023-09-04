# Retrieve the top 2 markets in every region by their gross sales amount in FY=2021
select * from gross_sales;
select * from fact_sales_monthly;

WITH cte1 AS (
    SELECT
        c.market,
        c.region,
        ROUND(SUM(gross_price_total) / 1000000, 2) AS gross_sales_mln
    FROM
        gross_sales s
    JOIN
        dim_customer c ON c.customer_code = s.customer_code
    WHERE
        fiscal_year = 2021
    GROUP BY
        c.market, c.region -- Include both columns in the GROUP BY clause
),
cte2 AS (
    SELECT
        *,
        DENSE_RANK() OVER (PARTITION BY region ORDER BY gross_sales_mln DESC) AS drnk
    FROM
        cte1
)
SELECT
    *
FROM
    cte2
WHERE
    drnk <= 2;