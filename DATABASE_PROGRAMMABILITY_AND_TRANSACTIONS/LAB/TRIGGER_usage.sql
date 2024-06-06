-- Creating a table items

CREATE TABLE items (
	id SERIAL PRIMARY KEY,
	status INT,
	created DATE
);

-- Creating second table items_log where we will add each data inserted in items table

CREATE TABLE items_log (
	id SERIAL PRIMARY KEY,
	status INT,
	created DATE
);

-- Creating function that inserts from items to items_log and returns trigger

CREATE FUNCTION log_items()
RETURNS TRIGGER
AS
$$
	BEGIN
		INSERT INTO items_log (status, created)
		VALUES (new.status, new.created);
		RETURN new;
	END;
$$
LANGUAGE plpgsql;

-- Creating trigger that will be auto executed for each row

CREATE TRIGGER log_items_trigger
AFTER INSERT ON items
FOR EACH ROW 
EXECUTE PROCEDURE log_items();

-- Adding data in items table:

INSERT INTO items(status, created)
VALUES
	(1, now()),
	(2, now()),
	(3, now()),
	(4, now()),
	(5, now()),
	(6, now())
;	

SELECT * FROM items

-- And it is auto added in items_log table:

    1	1	"2024-06-05"
    2	2	"2024-06-05"
    3	3	"2024-06-05"
    4	4	"2024-06-05"
    5	5	"2024-06-05"
    6	6	"2024-06-05"


-- CREATE NEW FUNCTION FOR DELETION TRIGGER:

CREATE OR REPLACE FUNCTION delete_last_itemslog()
RETURNS TRIGGER
AS
$$
    BEGIN
        WHILE (SELECT COUNT(*) FROM items_log) > 10 LOOP
            DELETE FROM items_log WHERE id = (SELECT min(id) FROM items_log);
        END LOOP;
        RETURN new;
    END;
$$
LANGUAGE plpgsql;

-- Here we are deleting old records until we have 10 left. So, we just have last 10 records in our items_log table.
-- That's why we use 'min()' in order to delete from first record (FIFO).


-- CREATE TRIGGER FOR DELETION

CREATE OR REPLACE TRIGGER clear_items_log_triger
AFTER INSERT ON items_log
FOR EACH STATEMENT 
EXECUTE PROCEDURE delete_last_itemslog();
