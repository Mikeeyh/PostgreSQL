UPDATE currencies
SET description = SUBSTRING(description FROM 5);

ALTER TABLE currencies
RENAME COLUMN description TO substring;

SELECT substring FROM currencies;

--  OR:

SELECT
    SUBSTRING(description FROM 5)
FROM 
    currencies;