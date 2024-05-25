SELECT
    CONCAT(
        m.mountain_range,
        ' ',
        p.peak_name) AS mountain_information,

    LENGTH(CONCAT(
        m.mountain_range,
        ' ',
        p.peak_name)) AS character_length,

    BIT_LENGTH(CONCAT(
        m.mountain_range,
        ' ',
        p.peak_name)) AS bits_of_a_tring -- passes with the typo

FROM 
    mountains AS m,
    peaks AS p
WHERE
    m.id = p.mountain_id;