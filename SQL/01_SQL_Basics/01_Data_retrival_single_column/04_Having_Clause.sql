# Print all the years where more than 2 movies were released
select release_year, count(*) as movies_count
	from movies
    group by release_year
    having movies_count > 2
    order by movies_count desc
    
## Flow which SQL works is it first executes
## FROM --> WHERE --> GROUP BY --> HAVING --> ORDER BY
## HAVING clause has to be opened with GROUP BY
## the column which we are mentioning should be mentioned in SELECT 