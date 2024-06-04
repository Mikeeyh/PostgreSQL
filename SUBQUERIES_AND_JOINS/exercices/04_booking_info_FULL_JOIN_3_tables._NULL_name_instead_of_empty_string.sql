SELECT
	b.booking_id,
	a.name as apartment_owner,
	a.apartment_id,
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM bookings as b
	FULL JOIN apartments as a
		USING(booking_id)
			FULL JOIN customers as c
				USING(customer_id)
ORDER BY b.booking_id, apartment_owner, customer_name ASC

-- Here we have all records where the booking_id is related to the apartement:

-- 1) All bookings without an apartment
-- 2) All apartments without a booking
-- 3) All customers without a booking
-- 4) All customers with a booking

-- 	CONCAT(c.first_name, ' ', c.last_name) AS customer_name -> 
-- This gives us empty string when there isn't any person.
-- We can modify it to have NULL instead of empty string.
-- To do it: c.first_name || ' ' || c.last_name AS customer_name