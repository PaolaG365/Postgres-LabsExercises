CREATE OR REPLACE PROCEDURE sp_increase_salaries
    (department_name VARCHAR(50))
LANGUAGE plpgsql
AS
$$
    BEGIN
        UPDATE employees AS e
        SET salary = salary * 1.05
        WHERE e.employee_id IN (
            SELECT
                e.employee_id
            FROM
                employees AS e
            JOIN
                departments AS d
            USING
                (department_id)
            WHERE
                d.name = department_name
            );
    END;
$$;