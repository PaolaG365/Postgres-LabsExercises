DELETE FROM board_games
WHERE board_games.publisher_id IN (
    SELECT p.id
    FROM publishers AS p
    JOIN addresses AS a ON a.id = p.address_id
    WHERE SUBSTRING(a.town, 1, 1) = 'L');

DELETE FROM publishers
WHERE publishers.address_id IN (
    SELECT
        a.id
    FROM addresses AS a
    WHERE SUBSTRING(a.town, 1, 1) = 'L'
    );

DELETE FROM addresses
WHERE
    SUBSTRING(town, 1, 1) = 'L';

-- i don't like this way idk...

-- Step 1: Create a CTE to gather the IDs for deletion,
-- my idea to use cte didnt work so i used gpt to shape it a little,
-- just wanna see if it works, huzzah it works
WITH ids_for_deletion AS (
    SELECT
        bg.id AS board_game_id,
        p.id AS publisher_id,
        a.id AS address_id
    FROM
        board_games AS bg
    JOIN
        publishers AS p ON bg.publisher_id = p.id
    JOIN
        addresses AS a ON p.address_id = a.id
    WHERE
        SUBSTRING(a.town, 1, 1) = 'L'
)

-- Step 2: Delete from board_games using the CTE
, delete_board_games AS (
    DELETE FROM board_games
    WHERE id IN (SELECT board_game_id FROM ids_for_deletion)
    RETURNING id
)

-- Step 3: Delete from publishers using the CTE
, delete_publishers AS (
    DELETE FROM publishers
    WHERE id IN (SELECT publisher_id FROM ids_for_deletion)
    RETURNING id
)

-- Step 4: Delete from addresses using the CTE
DELETE FROM addresses
WHERE id IN (SELECT address_id FROM ids_for_deletion);