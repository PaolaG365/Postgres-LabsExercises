CREATE TABLE bookings_calculation AS

    SELECT
        b.booked_for,
        CAST(b.booked_for * 50 AS NUMERIC) AS multiplication,
        CAST(MOD(b.booked_for, 50) AS NUMERIC) AS modulo

    FROM
        bookings AS b
    WHERE
        b.apartment_id = 93;
        -- they have to be explicitly casted to numeric because integer is not numeric data type i guess???????