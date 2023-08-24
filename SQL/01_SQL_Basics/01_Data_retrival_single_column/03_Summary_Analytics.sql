select count(*) from movies where industry='bollywood';
select max(imdb_rating) from movies where industry='bollywood';
select min(imdb_rating) from movies where industry='bollywood';
select avg(imdb_rating) from movies where studio='Marvel Studios';
select round(avg(imdb_rating),2) from movies where studio='Marvel Studios';
select round(avg(imdb_rating),2) as avg_rating from movies where studio='Marvel Studios';
select 	min(imdb_rating) as min_rating,
		max(imdb_rating) as max_rating,
        round(avg(imdb_rating),2) as avg_rating
		FROM movies where studio = 'Marvel Studios';
select industry, count(*) from movies 
	group by industry;
select studio, count(*) as cnt 
	from movies 
	group by studio
    order by cnt desc;
select industry,
	count(industry) as cnt,
    round(avg(imdb_rating),2) as avg_rating
    from movies
    group by industry;
select studio,
	count(industry) as cnt,
    round(avg(imdb_rating),2) as avg_rating
    from movies
    group by studio
    order by avg_rating desc;
select studio,
	count(studio) as cnt,
    round(avg(imdb_rating),2) as avg_rating
    from movies where studio != ''
    group by studio
    order by avg_rating desc;
