SELECT
    e.employee_id,
    CONCAT(
        e.first_name,
        ' ',
        e.last_name
    ) AS full_name,
    ep.project_id,
    p.name
FROM employees_projects AS ep
    JOIN
        employees AS e
    USING
        (employee_id)
    JOIN
        projects AS p
    USING
        (project_id)
WHERE
    ep.project_id = 1;
