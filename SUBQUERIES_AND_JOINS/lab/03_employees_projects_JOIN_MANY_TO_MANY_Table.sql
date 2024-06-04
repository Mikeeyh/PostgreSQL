SELECT
	e.employee_id,
	CONCAT(e.first_name, ' ', e.last_name) AS full_name,
	p.project_id,
	p.name AS project_name
FROM employees AS e
    JOIN employees_projects as ep 
		ON e.employee_id = ep.employee_id
            JOIN projects as p
                ON p.project_id = ep.project_id
WHERE p.project_id = 1

-- We take data from employees
-- We take data from projects
-- But we have many to many relation between employees and projects
-- So, we join it to take only employees working on project_id = 1
-- To do this, we need to take compare employee_id between employees and employees_procjects tables
-- Then, we need to compare project_id between projects and employees_projects tables