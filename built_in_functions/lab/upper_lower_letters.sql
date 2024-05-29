UPDATE employees
SET last_name = CONCAT(upper(left(last_name, 1)), lower(right(last_name, -1)))
RETURNING *

-- upper(left(last_name, 1)) Takes first letter and updates it to UPPER
-- lower(right(last_name, -1))) Takes all letters from the 2nd one and updates it to LOWER
-- Then, we concatenate both.