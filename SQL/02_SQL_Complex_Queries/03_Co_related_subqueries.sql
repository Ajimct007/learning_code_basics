## Select the actor_id, actor_name and the total number of movies they acted in
select a.actor_id, a.name, count(*) as movies_count 
	from movie_actor ma
    join actors a
    on a.actor_id = ma.actor_id
	group by actor_id
    order by movies_count desc;
## using Sub-querry for getting answer - here called as Co_related query
select 
	actor_id, 
    name, 
    ( select count(*) from movie_actor where actor_id=actors.actor_id) as movies_count
    #this above query goes on by each row by row and counts for each actor
	from actors order by movies_count desc;
    
## explain analyze will analyze the time taken for executing a query
explain analyze
	select 
	actor_id, 
    name, 
    ( select count(*) from movie_actor where actor_id=actors.actor_id) as movies_count
    #this above query goes on by each row by row and counts for each actor
	from actors order by movies_count desc;
    
## explore more about explain analyze using google


# Takeaways
## A subquery is called a co-related query when its execution depends upon the statement(s) written after the bracket
## One needs to choose between writing a subquery or a co-related query depending on its performance
## Explain analyze clause before any query will privide query performance