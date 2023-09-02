## Simply enter the data manually as like excel

## using the insert statement
insert into movies
	values(141, "Bahubaali 3", "Bollywood", "2030", 9.0, "Arka Media Works",2);
    
## for explicitly mentioning the column to update
insert into movies
(title, industry, release_year)
	values("Bahubaali 4", "Bollywood", 2035);

## Using null and default with insert function
insert into movies
	values(default, "Bahubaali 5", "Bollywood", 2037, null, null, 2);
    
## For inserting multiple records
insert into movies
	(title, industry, language_id)
	values
    ("Inception 2", "Hollywood", 5),
    ("Inception 3", "Hollywood", 5),
    ("Inception 4", "Hollywood", 5);

    
select * from movies;
