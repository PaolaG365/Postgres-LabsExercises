SELECT
    adr.id,
    CONCAT(
    adr.number,
    ' ',
    adr.street
    ) AS address,
    city_id
FROM addresses AS adr
WHERE adr.id >= 20;