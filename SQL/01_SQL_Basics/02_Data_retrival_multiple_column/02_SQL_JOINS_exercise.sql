## 1) Show all the movies with their language names
select 
	movies.title, languages.name
    from movies
    join languages
    using(language_id);
    
## 2) Show all Telugu movie names (assuming you don't know language id for Telugu)
select title from movies
	left join languages
    on movies.language_id=languages.language_id
    where languages.name = "Telugu";

## 3) Show language and number of movies released in that language
SELECT l.name, COUNT(m.movie_id) as no_movies
	FROM languages l
	LEFT JOIN movies m USING (language_id)        
	GROUP BY language_id
	ORDER BY no_movies DESC;