-- Function BODY

CREATE OR REPLACE FUNCTION fn_name(varchar, varchar)
RETURNS varchar AS
$$
    BEGIN 
        RETURN
    END;
$$

LANGUAGE plpgsql

-- Example:

CREATE OR REPLACE FUNCTION fn_full_name(varchar, varchar)
RETURNS varchar AS
$$
    BEGIN 
        RETURN CONCAT($1, ' ', $2);
    END;
$$

LANGUAGE plpgsql
;

SELECT * FROM fn_full_name('Mike', 'Biserov')

-- Function BODY with DECLARE

CREATE OR REPLACE FUNCTION fn_full_name(varchar, varchar)
RETURNS varchar AS
$$
    DECLARE
        first_name ALIAS FOR $1;
        last_name ALIAS FOR $2;
        greeting varchar;
    BEGIN 
        greeting := 'Hello';
        RETURN CONCAY(greeting, ' ', first_name, ' ', last_name)
    END;
$$

LANGUAGE plpgsql

SELECT * FROM fn_full_name('Mike', 'Biserov')

-- Fuunction name length

CREATE OR REPLACE FUNCTION fn_get_name_len(name varchar)
RETURNS INT AS
$$
    BEGIN 
        RETURN len(name)
    END;
$$

LANGUAGE plpgsql

SELECT * FROM fn_get_name_len('Mike')

-- Fuunction null checker

CREATE OR REPLACE FUNCTION fn_full_name(first_name varchar, last_name varchar)
RETURNS INT AS
$$
    DECLARE
        full_name varchar(30);
    BEGIN 
        IF first_name is NULL and last_name is NULL THEN
            full_name := NULL;
        ELSIF first_name is NULL THEN
            full_name := last_name;
        ELSIF last_name is NULL THEN
            full_name := first_name;
        ELSE
            full_name := CONCAT(first_name, ' ', last_name);
        END IF;
        RETURN full_name
    END;
$$

LANGUAGE plpgsql

SELECT * FROM fn_full_name('Mike', NULL)

-- Function city_ID

CREATE OR REPLACE FUNCTION fn_get_city_id(city varchar)
RETURNS INT AS
$$
    DECLARE 
        city_id INT;
    BEGIN 
        SELECT id FROM country WHERE country_name = city INTO city_id
        RETURN city_id;
    END;
$$

LANGUAGE plpgsql

SELECT * fn_get_city_id('Germany')

-- Function city_ID USING IN AND OUT

CREATE OR REPLACE FUNCTION fn_get_city_id(IN city_name varchar, OUT city_id INT OUT status INT)
AS
$$
    BEGIN 
        SELECT id FROM country WHERE lower(country_name) = lower(city_name) INTO city_id;
        status := 100;
    END;
$$

LANGUAGE plpgsql

SELECT * fn_get_city_id('Germany')