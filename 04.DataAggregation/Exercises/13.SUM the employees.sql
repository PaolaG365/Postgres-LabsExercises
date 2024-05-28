SELECT
    SUM(CASE
        WHEN department_id = 1 THEN 1 ELSE 0
    END) AS Engineering,
    SUM(CASE
        WHEN department_id = 2 THEN 1 ELSE 0
    END) AS "Tool Design",
    SUM(CASE
        WHEN department_id = 3 THEN 1 ELSE 0
    END) AS Sales,
    SUM(CASE
        WHEN department_id = 4 THEN 1 ELSE 0
    END) AS Marketing,
    SUM(CASE
        WHEN department_id = 5 THEN 1 ELSE 0
    END) AS Purchasing,
    SUM(CASE
        WHEN department_id = 6 THEN 1  ELSE 0
    END) AS "Research and Development",
    SUM(CASE
        WHEN department_id = 7 THEN 1 ELSE 0
    END)AS Production
FROM employees;


-- another way, not for judge
SELECT
    department_name,
    COUNT(*) AS total_employees
FROM (
    SELECT
        department_id,
        CASE
            WHEN department_id = 1 THEN 'Engineering'
            WHEN department_id = 2 THEN 'Tool Design'
            WHEN department_id = 3 THEN 'Sales'
            WHEN department_id = 4 THEN 'Marketing'
            WHEN department_id = 5 THEN 'Purchasing'
            WHEN department_id = 6 THEN 'Research and Development'
            WHEN department_id = 7 THEN 'Production'
            ELSE 'Other'
        END AS department_name
    FROM employees
) AS employees_by_dept
GROUP BY department_name;