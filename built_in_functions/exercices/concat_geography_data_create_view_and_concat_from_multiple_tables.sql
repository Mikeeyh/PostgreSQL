CREATE OR REPLACE VIEW view_continents_countries_currencies_details AS
SELECT
	CONCAT(
		cnt.continent_name, ': ', cnt.continent_code
	) AS continent_details,
	
	CONCAT(
		cntr.country_name, ' - ', cntr.capital, ' - ', cntr.area_in_sq_km, ' - ', 'km2'
	) AS country_information,
	
	CONCAT(
		cur.description, ' (', cur.currency_code, ')'
	) AS currencies
	
FROM 
	continents as cnt, 
	countries AS cntr, 
	currencies AS cur

WHERE
	cnt.continent_code = cntr.continent_code
		AND
	cntr.currency_code = cur.currency_code
	
ORDER BY 
	country_information, 
	currencies;

SELECT * FROM view_continents_countries_currencies_details