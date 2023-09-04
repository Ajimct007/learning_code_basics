## Using the Random_Tables DB
select * from expenses
order by category;
## Show top 2 expenses in each category
-- here we can use window functions such as
	-- Row_number
	-- Rank
    -- Dense_rank
## With Row Number
with cte1 as (select 
	*,
    row_number() over(partition by category order by amount desc) as rn
from expenses
order by category)
select * from cte1 where rn<=2;

## We have 2 amount values as 2700, the result shows only one, and skip the other
-- for considering both of them we have to use the Rank

## With Rank
with cte1 as (select 
	*,
    row_number() over(partition by category order by amount desc) as rn,
	rank() over(partition by category order by amount desc) as rnk
from expenses
order by category)
select * from cte1 where rn<=2;
-- since it gives Rank 2 for 2 values, it skips the rank 3 and shows rank 4
-- to avoid that skiping we have to use the Dense Rank

## With Dense Rank
with cte1 as (select 
	*,
    row_number() over(partition by category order by amount desc) as rn,
	rank() over(partition by category order by amount desc) as rnk,
    dense_rank() over(partition by category order by amount desc) as drnk
from expenses
order by category)
select * from cte1 where drnk<=2;

### Using the Student_marks table
select *,
	row_number() over(order by marks desc) as rn,
	rank() over(order by marks desc) as rnk,
    dense_rank() over(order by marks desc) as drnk
from student_marks;
