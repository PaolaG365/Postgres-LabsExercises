SELECT
    LTRIM(peak_name, 'M') AS left_trim,
    RTRIM(peak_name, 'm') AS rigth_trim
FROM peaks;