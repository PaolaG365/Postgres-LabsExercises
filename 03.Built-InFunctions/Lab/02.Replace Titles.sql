UPDATE books
SET title = REPLACE(title, 'The', '***')
WHERE substring(title, 1, 3) = 'The'
RETURNING title;