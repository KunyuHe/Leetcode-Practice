SELECT e1.Id, e1.Company, e1.Salary
FROM Employee AS e1, Employee AS e2
WHERE e1.Company = e2.Company
GROUP BY e1.Company, e1.Salary
HAVING SUM(IF(e1.Salary = e2.Salary, 1, 0)) >= ABS(SUM(SIGN(e1.Salary - e2.Salary)))
ORDER BY e1.Id