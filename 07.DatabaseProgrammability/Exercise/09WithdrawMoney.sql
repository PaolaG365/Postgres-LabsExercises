CREATE OR REPLACE PROCEDURE sp_withdraw_money(
    account_id INT,
    money_amount NUMERIC(10, 4)
)
LANGUAGE plpgsql
AS
$$
    DECLARE
        account_balance NUMERIC;
    BEGIN
        account_balance := (SELECT balance FROM accounts WHERE id = account_id);

        IF account_balance > money_amount THEN
            UPDATE accounts
            SET balance = balance - money_amount
            WHERE id = account_id;

        ELSE
            RAISE NOTICE 'Insufficient balance to withdraw %', money_amount;
        END IF;

    END;
$$;
