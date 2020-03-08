SELECT d.Name AS Department, e.Name AS Employee, e.Salary
FROM Employee AS e
INNER JOIN Department AS d
ON e.DepartmentId = d.Id
WHERE (SELECT COUNT(DISTINCT Salary)
       FROM Employee
       WHERE Salary > e.Salary AND DepartmentId = e.DepartmentId) < 3;