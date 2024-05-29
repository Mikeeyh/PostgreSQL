SELECT
	title
FROM books
WHERE left(title, 3) = 'The'

-- Gives us first 3 letters from the left of the title