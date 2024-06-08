CREATE VIEW continent_currency_usage AS
SELECT
    ranked_data.continent_code,
    ranked_data.currency_code,
    ranked_data.currency_usage
FROM
    (SELECT
        filtered_data.continent_code,
        filtered_data.currency_code,
        filtered_data.currency_usage,
        DENSE_RANK () OVER (
            PARTITION BY filtered_data.continent_code
            ORDER BY filtered_data.currency_usage DESC
            ) AS crr_rank_by_cont
    FROM
        (SELECT
            continent_code,
            currency_code,
            COUNT(currency_code) AS currency_usage
        FROM
            countries
        GROUP BY
            currency_code,
            continent_code
        HAVING
            COUNT(currency_code) > 1
        ORDER BY
            currency_usage) AS filtered_data
    ) AS ranked_data
WHERE
    ranked_data.crr_rank_by_cont = 1
ORDER BY
    ranked_data.currency_usage DESC,
    ranked_data.continent_code,
    ranked_data.currency_code;