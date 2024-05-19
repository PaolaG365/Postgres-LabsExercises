SELECT
    CONCAT(
    e.first_name,
    ' ',
    e.last_name
    ) AS full_name,
    e.job_title,
    e.salary
FROM employees as e
WHERE
    e.salary IN (12500, 14000, 23600, 25000)
ORDER BY e.salary DESC;