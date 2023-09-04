# get all actors whose age is between 70 and 85
# Old query
	select actor_name, age
		from 
			(select 
				name as actor_name,
                year(curdate()) - birth_year as age
                from actors) as actors_age
			where age > 70 and age < 85;

## Using Common Table Expressions
with actors_age as ( 
	select name as actor_name,
			year(curdate()) - birth_year as age
            from actors) ## the actors_age will be available till end of the query
	select actor_name, age from actors_age
    where age > 70 and age < 85;

## we can actually create multiple CTE's

## we can specify the column names at the with clause
with actors_age (actor_name, age) as ( 
	select name,
		year(curdate()) - birth_year
        from actors)
	select actor_name, age from actors_age
    where age > 70 and age < 85;
    
## Movies that produced 500% profit and their rating was less than avg rating for all movies

## Movies that produced 500% profit
select *,
	(revenue-budget)*100/budget as pct_profit
    from financials
    where (revenue-budget)*100/budget >= 500;
## Their rating was less than avg rating for all movies
select * from movies  
	where imdb_rating < (select avg(imdb_rating) from movies);
    
## Combining both the queries
select X.movie_id, X.pct_profit,
	   Y.title, Y.imdb_rating
	from (select *, (revenue-budget)*100/budget as pct_profit from financials) X
	join (
    select * from movies
		where imdb_rating < (select avg(imdb_rating) from movies)
        )Y
	on X.movie_id = Y.movie_id
    where pct_profit >= 500;
   
## Using the CTE for Combined query
with
	X as (select *, (revenue-budget)*100/budget as pct_profit
    from financials),
    Y as (select * from movies
			where imdb_rating < (select avg(imdb_rating) from movies))
select
	X.movie_id, X.pct_profit,
    Y.title, Y.imdb_rating
    from X
    join Y
    on X.movie_id = y.movie_id
    where pct_profit >= 500;
    
## Takeaways
### Common Table Expressions (CTE) creates a temporary table within a query
### With and as clauses  are used in combination to create CTE
### One can create multiple CTEs inside a query

## Benefits of CTE
### Simple Queries
### same resultset can be referenced multiple times
### Gives potential candidates for views


### Look for MY SQL CTE Documentation -- for RECURSIVE CTE