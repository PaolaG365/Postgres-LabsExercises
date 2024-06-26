SELECT
    c.country_name,
    r.river_name
FROM
    countries AS c
LEFT JOIN
    countries_rivers AS cr
USING
    (country_code)
LEFT JOIN
    rivers AS r
ON
    cr.river_id = r.id
JOIN
    continents AS cont
ON
    c.continent_code = cont.continent_code
WHERE
    cont.continent_name = 'Africa'
ORDER BY
    c.country_name
LIMIT 5;
