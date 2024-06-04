SELECT
	mc.country_code,
	m.mountain_range,
	p.peak_name,
	p.elevation
FROM mountains_countries as mc

JOIN mountains as m
	ON m.id = mc.mountain_id
JOIN peaks as p
	ON m.id = p.mountain_id

WHERE p.elevation > 2835 AND mc.country_code = 'BG'
ORDER BY p.elevation DESC;

-- We are starting from table mountains_countries
-- We join with mountains via mountain_id
-- Then we join peaks via mountain_id