CREATE OR REPLACE FUNCTION fn_calculate_future_value(DECIMAL, DECIMAL, INT)
RETURNS DECIMAL AS
$$
    BEGIN 
        RETURN TRUNC($1 * ((1 + $2)^$3), 4);
    END;
$$

LANGUAGE plpgsql
;
SELECT * FROM fn_calculate_future_value(1000, 0.1, 5)

-- OR:

CREATE OR REPLACE FUNCTION fn_calculate_future_value (
	initial_sum DECIMAL,
	yearly_interest_rate DECIMAL,
	number_of_years INT
) RETURNS DECIMAL AS
$$
BEGIN
	RETURN TRUNC(
		initial_sum * POWER(1 + yearly_interest_rate, number_of_years),
		4
	);
END;
$$
LANGUAGE plpgsql;

-- POWER(a , b) -> Za povdigane na stepen, a = 3, b = 2 -> 3 * 3 = 9