SELECT
    v.name,
    v.phone_number,
    LTRIM(REPLACE(v.address, 'Sofia', ''), ', ') AS address
FROM
    volunteers AS v
JOIN
    volunteers_departments AS vd
ON
    v.department_id = vd.id
WHERE
    vd.department_name = 'Education program assistant'
    AND v.address LIKE '%Sofia%'
ORDER BY
    v.name;