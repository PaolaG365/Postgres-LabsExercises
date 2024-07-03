SELECT
    name,
    rating
FROM board_games
ORDER BY
    release_year,
    name DESC; -- datagrip is rounding the rating to int idk, well it works