select * from fact_act_est;
# the fact_act_est is a derived table from sales and forecast
-- anytime the records inserted to sales and forecast the fact_act_est 
-- should update automatically
-- triggers will allow us to do this

## create a trigger inside sales_monthly table

## We can check the triggers in the database
show triggers;

## Now insert a record to fact_sales and check the update status
INSERT INTO fact_sales_monthly
(date, product_code, customer_code, sold_quantity)
VALUES ("2030-09-01", "HAHA", 99, 89);

## Check both the tables
select * from fact_sales_monthly where customer_code=99;
select * from fact_act_est where customer_code=99;

## Create trigger for fact_forecast monthly and check the update
INSERT INTO fact_forecast_monthly
(date, product_code, customer_code, forecast_quantity)
VALUES ("2030-09-01", "HAHA", 99, 43);

-- check both the tables
select * from fact_forecast_monthly where customer_code=99;
select * from fact_act_est where customer_code=99;

-- the record is updated correctly