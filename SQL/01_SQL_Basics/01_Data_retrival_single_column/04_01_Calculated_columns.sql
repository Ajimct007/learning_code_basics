## For getting current date
select curdate();
## for getting current year
select year(curdate());
## Selecting the columns from actors table
select *, year(curdate())-birth_year as age from actors;
## now select financials table to calculate pofit
select *, (revenue-budget) as profit from moviesdb.financials;
## Print the revenue of all the movies into single currency
## assume USD to INR conversion rate as 77
select *, 
	if(currency='USD', revenue*77, revenue) as revenue_inr
    from moviesdb.financials;
## How the if condiition works?
## IF(condition, true, false)

## Lets print all the revenue numbers into millions
## lets check how many unite we have
select distinct unit from financials;
## now set condition and print revenur in millions, converting other units to million
## we can use the case statement for setting multiple conditions
select *,
	case
		when unit = 'thousands' then revenue/1000
        when unit = 'billions' then revenue * 1000
        else revenue
	end as revenue_mln
    from moviesdb.financials;
    
