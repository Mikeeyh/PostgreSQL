SELECT
	country_code,
	COUNT(m.mountain_range) AS mountain_range_count 
FROM 
    mountains_countries as mc
JOIN 
    mountains as m
ON 
    mc.mountain_id = m.id
	
WHERE mc.country_code IN ('BG', 'RU', 'US')
GROUP BY country_code
ORDER BY mountain_range_count DESC;

-- We are looking for unique mountain ranges in those 3 countries.