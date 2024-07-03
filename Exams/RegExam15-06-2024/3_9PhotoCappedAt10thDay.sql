SELECT
--     CASE
--         WHEN LENGTH(description) > 10 THEN SUBSTRING(description, 1, 10) || '...'
--         WHEN description IS NULL THEN '...'
--         ELSE description
--     END AS summary, -- i dont see a difference wtf between those two
    coalesce(left(description, 10) || '...', '...') as summary,
    TO_CHAR(capture_date, 'DD.MM HH24:MI') AS date
FROM photos
WHERE
    EXTRACT(DAY FROM capture_date) = 10
ORDER BY
    capture_date DESC;