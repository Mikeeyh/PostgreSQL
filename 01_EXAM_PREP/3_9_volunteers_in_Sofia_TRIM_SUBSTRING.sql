SELECT
	v.name AS volunteers,
	v.phone_number,
	SUBSTRING(address FROM POSITION(',' IN address) + 2)
    -- OR: SUBSTRING(TRIM(REPLACE(v.address, 'Sofia', '')), 3)
FROM 
	volunteers as v
JOIN
	volunteers_departments as vd
ON 
	vd.id = v.department_id
WHERE
	vd.department_name = 'Education program assistant'
	AND
	v.address LIKE '%Sofia%'
ORDER BY 
	v.name ASC