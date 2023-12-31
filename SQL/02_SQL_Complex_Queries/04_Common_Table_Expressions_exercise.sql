## 1) select all hollowood movies released after year 2000 that made more than 500 millions $ 
## profit or more profit. Note that all hollywood movies have millions as a unit hence you don't
## need to do unit converstion. Also you can write this query without CTE as well but you should
## try to write this using CTE only

with cte as (select title, release_year, (revenue-budget) as profit
			from movies m
			join financials f
			on m.movie_id=f.movie_id
			where release_year>2000 and industry="hollywood"
	)
	select * from cte where profit>500