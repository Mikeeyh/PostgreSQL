SELECT
    continent_name,
    TRIM(LEADING FROM continent_name) AS "trim"
FROM
    continents;

-- -> Cut all white spaces from the front side until it reaches the continent_name

SELECT
    continent_name,
    TRIM(TRAILING FROM continent_name) AS "trim"
FROM
    continents;

-- -> Cut all white spaces from the back side until it reaches the continent_name

SELECT
    continent_name,
    TRIM(continent_name) AS "trim"
FROM
    continents;

-- -> Cut all white spaces from both sides of the continent_name
