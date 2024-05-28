-- From the selected already data combine the "name" and "state", 
-- fields into a single field called "cities_information". 
-- Rename the "area" column as "area_km2".

SELECT 
    CONCAT(name, ' ', state) AS cities_information,
    area AS area_km2
FROM cities
ORDER BY id;