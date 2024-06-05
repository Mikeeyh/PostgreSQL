CREATE TABLE bank (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    amount INT
);

INSERT INTO bank (id, name, amount)
VALUES 
    (1, 'Mike', 100),
    (2, 'Maraya', 800);

SELECT * FROM bank;

-- Transfer money:

CREATE OR REPLACE PROCEDURE st_transfer_money(
    IN sender_id INT,
    IN receiver_id INT,
    IN transfer_amount INT,
    OUT status VARCHAR(30)
)
AS
$$
    DECLARE
        sender_amount INT;
        receiver_amount INT;
        temp_val INT;
    BEGIN

        -- Check if the amount of txn is bigger than the balance:
        SELECT amount FROM bank WHERE id = sender_id INTO sender_amount;
        IF sender_amount < transfer_amount THEN
            status := 'Not enough money!';
            RETURN;
        END IF;

        -- Updating receiver&sender balances:
        SELECT amount FROM bank WHERE id = receiver_id INTO receiver_amount;
        UPDATE bank SET amount = amount - transfer_amount WHERE id = sender_id;
        UPDATE bank SET amount = amount + transfer_amount WHERE id = receiver_id;

        -- Check if there is an error in sender:
        SELECT amount FROM bank WHERE id = sender_id INTO temp_val;
        IF sender_amount - transfer_amount <> temp_val THEN
            status := 'Error in sender!';
            ROLLBACK;
            RETURN;
        END IF;

        -- Check if there is an error in receiver:
        SELECT amount FROM bank WHERE id = receiver_id INTO temp_val;
        IF receiver_amount + transfer_amount <> temp_val THEN
            status := 'Error in receiver!';
            ROLLBACK;
            RETURN;
        END IF;
        
        -- No issues, Commit initiated and update saved. Transaction done.
        status := 'Money transfered!';
        COMMIT;
END;
$$
LANGUAGE plpgsql;

CALL st_transfer_money(1, 2, 400, NULL);

-- Adding 'NULL' because it will return something
