CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
    IN animal_name VARCHAR(30), OUT status VARCHAR(50)
)
LANGUAGE plpgsql
AS
$$
    BEGIN
        SELECT
            o.name INTO status
        FROM
            owners AS o
        JOIN
            animals AS a
        ON
            o.id = a.owner_id
        WHERE
            a.name = animal_name;

        IF status IS NULL THEN status := 'For adoption';
        END IF;
    END;
$$;

DO $$  -- cant really get the result of the procedure in other way, gpt helped
DECLARE
    animal_status VARCHAR(50);
BEGIN
    -- Call the procedure and capture the output
    CALL sp_animals_with_owners_or_not('Pumpkinseed Sunfish', animal_status);

    -- Print the result
    RAISE NOTICE 'Animal Status: %', animal_status;
END $$;
