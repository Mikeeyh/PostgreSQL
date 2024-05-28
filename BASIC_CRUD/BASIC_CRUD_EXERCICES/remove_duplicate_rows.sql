-- As you can see, the "cities" table contains duplicate entries. 
-- Write an SQL query to retrieve DISTINCT city "name", sorting them 
-- in descending alphabetical order and eliminating duplicates. 
-- Do not forget to select the "area" column and keep the name 
-- of the column the same as in the previous task.

SELECT 
    DISTINCT name,
    area AS area_km2
FROM cities
ORDER BY name DESC;

SELECT DISTINCT ON (name),
    name,
    area AS area_km2
FROM cities
ORDER BY name DESC;