SELECT m.Name
FROM Employee AS e
INNER JOIN Employee AS m
ON e.ManagerId = m.Id
GROUP BY m.Name
HAVING COUNT(e.name) >= 5