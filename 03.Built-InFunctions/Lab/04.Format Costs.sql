-- both work, first returns string, second numeric

SELECT
    title,
    to_char(cost, '99.999') AS modified_price
FROM books;

SELECT
    title,
    CAST(cost AS NUMERIC(10,3)) AS modified_price
FROM books;