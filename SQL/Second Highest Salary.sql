# Write your MySQL query statement below
SELECT
    IFNULL(
        (SELECT DISTINCT Salary
         FROM Employee
         WHERE Salary < (SELECT MAX(Salary)
                         FROM Employee)
         ORDER BY Salary DESC
         LIMIT 1), null) AS SecondHighestSalary;
