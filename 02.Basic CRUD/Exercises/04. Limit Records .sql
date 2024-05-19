SELECT
    em.id,
    CONCAT_WS(
    ' ',
    em.first_name,
    em.last_name
    ) AS full_name,
    job_title
FROM employees AS em
ORDER BY first_name
LIMIT 50
;