SELECT extract('year' FROM now())

SELECT date_part('year', now())

--  -> gives us the year only (2024)

SELECT 
	extract('year' FROM now()),
	extract('month' FROM now()),
	extract('week' FROM now()),
	extract('day' FROM now()),
	extract('hour' FROM now()),
	extract('minute' FROM now());

    -- 2024	5	22	29	13	46


DO $$
	DECLARE
	time_1 timestamp := '2021-01-02:12:30:30';
	time_2 timestamp := now();
	time_3 interval;
	BEGIN	
		time_3 := time_2 - time_1;
		RAISE NOTICE 'The difference is %', time_3;
	END;
$$

-- -> Gives us a custom function that creates the difference between the given times

