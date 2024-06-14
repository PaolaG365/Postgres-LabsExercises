CREATE OR REPLACE FUNCTION fn_count_employees_by_town(
    town_name VARCHAR(20))
RETURNS TABLE(count bigint)
LANGUAGE plpgsql
AS
$$
    BEGIN
        RETURN QUERY
            SELECT
                COUNT(*)
            FROM
                employees AS e
            JOIN
                addresses AS a
            USING
                (address_id)
            JOIN
                towns AS t
            USING
                (town_id)
            WHERE
                t.name = town_name;
    END;
$$;

SELECT * FROM fn_count_employees_by_town('Sofia');
