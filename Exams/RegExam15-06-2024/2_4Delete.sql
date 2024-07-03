DELETE FROM addresses
WHERE id % 2 = 0 AND LOWER(street) LIKE '%r%';


DELETE FROM addresses
WHERE id % 2 = 0 AND street ~* 'r'; -- just wanna see if it works later3