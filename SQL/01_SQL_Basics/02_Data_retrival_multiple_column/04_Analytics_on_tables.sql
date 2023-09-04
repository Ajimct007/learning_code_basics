select * from movies;
select
	m.movie_id, title, budget, revenue, currency, unit,
    (revenue-budget) as profit
    from movies m
    join financials f on m.movie_id=f.movie_id;

## Writing for bollywood
select
	m.movie_id, title, budget, revenue, currency, unit,
    (revenue-budget) as profit
    from movies m
    join financials f on m.movie_id=f.movie_id
    where industry = 'bollywood'
    order by profit desc;
    
## Unit conversion from thousands into mmillions
select
	m.movie_id, title, budget, revenue, currency, unit,
    case
		when unit='thousands' then round((revenue-budget)/1000,2)
        when unit='billions' then round((revenue-budget)*1000,2)
        else round((revenue-budget),2)
    end as profit_mln
    from movies m
    join financials f on m.movie_id=f.movie_id
    where industry = 'bollywood'
    order by profit_mln desc;