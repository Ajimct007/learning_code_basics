# IN, ANY & ALL clauses expect a list as input
# ANY clause executes the condition for any one of the values on the list that 
### meets the condition which is minimum value by default
# ALL clause executes the condition where all the values on the list meet the condition
### which is the maximum value of the list

# Select actors who acted in any of these movies (movie_id - 101, 110, 121) 
select actor_id from movie_actor where movie_id in (101, 110, 121);

# Using the above line as sub-query
select * from actors where actor_id in (
	select actor_id from movie_actor 
    where movie_id in (101, 110, 121));
    
# Using the Any insted of in
select * from actors where actor_id = any (
	select actor_id from movie_actor 
    where movie_id in (101, 110, 121));
    
## Select all movies whose rating is greater than *any* of the marval movies rating
select * from movies where imdb_rating > (
	select min(imdb_rating) from movies 
    where studio = 'marvel studios');
    
select * from movies where imdb_rating > any (
	select imdb_rating from movies 
    where studio = 'marvel studios');

## We can replace any with some!
select * from movies where imdb_rating > some (
	select imdb_rating from movies 
    where studio = 'marvel studios');
    
## Select all movies whose rating is greater than *all* of the marval movies rating
select * from movies where imdb_rating > all (
	select imdb_rating from movies 
    where studio = 'marvel studios');
