SELECT
    tr.id,
    (tr.height * tr.side) / 2.0 AS area
FROM triangles AS tr;
