CREATE OR REPLACE FUNCTION fn_get_towns()
RETURNS TABLE (id INT, name VARCHAR) AS
$$
    BEGIN 
        RETURN QUERY (SELECT * FROM towns);
    END;
$$

LANGUAGE plpgsql;

SELECT * FROM fn_get_towns()