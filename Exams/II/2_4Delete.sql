DELETE FROM clients
WHERE id in (SELECT
    c.id
FROM clients AS c
LEFT JOIN
    courses AS cr
ON
    c.id = cr.client_id
WHERE
    cr.client_id IS NULL
    AND
    LENGTH(c.full_name) > 3);