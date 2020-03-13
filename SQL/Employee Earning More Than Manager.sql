SELECT e.Name AS Employee
FROM Employee AS e
INNER JOIN Employee AS m
ON e.ManagerId = m.Id
WHERE e.Salary > m.Salary;