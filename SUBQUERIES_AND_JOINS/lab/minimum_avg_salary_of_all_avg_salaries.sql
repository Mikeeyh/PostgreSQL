SELECT min(avg_salary)
FROM
    (
        SELECT AVG(salary) AS avg_salary
        FROM persons
        GROUP BY country_id
    ) AS a;