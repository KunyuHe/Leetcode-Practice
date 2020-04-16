SELECT
    id,
    IF(p_id IS NULL, 'Root',
        IF(id IN(SELECT p_id
                 FROM tree), "Inner",
           "Leaf")
      ) AS Type
FROM tree;

-- SOLUTION 2
SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN "Root"
        WHEN id IN (SELECT p_id
                    FROM tree
                    WHERE p_id IS NOT NULL) THEN "Inner"
        ELSE "Leaf"
    END AS Type
FROM tree;
