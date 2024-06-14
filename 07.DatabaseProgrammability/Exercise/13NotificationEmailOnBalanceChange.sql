CREATE TABLE notification_emails
(
    id           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    recipient_id INT,
    subject      TEXT,
    body         TEXT
);

CREATE OR REPLACE FUNCTION trigger_fn_send_email_on_balance_change()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO notification_emails(recipient_id, subject, body)
    VALUES (OLD.account_id,
            'Balance change for account: ' || OLD.account_id,
            CONCAT_WS(' ',
                'On', now()::DATE, 'your balance was changed from',
                OLD.new_sum, 'to', NEW.new_sum
            ));
    RETURN NEW;
END ;
$$;

CREATE TRIGGER tr_send_email_on_balance_change
    AFTER UPDATE
    ON logs
    FOR EACH ROW
    WHEN (OLD.new_sum <> NEW.new_sum)
    EXECUTE FUNCTION trigger_fn_send_email_on_balance_change();