SELECT
    department_id,
    AVG(CASE WHEN salary IS NOT NULL THEN salary END) AS total_salaries
FROM employees
GROUP BY department_id
ORDER BY department_id;