CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(
    searched_balance INT
)
    LANGUAGE plpgsql
AS
$$
DECLARE
    holder_info RECORD;
BEGIN
    FOR holder_info IN
        SELECT
            ah.first_name,
            ah.last_name,
            SUM(a.balance) AS balance
        FROM
            account_holders AS ah
        JOIN
            accounts AS a
        ON
            ah.id = a.account_holder_id
        GROUP BY
            ah.first_name,
            ah.last_name
        HAVING
            SUM(a.balance) > searched_balance
        ORDER BY
            ah.first_name,
            ah.last_name
    LOOP
        RAISE NOTICE '% % - %', holder_info.first_name, holder_info.last_name, holder_info.balance;
    END LOOP;
END;
$$;

CALL sp_retrieving_holders_with_balance_higher_than(20000);