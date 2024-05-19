SELECT
    CONCAT(
    c.name,
    ' ',
    c.state
    ) AS cities_information,
    c.area AS area_km2
FROM cities AS c;