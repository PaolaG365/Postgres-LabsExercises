SELECT
    (regexp_match("River Information", '([0-9]{1,4})'))[1] as river_length
FROM view_river_info;

--multiple line search, returns an array of matches on row
--regexp_matches("River Information", '([0-9]{1,4})', 'g')