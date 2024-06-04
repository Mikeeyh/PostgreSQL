SELECT
	COUNT(*)
FROM 
    employees
WHERE 
    salary >(SELECT AVG(salary) FROM employees)

-- Count the number of employees that have higher salary than the average one
