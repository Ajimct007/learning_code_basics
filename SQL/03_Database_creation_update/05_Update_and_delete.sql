## Updating Single record
update movies
	set studio = "Warner Bros. Pictures", language_id=5, release_year=2035
	where movie_id=145;
    
## Updating multiple records
select * from movies where title like "%Inception%";
select movie_id from movies where title like "%Inception%";
update movies
	set 
		studio = "Warner Bros. Pictures"
	where movie_id in (112, 145, 146, 147);

## For deleting the records
delete from movies
	where movie_id = 145;

## For deleting multiple records
delete from movies
	where movie_id in (141, 146, 147);
    
select * from movies;