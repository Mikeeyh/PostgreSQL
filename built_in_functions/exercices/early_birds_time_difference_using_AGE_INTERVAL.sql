SELECT
	user_id,
	AGE(starts_at, booked_at) AS early_birds
FROM
	bookings
WHERE
	starts_at - booked_at >= '10 MONTHS'

--  OR

SELECT
	user_id,
	AGE(starts_at, booked_at) AS early_birds
FROM
	bookings
WHERE
	AGE(starts_at, booked_at) >= INTERVAL '10 MONTHS'

--  Age calculates the difference between the two dates
--  INTERVAL is used to indicate the value that we need to use to make comparison