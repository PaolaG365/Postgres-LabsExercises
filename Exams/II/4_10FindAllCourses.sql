CREATE OR REPLACE FUNCTION fn_courses_by_client(
    phone_num VARCHAR(20)
)
RETURNS INT
LANGUAGE plpgsql
AS
$$
    DECLARE
        client_courses INT;
    BEGIN
        SELECT
            COUNT(*) INTO client_courses
        FROM
            clients AS cl
        JOIN
            courses AS cr
        ON
            cl.id = cr.client_id
        WHERE
            cl.phone_number = phone_num;
        RETURN client_courses;
    END;
$$;