-- Without PROCEDURE

UPDATE employees
SET salary = salary + salary * 1.05
WHERE department_id = 
	(SELECT department_id FROM departments WHERE name = 'Production')
;

-- With PROCEDURE

CREATE OR REPLACE PROCEDURE sp_increase_salaries(department_name VARCHAR)
AS
$$
	BEGIN
		-- ADD
		UPDATE employees
		SET salary = salary + salary * 0.05
		WHERE department_id = 
			(SELECT department_id FROM departments WHERE name = department_name)
		;
		-- END
	END;
$$
LANGUAGE plpgsql;

-- We call the procedure by 'CALL', ex:

CALL sp_increase_salaries('Marketing')

-- With PROCEDURE and OUT parameter

CREATE OR REPLACE PROCEDURE sp_increase_salaries(department_name VARCHAR, OUT result INT)
AS
$$
	BEGIN
		-- ADD
		UPDATE employees
		SET salary = salary + salary * 0.05
		WHERE department_id = 
			(SELECT department_id FROM departments WHERE name = department_name);
			result := 1;
		-- END
	END;
$$
LANGUAGE plpgsql;

-- We call the procedure by 'CALL' and give the OUT parameter, ex:

CALL sp_increase_salaries('Marketing', NULL)