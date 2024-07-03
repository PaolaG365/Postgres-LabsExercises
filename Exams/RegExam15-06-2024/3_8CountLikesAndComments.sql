SELECT
    aggr_result.photo_id,
    COALESCE(aggr_result.lc, 0) AS likes_count,
    COALESCE(aggr_result.cc, 0) AS comments_count
FROM
    ((
        SELECT
            p.id AS photo_id,
            COUNT(*) AS lc
        FROM likes AS l
        JOIN photos AS p
        ON l.photo_id = p.id
        GROUP BY p.id
    ) AS likes_c
FULL JOIN
    (
        SELECT
            p.id AS photo_id,
            COUNT(*) AS cc
        FROM photos AS p
        JOIN comments AS c
        ON c.photo_id = p.id
        GROUP BY p.id
    ) AS comment_c
USING (photo_id) ) AS aggr_result
ORDER BY
    likes_count DESC,
    comments_count DESC,
    photo_id;  -- doesnt work no matter how i change it idk


SELECT
    p.id AS photo_id,
    COUNT( DISTINCT l.id) AS likes_count,
    COUNT(DISTINCT c.id) AS comments_count
FROM photos AS p
LEFT JOIN comments AS c ON p.id = c.photo_id
LEFT JOIN likes AS l ON p.id = l.photo_id
GROUP BY p.id
ORDER BY
    likes_count DESC,
    comments_count DESC,
    photo_id; -- ffs

