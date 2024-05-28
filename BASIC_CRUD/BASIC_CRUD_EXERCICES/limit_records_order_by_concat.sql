-- Develop a SQL query that selects from the "employees" table "id", 
-- "first_name", "last_name", and "job_title". 
-- Combine the "first_name" and "last_name" fields into a single field 
-- called "full_name". Sort them by the "first_name" field in 
-- ascending alphabetical order. Finally, LIMIT the results to 50.


SELECT 
    id,
	CONCAT(first_name, ' ', last_name) AS full_name,
	job_title
FROM employees
ORDER BY first_name
LIMIT 50;