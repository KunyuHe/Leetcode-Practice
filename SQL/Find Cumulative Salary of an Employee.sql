SELECT e1.id, e1.month, (IFNULL(e1.Salary, 0) + IFNULL(e2.Salary, 0) + IFNULL(e3.Salary, 0)) AS Salary
FROM (SELECT Id, MAX(Month) AS Month
      FROM Employee
      GROUP BY Id
      HAVING COUNT(*) > 1) AS most_recent
LEFT JOIN Employee AS e1
ON most_recent.Id = e1.Id AND most_recent.Month > e1.Month
LEFT JOIN Employee AS e2
ON e1.Id = e2.Id AND e1.Month - 1 = e2.Month
LEFT JOIN Employee AS e3
ON e1.Id = e3.Id AND e1.Month - 2 = e3.Month
ORDER BY e1.Id, e1.Month DESC
