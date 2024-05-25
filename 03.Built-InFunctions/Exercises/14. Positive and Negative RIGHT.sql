SELECT
    peak_name,
    RIGHT(peak_name, 4) AS positive_right, -- +n returns last n chars
    RIGHT(peak_name, -4) AS negative_right -- -n returns all chars but first n
FROM peaks;