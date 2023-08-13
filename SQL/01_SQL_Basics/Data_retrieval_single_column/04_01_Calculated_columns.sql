## For getting current date
select curdate();
## for getting current year
select year(curdate());
## Selecting the columns from actors table
select *, year(curdate())-birth_year as age from actors;