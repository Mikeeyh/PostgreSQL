SELECT
	COUNT(*)
FROM 
    bookings as b
JOIN 
    customers as c
USING
    (customer_id)
WHERE 
    (SELECT c.last_name = 'Hahn')

-- OR:

SELECT 
	COUNT(*)
FROM 
	bookings AS b
JOIN
	customers AS c
USING 
	(customer_id)
WHERE 
	c.last_name = 'Hahn';