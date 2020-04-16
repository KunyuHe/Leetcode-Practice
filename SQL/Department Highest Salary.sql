SELECT
    d.Name AS Department,
    e.Name AS Employee,
    Salary
FROM
    (SELECT *
     FROM Employee
     WHERE (DepartmentId, Salary) IN (SELECT DepartmentId, MAX(Salary)
                                      FROM Employee
                                      GROUP BY DepartmentId)) AS e
    JOIN Department AS d ON e.DepartmentId = d.Id;

-- SOLUTION II
SELECT
    d.Name AS Department,
    e.Name AS Employee,
    Salary
FROM
    Employee AS e
    JOIN Department AS d ON e.DepartmentId = d.Id
WHERE
    Salary = (SELECT MAX(Salary)
              FROM Employee
              WHERE DepartmentId = e.DepartmentId);
