-- Logic without a func:

SELECT
	COUNT(*)
FROM 
	volunteers as v
JOIN
	volunteers_departments as vd
ON
	vd.id = v.department_id
WHERE vd.department_name = 'Zoo events'

-- Logic with func:

CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(
    searched_volunteers_department VARCHAR(30)
)
RETURNS INT AS
$$
BEGIN 
    RETURN (
        SELECT COUNT(*)
        FROM volunteers as v
        JOIN volunteers_departments as vd ON vd.id = v.department_id
        WHERE vd.department_name = searched_volunteers_department
    );
END;
$$
LANGUAGE plpgsql;

-- WITH DECLARE:

CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(
    searched_volunteers_department VARCHAR(30)
)
RETURNS INT AS
$$
DECLARE
    volunteers_count INT;
BEGIN 
    SELECT
        COUNT(*)
    INTO
        volunteers_count
    FROM 
        volunteers as v
    JOIN
        volunteers_departments as vd
    ON
        vd.id = v.department_id
    WHERE vd.department_name = searched_volunteers_department;

    RETURN volunteers_count;
END;
$$
LANGUAGE plpgsql;