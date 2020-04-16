CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N - 1;
    RETURN (
      # Write your MySQL query statement below.
        SELECT DISTINCT Salary
        FROM Employee
        ORDER BY Salary DESC
        LIMIT 1 OFFSET N
  );
END

-- SOLUTION II (more general)
SELECT DISTINCT Salary
FROM Employee AS e
WHERE (SELECT COUNT(DISTINCT Salary)
       FROM Employee
       WHERE e.Salary < Salary) = N - 1
