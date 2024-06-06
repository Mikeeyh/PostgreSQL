SELECT
	CONCAT(o.name, ' - ', a.name) as "owners - animals",
	o.phone_number,
	ac.cage_id
FROM 
	owners as o
JOIN
	animals as a
ON
	o.id = a.owner_id
JOIN
	animals_cages as ac
ON 
	ac.animal_id = a.id
JOIN 
	animal_types as at
ON
	a.animal_type_id = at.id
WHERE 
	at.animal_type = 'Mammals'
ORDER BY
	o.name ASC,
	a.name DESC
;