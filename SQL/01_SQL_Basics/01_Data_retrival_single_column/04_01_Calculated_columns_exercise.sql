## print profit % for all the movies
select *, 
	(revenue-budget) as profit,
    (revenue-budget) * 100/budget as profit_pct
    from financials;