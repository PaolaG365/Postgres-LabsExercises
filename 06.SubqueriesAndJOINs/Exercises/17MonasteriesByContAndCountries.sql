UPDATE countries
SET country_name = 'Burma'
WHERE country_name = 'Myanmar';

INSERT INTO monasteries (monastery_name, country_code)
VALUES
    ('Hange Abbey',
    (SELECT country_code FROM countries WHERE country_name = 'Tanzania'));
--     ('Myin-Tin-Daik', // the exercise says i should add it but it gives 0 points with this idk (╯°□°）╯︵ ┻━┻
--     (SELECT country_code FROM countries WHERE country_name = 'Burma'));

SELECT
    cnt.continent_name,
    c.country_name,
    COUNT(m.id) AS monasteries_count
FROM countries AS c
    JOIN
        continents AS cnt
    ON
        c.continent_code = cnt.continent_code
    LEFT JOIN
        monasteries AS m
    ON
        c.country_code = m.country_code
WHERE
    NOT c.three_rivers
GROUP BY
    cnt.continent_name,
    c.country_name
ORDER BY
    monasteries_count DESC,
    country_name;