SELECT
	a.name,
	sum(b.booked_for)
FROM apartments as a
	JOIN bookings as b
		USING(apartment_id)
GROUP BY a.name
ORDER BY a.name

-- We are using group by apartment name and we join via apartment id 
-- This is to retrive data about each apartment's total nights booked