SELECT d.Name AS Department, e.Name AS Employee, e.Salary
FROM Employee AS e
INNER JOIN (SELECT DepartmentId, MAX(Salary) AS Top
            FROM Employee
            GROUP BY DepartmentId) AS s
ON e.DepartmentId = s.DepartmentId AND e.Salary = s.Top
INNER JOIN Department AS d
ON e.DepartmentId = d.Id;