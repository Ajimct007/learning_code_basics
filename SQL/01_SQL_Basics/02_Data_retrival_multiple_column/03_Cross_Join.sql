### The CARTESIAN is also called CROSS JOIN. And in a CARTESIAN JOIN, 
### there exists a join for every row of a table to every row of some other table. 
### It usually occurs when the matching column isn't specified on when the WHERE condition isn't specified.
select * from food_db.items;
select * from food_db.variants;

# Cross join
select * from food_db.items
	cross join food_db.variants;
    ## By doing cross join we got 3 * 3 = 9 entries

## for providing the column name
select *,
	concat(name, " - ", variant_name) as full_name,
    (price+variant_price) as total_price
	from food_db.items
	cross join food_db.variants;

