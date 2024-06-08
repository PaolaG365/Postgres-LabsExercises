WITH row_number AS (
    SELECT
        c.country_name,
        p.peak_name,
        MAX(p.elevation) AS elevation,
        m.mountain_range AS mountain
    FROM
        countries AS c
    LEFT JOIN
        mountains_countries AS mc
    USING
        (country_code)
    LEFT JOIN
        mountains AS m
    ON
        m.id = mc.mountain_id
    LEFT JOIN
        peaks AS p
    ON
        p.mountain_id = m.id
    GROUP BY
        c.country_name, p.peak_name, m.mountain_range
)
SELECT
    ranking_list.country_name,
    COALESCE(ranking_list.highest_peak_name, '(no highest peak)') AS highest_peak_name,
    COALESCE(ranking_list.elevation, 0) AS highest_peak_elevation,
    CASE
        WHEN ranking_list.highest_peak_name IS NULL THEN '(no mountain)'
        ELSE ranking_list.mountain
    END
FROM (
    SELECT
        row_number.country_name,
        row_number.peak_name AS highest_peak_name,
        ROW_NUMBER() over (
            PARTITION BY
                row_number.country_name
            ORDER BY
                row_number.elevation DESC
            ) AS rank,
        row_number.elevation,
        row_number.mountain
    FROM
        row_number
    ) AS ranking_list
WHERE
    ranking_list.rank = 1;  -- a work of art