## Refer the stored procedured at the left side tab
-- some customers have multiple entries with different customer_id
select * from dim_customer
where customer like '%amazon%' and market = "india";
-- we need to get aggregate report for amazon -- for this refer the stored procedure
