SELECT
    ad.name,
    CASE
        WHEN EXTRACT(HOUR FROM start) BETWEEN 6 AND 20 THEN 'Day'
        ELSE 'Night'
    END AS day_time,
    cr.bill,
    cl.full_name,
    c.make,
    c.model,
    cat.name
FROM
    courses AS cr
JOIN
    addresses AS ad
ON
    cr.from_address_id = ad.id
JOIN
    cars AS c
ON
    cr.car_id = c.id
JOIN
    categories AS cat
ON
    c.category_id = cat.id
JOIN
    clients AS cl
ON
    cr.client_id = cl.id
ORDER BY
    cr.id; -- a whole verse