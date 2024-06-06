SELECT
	o.name,
	COUNT(*) AS count_of_animals
FROM 
	owners as o
JOIN 
	animals as a
ON
	a.owner_id = o.id
GROUP BY
	o.name
ORDER BY
	count_of_animals DESC,
	o.name ASC
LIMIT 5
;
