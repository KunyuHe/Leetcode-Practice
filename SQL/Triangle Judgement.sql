SELECT x, y, z,
    CASE
        WHEN x + y > z AND z + x > y AND y + z > x
            THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM triangle