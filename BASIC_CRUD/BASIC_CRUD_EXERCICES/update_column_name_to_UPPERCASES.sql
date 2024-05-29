ALTER TABLE projects
ALTER COLUMN name TYPE VARCHAR(70) USING UPPER(name);


UPDATE
    projects

SET 
    name = UPPER(name);

-- RETURNING *; To check the result (updated date)