CREATE OR REPLACE FUNCTION fn_cash_in_users_games(
	game_name VARCHAR(50)
)
RETURNS TABLE (
    total_cash NUMERIC
) AS
$$
BEGIN 
	RETURN QUERY

    -- making temp table using 'WITH'
    WITH ranked_games AS (
        SELECT
            cash,
            ROW_NUMBER() OVER (ORDER BY cash DESC) AS row_num
        FROM
            users_games AS ug
        JOIN
            games as g
        ON
            ug.game_id = g.id
        WHERE  
            g.name = game_name
    )
    -- end of temp table

    SELECT 
        ROUND(SUM(cash), 2) AS total_cash
    FROM
        ranked_games as rg 
    WHERE 
        rg.row_num % 2 <> 0;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fn_cash_in_users_games('Love in a mist')