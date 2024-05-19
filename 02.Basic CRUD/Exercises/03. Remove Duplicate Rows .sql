SELECT
DISTINCT
    c.name,
    c.area AS area_km2
FROM cities AS c
ORDER BY name DESC
;