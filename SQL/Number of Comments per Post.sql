SELECT DISTINCT s1.sub_id AS post_id, COUNT(DISTINCT s2.sub_id) AS number_of_comments
FROM Submissions AS s1
LEFT JOIN Submissions AS s2
ON s1.sub_id = s2.parent_id
WHERE ISNULL(s1.parent_id)
GROUP BY s1.sub_id;
