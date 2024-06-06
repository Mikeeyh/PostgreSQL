DELETE FROM 
	volunteers
WHERE 
	department_id = (SELECT id FROM volunteers_departments WHERE department_name = 'Education program assistant')
;

DELETE FROM 
	volunteers_departments WHERE department_name = 'Education program assistant'
;

-- We are deleting the people with the given dep id
-- Then, we delete the department with the given dep id

SELECT * FROM volunteers_departments;

SELECT * FROM volunteers WHERE department_id = 2;

-- USING CASCADE:
DELETE FROM volunteers_departments 
WHERE department_name = 'Education program assistant';