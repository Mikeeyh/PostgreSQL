SELECT 
	REGEXP_SUBSTR("River Information", '[0-9]{1,4}') AS river_length
FROM view_river_info

-- To select only first 4 digits found.

SELECT 
	(REGEXP_MATCHES("River Information", '[0-9]{1,4}'))[1] AS river_length
FROM view_river_info

SELECT 
	SUBSTRING("River Information", '[0-9]{1,4}') AS river_length
FROM view_river_info