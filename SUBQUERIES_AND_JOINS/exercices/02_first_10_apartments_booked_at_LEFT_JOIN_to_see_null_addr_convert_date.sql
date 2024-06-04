SELECT
	a.name,
	a.country,
	b.booked_at::date
FROM apartments as a
	LEFT JOIN bookings as b
		USING(booking_id)
LIMIT 10

-- Using CAST:

SELECT
	a.name,
	a.country,
	CAST(b.booked_at AS DATE)
FROM apartments as a
	LEFT JOIN bookings as b
		USING(booking_id)
LIMIT 10
