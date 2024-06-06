CREATE OR REPLACE PROCEDURE sp_withdraw_money(
    account_id INT,
    money_amount NUMERIC
)
AS 
$$
DECLARE
    account_balance NUMERIC;
BEGIN
    -- Retrieve the current balance of the account
    SELECT balance INTO account_balance
    FROM accounts
    WHERE id = account_id;
    
    -- Check if the account balance is sufficient for the withdrawal
    IF account_balance < money_amount THEN
        RAISE NOTICE 'Insufficient balance to withdraw %.', money_amount;
        RETURN;
    END IF;
    
    -- Update the account balance
    UPDATE accounts
    SET balance = balance - money_amount
    WHERE id = account_id;
	COMMIT;
END;
$$
LANGUAGE plpgsql;

-- Example call to the procedure
CALL sp_withdraw_money(6, 54332432424237.0000);

-- Check the balance after withdrawal
SELECT balance FROM accounts WHERE id=6;

-- OR:

CREATE OR REPLACE PROCEDURE sp_withdraw_money(
	account_id INT,
	money_amount NUMERIC(4)
)
AS 
$$
DECLARE
	current_balance NUMERIC;
BEGIN
	current_balance := (SELECT balance FROM accounts WHERE id = account_id);
	
	IF money_amount <= current_balance THEN
		UPDATE
			accounts
		SET 
			balance = balance - money_amount
		WHERE 
			id = account_id;
	ELSE
		RAISE NOTICE 'Insufficient balance to withdraw %', money_amount;
	END IF;
END;
$$
LANGUAGE plpgsql;