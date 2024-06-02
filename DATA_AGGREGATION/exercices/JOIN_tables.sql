SELECT 
	dep.id,
	dep.department_name,
	dep.manager_id,
	emp.id,
	emp.first_name,
	emp.last_name,
	emp.job_title,
	emp.department_id,
	emp.manager_id,
	emp.hire_date,
	emp.salary,
	emp.address_id
FROM employees AS emp, departments as dep
WHERE dep.id = emp.department_id

-- 

SELECT 
*
FROM departments as d
	JOIN employees as e
		ON d.id = e.department_id