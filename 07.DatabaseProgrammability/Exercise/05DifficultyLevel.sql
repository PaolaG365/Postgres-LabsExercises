CREATE OR REPLACE FUNCTION fn_difficulty_level (
    level INT
)
RETURNS VARCHAR(30)
LANGUAGE plpgsql
AS
$$
    DECLARE diff_lvl VARCHAR(30);
    BEGIN
        IF level <= 40 THEN
            diff_lvl := 'Normal Difficulty';
        ELSIF level BETWEEN 41 AND 60 THEN
            diff_lvl := 'Nightmare Difficulty';
        ELSE
            diff_lvl := 'Hell Difficulty';
        END IF;
        RETURN diff_lvl;
    END;
$$;

SELECT
    ug.user_id,
    ug.level,
    ug.cash,
    fn_difficulty_level(ug.level) AS "difficulty_level"
FROM users_games AS ug
ORDER BY
    ug.user_id;