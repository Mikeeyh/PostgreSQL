SELECT
    a.name,
	at.animal_type,
	TO_CHAR(a.birthdate, 'DD.MM.YYYY') AS birthdate
FROM
	animals as a
JOIN
	animal_types as at
ON
	a.animal_type_id = at.id
ORDER BY
	a.name ASC
;
