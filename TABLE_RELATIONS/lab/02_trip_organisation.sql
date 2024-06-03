SELECT
	v.driver_id,
	v.vehicle_type,
	CONCAT(c.first_name, ' ', c.last_name) AS driver_name
FROM vehicles as v, campers as c
WHERE v.driver_id = c.id

-- USING JOIN

SELECT
	v.driver_id,
	v.vehicle_type,
	CONCAT(c.first_name, ' ', c.last_name) AS driver_name
FROM vehicles as v
	JOIN campers as c
		ON v.driver_id = c.id