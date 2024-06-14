CREATE OR REPLACE FUNCTION fn_full_name(
    first_name VARCHAR(30),
    last_name VARCHAR(30)
)
RETURNS VARCHAR(100)
LANGUAGE plpgsql
AS
$$
    BEGIN
        RETURN CONCAT(INITCAP(first_name), ' ', INITCAP(last_name));
    end;
$$;