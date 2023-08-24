# Sub-queries are queries which generate output that will be used as input to the main query

# Select a movie with highest imdb_rating
select * from movies 
	order by imdb_rating desc
    limit 1;
## Using another query
select * from movies
	where imdb_rating = 9.3;
## for getting the max value of imdb_rating
select max(imdb_rating) from movies;

# 1) Using sub-query for single value
## we can subsitute the above querry as sub-query
select * from movies
	where imdb_rating = (select max(imdb_rating) from movies); 
## writing the query for min rating
select * from movies
	where imdb_rating = (select min(imdb_rating) from movies);

#2) Using sub-query to return list of numbers
select * from movies
	where imdb_rating in (1.9, 9.3);
## subsituting the values with queries
select * from movies
	where imdb_rating in (
		(select min(imdb_rating) from movies),
        (select max(imdb_rating) from movies));
        
# 3) Using Sub-query to return a table
select * from (select 
	name, year(curdate())-birth_year as age
	from actors) as actors_age
    where age > 70 and age < 85 order by age desc;
	