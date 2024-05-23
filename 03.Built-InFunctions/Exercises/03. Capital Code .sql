ALTER TABLE countries
ADD COLUMN capital_code CHAR(2);

UPDATE countries
SET capital_code = SUBSTRING(capital, 1, 2); -- without WHERE works in judge, i just didn't want it itering over null capitals
WHERE countries.capital IS NOT NULL;