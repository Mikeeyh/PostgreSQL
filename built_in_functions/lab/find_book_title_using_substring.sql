SELECT
	title
FROM books
WHERE substring(title, 1, 3) = 'The'

-- We are searching from 1st to 3th letter of the title
-- and check if it is equal to 'The'