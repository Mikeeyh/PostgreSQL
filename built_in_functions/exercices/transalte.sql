SELECT 
	capital,
	TRANSLATE(capital, 'áãåçéíñóú', 'aaaceinou') AS translated_name
FROM countries

-- -> changes 'á' TO 'a', 'ã' TO 'a', etc.