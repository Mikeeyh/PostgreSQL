-- Logic without a function:

SELECT
	COUNT(*)
FROM
	employees as e
JOIN 
	addresses AS a
USING 
	(address_id)
JOIN
	towns AS t
USING
	(town_id)
WHERE t.name = 'Sofia'

-- WITH FUNCTION:

CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name varchar(20))
RETURNS INT AS
$$
	DECLARE town_count INT;
    BEGIN 
    
		-- ADDING LOGIC
		SELECT
			COUNT(*) INTO town_count
		FROM
			employees as e
		JOIN 
			addresses AS a
		USING 
			(address_id)
		JOIN
			towns AS t
		USING
			(town_id)
		WHERE t.name = town_name;
        -- END OF LOGIC

        RETURN town_count;
    END;
$$

LANGUAGE plpgsql