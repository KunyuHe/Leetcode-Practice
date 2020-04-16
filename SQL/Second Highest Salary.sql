SELECT
    IFNULL(
        (SELECT DISTINCT Salary
         FROM Employee
         WHERE Salary < (SELECT MAX(Salary)
                         FROM Employee)
         ORDER BY Salary DESC
         LIMIT 1), null) AS SecondHighestSalary;

-- SOLUTION II
 SELECT IFNULL(
    (SELECT MAX(Salary)
     FROM (SELECT Salary
          FROM Employee
          WHERE Salary < (SELECT MAX(Salary)
                          FROM Employee)) AS temp),
    null) AS SecondHighestSalary;
