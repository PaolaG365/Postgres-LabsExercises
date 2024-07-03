SELECT
    ph.id AS photo_id,
    ph.capture_date,
    ph.description,
    COUNT(cm.photo_id) AS comments_count
FROM
    comments AS cm
JOIN
    photos AS ph
ON
    cm.photo_id = ph.id
WHERE
    description IS NOT NULL
GROUP BY
    ph.id,
    ph.capture_date,
    ph.description
ORDER BY
    comments_count DESC,
    photo_id
LIMIT 3;