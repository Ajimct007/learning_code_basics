## Generate a report of all gluten_free items from super_store
SELECT * FROM superstore_db.items
where properties->"$.gluten_free"=null;
## Item without key gluten_free
select * from items
where isnull(properties-> "$.gluten_free");
## Item with blue color
select * from items
where properties->"$.color"="blue"; 