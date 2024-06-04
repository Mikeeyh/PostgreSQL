SELECT
	MIN(average_area) AS min_average_area
FROM
	(
		SELECT
			AVG(area_in_sq_km) AS average_area
		FROM
			countries
		GROUP BY 
			continent_code
	
	) AS min_average_area

-- We are calculation MIN average_are which is found by nested select
-- The 2nd select is calculating the average area from countries table and grouped by continent code


-- 1) Here is AVG area of each continent:

SELECT
    continent_code,
    AVG(area_in_sq_km) AS average_area
FROM
	countries
GROUP BY 
	continent_code

    "NA"	597842.780487804878
    "AF"	523453.379310344828
    "EU"	435470.603773584906
    "AN"	2802438.600000000000
    "SA"	1272750.571428571429
    "AS"	607754.384615384615
    "OC"	315685.370370370370

-- 2) Now we need to do nested, in order to get the MIN AVG area.

SELECT
	MIN(average_area) AS min_average_area

-- (adding)
FROM
    (
    SELECT
        continent_code,
        AVG(area_in_sq_km) AS average_area
    FROM
        countries
    GROUP BY 
        continent_code
    ) AS min_average_area
-- 