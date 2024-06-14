CREATE TABLE deleted_employees (
    employee_id SERIAL PRIMARY KEY ,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    middle_name VARCHAR(20) DEFAULT NULL,
    job_title VARCHAR(50),
    department_id INT,
    salary NUMERIC(19, 4)
);

CREATE OR REPLACE FUNCTION fn_fired_employees ()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO
            deleted_employees (first_name, last_name, job_title, department_id, salary)
        VALUES
            (OLD.first_name, OLD.last_name, OLD.job_title, OLD.department_id, OLD.salary);
        RETURN OLD;
    END;
$$;

CREATE TRIGGER fired_employees_data
    BEFORE DELETE ON employees
    FOR EACH ROW
    EXECUTE FUNCTION fn_fired_employees();