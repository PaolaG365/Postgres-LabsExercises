INSERT INTO addresses(street, town, country, account_id)
SELECT
    acc.username,
    acc.password,
    acc.ip,
    acc.age
FROM accounts AS acc
WHERE
    gender = 'F';