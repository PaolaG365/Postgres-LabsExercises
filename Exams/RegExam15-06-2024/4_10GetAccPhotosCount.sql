CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
RETURNS INT
LANGUAGE plpgsql
AS
$$
    DECLARE photos_count INT;
    BEGIN 
        SELECT
            COUNT(*) INTO photos_count
        FROM accounts_photos AS ac
        JOIN accounts AS a
        ON ac.account_id = a.id
        WHERE a.username = account_username;
        RETURN photos_count;
    end;
$$;