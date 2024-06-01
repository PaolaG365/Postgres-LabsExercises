SELECT  -- izmaistoreno e
    COUNT(*)
FROM
    employees AS e,
    (
        SELECT
            AVG(salary) AS avg_S
        FROM employees
    ) AS avg_salary
WHERE
    e.salary > avg_salary.avg_S;
