SELECT
    name,
    start_date
FROM projects
WHERE name LIKE 'MOUNT%'
ORDER BY id; -- doesn't return anything locally but works in judge idk why????
