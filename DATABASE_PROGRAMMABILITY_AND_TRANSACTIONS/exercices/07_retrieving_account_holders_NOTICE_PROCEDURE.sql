CREATE OR REPLACE PROCEDURE
	sp_retrieving_holders_with_balance_higher_than(
		searched_balance NUMERIC
	)
AS 
$$
DECLARE
	holder_info RECORD;
	-- Using record we can use columns from the record 
BEGIN
	FOR holder_info IN
		SELECT
			ah.first_name || ' ' || ah.last_name AS full_name,
			SUM(balance) AS total_balance
		FROM 
			account_holders AS ah
		JOIN
			accounts AS a
		ON
			a.account_holder_id = ah.id
		GROUP BY
			full_name
		HAVING
			SUM(balance) > searched_balance
		ORDER BY
			full_name
	LOOP
		RAISE NOTICE '% - %.', holder_info.full_name, holder_info.total_balance;
		-- first variable goes into 1st '%', and the second variable goes to 2nd '%'
	END LOOP;
END;
$$
LANGUAGE plpgsql;

CALL sp_retrieving_holders_with_balance_higher_than(200000);