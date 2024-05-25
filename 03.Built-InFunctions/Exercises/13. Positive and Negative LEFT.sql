SELECT
    peak_name,
    LEFT(peak_name, 4) AS positive_left, -- +n returns first n chars
    LEFT(peak_name, -4) AS negative_left -- -n returns all chars but last n
FROM peaks;