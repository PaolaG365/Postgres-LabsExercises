CREATE VIEW view_continents_countries_currencies_details AS

    SELECT
        CONCAT(
            c.continent_name,
            ': ',
            c.continent_code
        ) AS continent_details,

        CONCAT_WS(
            ' - ',
            ctr.country_name,
            ctr.capital,
            ctr.area_in_sq_km,
            'km2'
        ) AS country_information,

        CONCAT(
            crr.description,
            ' (', crr.currency_code, ')'
        ) AS currencies

    FROM continents as c,
        countries as ctr,
        currencies as crr

    WHERE
        ctr.continent_code = c.continent_code AND ctr.currency_code = crr.currency_code

    ORDER BY
        country_information,
        currencies;