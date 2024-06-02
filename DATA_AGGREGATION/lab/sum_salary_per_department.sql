SELECT
    department_id,
    SUM(CASE WHEN salary IS NOT NULL THEN salary END) AS total_salaries
FROM employees
GROUP BY department_id
ORDER BY department_id;

--  USING CASE WHEN -> END, gives us the opportunity to present the department with NULL value.

SELECT
    department_id,
    SUM(salary ) AS total_salaries
FROM employees
GROUP BY department_id
ORDER BY department_id;