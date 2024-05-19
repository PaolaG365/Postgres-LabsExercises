SELECT
    e.id,
    CONCAT_WS(
    ' ',
    e.first_name,
    e.middle_name,
    e.last_name
    ) AS full_name,
    e.hire_date
FROM employees AS e
ORDER BY e.hire_date
OFFSET 9
;