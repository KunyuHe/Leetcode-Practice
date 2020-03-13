SELECT e.name, b.bonus
FROM Employee AS e
LEFT JOIN Bonus AS b
USING (empId)
WHERE IFNULL(b.bonus, 0) < 1000