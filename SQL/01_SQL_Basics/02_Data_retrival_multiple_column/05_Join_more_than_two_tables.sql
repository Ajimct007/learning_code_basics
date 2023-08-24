## Doing the multiple joins
select m.title, a.name
	from movies m
    join movie_actor ma on ma.movie_id=m.movie_id
    join actors a on a.actor_id = ma.actor_id;
### Here it displays the movie for two times, we have to merge the movie names
### For that purpose we will use the Group Concat function

SELECT 
	m.title, group_concat(a.name) as actors
	FROM movies m
	JOIN movie_actor ma ON m.movie_id=ma.movie_id
	JOIN actors a ON a.actor_id=ma.actor_id
	GROUP BY m.movie_id;
    
## Using a separator
SELECT 
	m.title, group_concat(a.name separator " | ") as actors
	FROM movies m
	JOIN movie_actor ma ON m.movie_id=ma.movie_id
	JOIN actors a ON a.actor_id=ma.actor_id
	GROUP BY m.movie_id;

## Print the actor name along with movies
select
	a.name, group_concat(m.title) as movies
    from actors a
    join movie_actor ma on ma.actor_id = a.actor_id
    join movies m on m.movie_id = ma.movie_id
    group by a.actor_id;

## Print how many movies a actor acted on
SELECT 
	a.name, GROUP_CONCAT(m.title SEPARATOR ' | ') as movies,
    COUNT(m.title) as num_movies
	FROM actors a
	JOIN movie_actor ma ON a.actor_id=ma.actor_id
	JOIN movies m ON ma.movie_id=m.movie_id
	GROUP BY a.actor_id
	ORDER BY num_movies DESC;