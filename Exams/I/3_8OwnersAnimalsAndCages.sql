SELECT
    CONCAT(o.name, ' - ', a.name) AS "owner - animal",
    o.phone_number,
    ac.cage_id
FROM
    animals AS a
JOIN
    animal_types AS at
ON
    a.animal_type_id = at.id
JOIN
    owners AS o
ON
    a.owner_id = o.id
JOIN
    animals_cages AS ac
ON
    a.id = ac.animal_id
WHERE
    at.animal_type = 'Mammals'
ORDER BY
    o.name,
    a.name DESC;