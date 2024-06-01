SELECT
    department_id,
    SUM(CASE WHEN salary IS NOT NULL THEN salary END) AS "Total Salary"
FROM employees
GROUP BY department_id

HAVING SUM(salary) < 4200

ORDER BY department_id;

-- We use HAVING to filter the result. Because we CANNOT use aggregate functions in WHERE statements.