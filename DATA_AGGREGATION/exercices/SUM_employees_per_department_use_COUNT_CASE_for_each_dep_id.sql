SELECT
    COUNT(CASE department_id WHEN 1 THEN 1 ELSE NULL END) AS "Engineering",
    COUNT(CASE department_id WHEN 2 THEN 1 ELSE NULL END) AS "Tool Design",
    COUNT(CASE department_id WHEN 3 THEN 1 ELSE NULL END) AS "Sales",
    COUNT(CASE department_id WHEN 4 THEN 1 ELSE NULL END) AS "Marketing",
    COUNT(CASE department_id WHEN 5 THEN 1 ELSE NULL END) AS "Purchasing",
    COUNT(CASE department_id WHEN 6 THEN 1 ELSE NULL END) AS "Research and Development",
    COUNT(CASE department_id WHEN 7 THEN 1 ELSE NULL END) AS "Production"
FROM employees;


--  It can work without 'ELSE NULL'.
-- After 'THEN' we can put other thing instead '1'. It doesn't matter.