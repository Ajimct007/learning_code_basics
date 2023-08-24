## Inner JOIN
select
	m.movie_id, title, budget, revenue, currency, unit
    from movies m
    join financials f
    on m.movie_id=f.movie_id;
    
## LEFT JOIN
select
	m.movie_id, title, budget, revenue, currency, unit
    from movies m
    left join financials f
    on m.movie_id=f.movie_id;
    
## RIGHT JOIN
select
	f.movie_id, title, budget, revenue, currency, unit
    from movies m
    right join financials f
    on m.movie_id=f.movie_id;
    
## UNITON JOIN
select 	m.movie_id, title, budget, revenue, currency, unit
	from movies m left join financials f on m.movie_id=f.movie_id
    
union

select 	f.movie_id, title, budget, revenue, currency, unit
	from movies m right join financials f on m.movie_id=f.movie_id;
    
## we can use USING clause insted of ON clause for joining based on 2 columns
select 	movie_id, title, budget, revenue, currency, unit
	from movies m right join financials f using (movie_id);