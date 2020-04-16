SELECT
    e1.Name
FROM
    Employee AS e1
    JOIN Employee AS e2 ON e1.Id = e2.ManagerId
GROUP BY e1.Id
HAVING COUNT(DISTINCT e2.Id) >= 5;
