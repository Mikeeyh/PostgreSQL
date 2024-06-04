SELECT
	b.booking_id,
	b.starts_at::DATE,
	b.apartment_id,
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM bookings as b
	RIGHT JOIN customers as c
		USING(customer_id)
ORDER BY customer_name ASC
LIMIT 10;

-- We use right join to collect all customers with known booking or not