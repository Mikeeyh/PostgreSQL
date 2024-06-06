CREATE OR REPLACE FUNCTION fn_full_name(varchar, varchar)
RETURNS varchar AS
$$
    BEGIN 
        RETURN CONCAT(INITCAP($1), ' ', INITCAP($2));
    END;
$$

LANGUAGE plpgsql
;
SELECT * FROM fn_full_name('fred', 'sanford')

-- OR:

CREATE OR REPLACE FUNCTION fn_full_name(
    first_name VARCHAR(50),
    last_name VARCHAR(50)

) RETURNS VARCHAR(101) 
AS
$$
    DECLARE 
        full_name VARCHAR(101);
    BEGIN 
        full_name := INITCAP(LOWER(first_name)) || ' ' || INITCAP(LOWER(last_name));
        RETURN full_name;
    END;
$$

LANGUAGE plpgsql
;
SELECT * FROM fn_full_name('fred', 'sanford')