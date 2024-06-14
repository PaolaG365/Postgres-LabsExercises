CREATE OR REPLACE FUNCTION fn_cash_in_users_games(
    game_name VARCHAR(50)
)
RETURNS TABLE (
    total_cash NUMERIC
    )
LANGUAGE plpgsql
AS
$$
    BEGIN
    RETURN QUERY
    SELECT
        ROUND(SUM(game_data.cash), 2)
    FROM
        (SELECT
            ug.cash,
            ROW_NUMBER() over (
                ORDER BY ug.cash DESC
            ) AS row_n
        FROM
            users_games AS ug
        JOIN
            games AS g
        ON
            ug.game_id = g.id
        WHERE
            g.name = game_name
        ) AS game_data
    WHERE
        game_data.row_n % 2 = 1;
    END;
$$;