CREATE OR REPLACE PROCEDURE sp_transfer_money(
    sender_id INT,
    receiver_id INT,
    amount NUMERIC(19, 4)
)
LANGUAGE  plpgsql
AS
$$
    DECLARE
        sender_balance NUMERIC;
    BEGIN
        CALL sp_withdraw_money(sender_id, amount); -- this needs to fail first the to rollback i guess idk...
        CALL sp_deposit_money(receiver_id, amount);

        SELECT balance INTO sender_balance FROM accounts WHERE id = sender_id;

        IF sender_balance < 0 THEN
            ROLLBACK;
        end if;
    END;
$$;
