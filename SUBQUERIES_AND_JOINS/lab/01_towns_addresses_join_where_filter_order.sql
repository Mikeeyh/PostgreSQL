SELECT
	t.town_id,
	t.name AS town_name,
	a.address_text
FROM addresses as a
	JOIN towns as t
		ON t.town_id = a.town_id
WHERE t.name IN ('San Francisco', 'Sofia', 'Carnation')	
ORDER BY t.town_id, a.address_id

-- We can use "USING" because 'ON t.town_id = a.town_id' we have  the same syntax 'town_id' for both pk.

SELECT
	t.town_id,
	t.name AS town_name,
	a.address_text
FROM addresses as a
	JOIN towns as t
		USING(town_id)
WHERE t.name IN ('San Francisco', 'Sofia', 'Carnation')	
ORDER BY t.town_id, a.address_id

-- Select addresses table and take town_id, address_text, then join towns table and take town name
-- Filter the results and take only those which town name is ('San Francisco', 'Sofia', 'Carnation')	
-- Order by town_id and address_id

