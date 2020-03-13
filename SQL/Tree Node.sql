SELECT nodes.id, IF(nodes.p_id IS NULL, 'Root',
                    IF(nodes.id IN(
                        SELECT p_id
                        FROM tree),
                       "Inner",
                       "Leaf")
                   ) AS Type
FROM tree AS nodes

# SOLUTION 2
SELECT id,
    CASE
        WHEN id IN (SELECT temp.id
                    FROM tree AS temp
                    WHERE temp.p_id IS NULL)
            THEN 'Root'
        WHEN id IN (SELECT temp.p_id
                    FROM tree AS temp)
            THEN 'Inner'
        ELSE 'Leaf'
    END AS Type
FROM tree
