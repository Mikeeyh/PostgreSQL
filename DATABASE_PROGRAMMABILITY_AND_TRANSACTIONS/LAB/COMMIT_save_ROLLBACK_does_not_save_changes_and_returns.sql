BEGIN;
INSERT INTO country (id, country_name)
VALUES (15, 'Vietnam');
ROLLBACK;
COMMIT;

-- ROLLBACK does not save the update
-- COMMIT saves the update