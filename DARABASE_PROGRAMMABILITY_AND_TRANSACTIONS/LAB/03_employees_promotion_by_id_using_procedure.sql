CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id INT)
AS
$$
BEGIN
    if(SELECT salary FROM employees WHERE employee_id = id) IS NULL THEN
        RETURN;
    END IF;

    UPDATE employees SET salary = salary * 1.05 WHERE employee_id = id;
    COMMIT;
END;
$$
LANGUAGE plpgsql;

-- OR:

CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(emp_id INT)
AS
$$
BEGIN
    -- Check if the employee exists and update the salary
    UPDATE employees
    SET salary = salary * 1.05
    WHERE employee_id = emp_id;

    -- If no rows were updated, raise an exception
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Employee with ID % does not exist', emp_id;
    END IF;
END;
$$
LANGUAGE plpgsql;