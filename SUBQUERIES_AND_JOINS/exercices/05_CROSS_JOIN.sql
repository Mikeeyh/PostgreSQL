SELECT
	b.booking_id,
	c.first_name AS customer_name
FROM bookings as b
	CROSS JOIN customers as c
ORDER BY customer_name ASC

-- OR:

SELECT
	b.booking_id,
	c.first_name AS customer_name
FROM bookings as b, customers as c
ORDER BY customer_name ASC

-- We do not have 'ON' or 'USING' while we initiate a CROSS JOIN 
-- That is because we relate all bookings to all customers