CREATE OR REPLACE FUNCTION fn_show_notice(msg VARCHAR(40))
RETURNS BOOLEAN AS
$$ 
    BEGIN
        RAISE NOTICE 'The notice is%', msg;
        RETURN TRUE;
    END;
$$
LANGUAGE plpgsql;

-- For debugging, we check the notice in Messages section in PGAdmin.