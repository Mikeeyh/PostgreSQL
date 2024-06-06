CREATE OR REPLACE FUNCTION fn_insert_data(id INT, name VARCHAR)
RETURNS BOOLEAN AS
$$
    DECLARE
    BEGIN 
        INSERT INTO country(id, country_name)
        VALUES (id, name);
        EXCEPTION
            WHEN UNIQUE_VIOLATION THEN RETURN FALSE;
        RETURN TRUE;
    END;
$$

LANGUAGE plpgsql
;

-- It is not good to insert data using a function, but it is possible:
SELECT fn_insert_data(14, 'Bangladesh') 

-- Adding EXCEPTION prevents to add a country using existing ID.