## Added the new database named Random Tables
-- we have 2 tables -- Expenses and Student_marks

## Problem Statement -- Find the % expense for given items
select * from expenses;
-- 1st get the total expenses
select sum(amount) from expenses; ## 65800
-- Now we can use that to calculate the % amount
SELECT
	*,
    amount * 100.0 / SUM(amount) OVER () AS pct -- Here OVER () is the window function
    ## here window is all the rows
FROM
    random_tables.expenses
ORDER BY
    category;

## Now get the % amount per_category_total_amount insted of total_amount
select sum(amount) from expenses where category='food'; ##11800
SELECT
	*,
    amount * 100.0 / SUM(amount) OVER (partition by category) AS pct 
    -- in the OVER clause we can give partition by category, which calculate for the 
    -- % value in terms of category
FROM
    random_tables.expenses
ORDER BY
    category;
    
## To display cumulative expenses
-- Cumulative SUM -- increasing by one addition after another, and including
-- all the amounts that have been added before
select * from expenses
	order by category,date;
-- for finding the cumulative amount
select *, 
	sum(amount) over(partition by category order by date) as total_expense_till_date
    from expenses
    order by category,date;