SELECT
    p.name,
    p.start_date
FROM projects as p
WHERE
    p.name IN ('Mountain', 'Road', 'Touring')
LIMIT 20;