SELECT
	replace(title, left(title, 3), '***')
FROM books
WHERE left(title, 3) = 'The'

-- We are replacing first 3 letters of title with '***' 
-- only for titles starting with 'The'