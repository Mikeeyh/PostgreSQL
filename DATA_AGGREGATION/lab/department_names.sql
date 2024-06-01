SELECT
    emp.id AS employee_id,
    emp.first_name,
    emp.last_name,
    TRUNC(emp.salary, 2) AS salary,
    emp.department_id,
    CASE emp.department_id
        WHEN 1 THEN 'Management'
        WHEN 2 THEN 'Kitchen Staff'
        WHEN 3 THEN 'Service Staff'
        ELSE 'Other'
    END AS department_name
FROM employees AS emp
ORDER BY emp.id;