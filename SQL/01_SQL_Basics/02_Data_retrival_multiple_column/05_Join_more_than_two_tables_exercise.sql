SELECT 
	title, revenue, currency, unit,
    CASE
		WHEN unit="Thousands" THEN ROUND(revenue/1000,2)
        WHEN unit="Billions" THEN ROUND(revenue*1000,2)
        ELSE revenue 
	END as revenue_mln
	FROM movies m
	JOIN financials f ON m.movie_id=f.movie_id
	JOIN languages l ON m.language_id=l.language_id
	WHERE l.name="Hindi"
	ORDER BY revenue_mln DESC;