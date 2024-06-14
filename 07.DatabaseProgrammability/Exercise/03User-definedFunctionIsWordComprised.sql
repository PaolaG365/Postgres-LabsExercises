CREATE OR REPLACE FUNCTION fn_is_word_comprised(
    set_of_letters VARCHAR(50),
    word VARCHAR(50)
)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS
$$
    BEGIN
        RETURN translate(LOWER(word), LOWER(set_of_letters), '') = '';
    end;
$$;