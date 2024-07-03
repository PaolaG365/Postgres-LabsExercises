SELECT
    a.id || ' ' || a.username AS id_username,
    email
FROM
    accounts_photos AS ac
JOIN
    accounts AS a
ON
    ac.account_id = a.id
WHERE
    a.id = ac.photo_id
ORDER BY
    a.id;