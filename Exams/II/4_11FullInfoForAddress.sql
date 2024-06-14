CREATE OR REPLACE PROCEDURE sp_courses_by_address(
    IN address_name VARCHAR(100)
)
LANGUAGE plpgsql
AS
$$
    BEGIN
        TRUNCATE search_results;
        INSERT INTO search_results(address_name, full_name, level_of_bill, make, condition, category_name)
        SELECT
            add.name AS address_name,
            cl.full_name,
            CASE
                WHEN cr.bill <= 20 THEN 'Low'
                WHEN cr.bill <= 30 THEN 'Medium'
                ELSE 'High'
            END AS level_of_bill,
            c.make,
            c.condition,
            cat.name AS category_name
        FROM
            courses AS cr
        JOIN
            addresses AS add
        ON
            cr.from_address_id = add.id
        JOIN
            clients AS cl
        ON
            cr.client_id = cl.id
        JOIN
            cars AS c
        ON
            cr.car_id = c.id
        JOIN
            categories AS cat
        ON
            c.category_id = cat.id
        WHERE
            add.name = address_name
        ORDER BY
            c.make,
            cl.full_name
        ;
    end;
$$;

CREATE TABLE search_results(
    id SERIAL PRIMARY KEY ,
    address_name VARCHAR(50),
    full_name VARCHAR(100),
    level_of_bill VARCHAR(20),
    make VARCHAR(20),
    condition CHAR(1),
    category_name VARCHAR(50)
);

CALL sp_courses_by_address('700 Monterey Avenue');

SELECT * FROM search_results;