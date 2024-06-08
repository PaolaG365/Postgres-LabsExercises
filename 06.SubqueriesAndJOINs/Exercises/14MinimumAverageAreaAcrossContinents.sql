SELECT
    MIN(continent_avg)
FROM
    (SELECT
        AVG(c.area_in_sq_km) AS continent_avg
    FROM countries AS c
    GROUP BY
        c.continent_code
    ) AS avg_table;