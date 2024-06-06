-- Logic without PROCEDURE

SELECT
	o.name
FROM 
	owners as o
JOIN
	animals as a
ON
	o.id = a.owner_id
WHERE 
	a.name = 'Hippo'

-- With PROCEDURE

CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
	IN animal_name VARCHAR(30),
	OUT result VARCHAR(30)
)
AS
$$
BEGIN
	SELECT
		o.name
	INTO
		result
	FROM 
		owners as o
	JOIN
		animals as a
	ON
		o.id = a.owner_id
	WHERE 
		a.name = animal_name;
	
	IF result IS NULL THEN result := 'For adoption'; 
    END IF;
END;
$$
LANGUAGE plpgsql
;

-- Adding result and IF - ELSE.