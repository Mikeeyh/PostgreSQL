SELECT
	COUNT(*)
FROM 
	countries
LEFT JOIN
	countries_rivers
-- ON
--     countries.country_code = countries_rivers.country_code
USING
	(country_code)
WHERE river_id IS NULL;

-- We can use 'USING' when we have the same thing in both tables. 
-- Here we have 'country_code' in countries and countries_rivers tables