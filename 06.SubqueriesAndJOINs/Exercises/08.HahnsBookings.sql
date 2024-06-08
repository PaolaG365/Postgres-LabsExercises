SELECT -- both work
    COUNT(*)
FROM (
    SELECT
        c.last_name,
        b.booked_for
    FROM
        customers AS c
    JOIN
        bookings AS b
    USING
        (customer_id)
    WHERE
        c.last_name = 'Hahn'
    ) AS bookings_by_customer;

SELECT
    COUNT(*)
FROM
    customers AS c
JOIN
    bookings AS b
USING
    (customer_id)
WHERE
    c.last_name = 'Hahn';