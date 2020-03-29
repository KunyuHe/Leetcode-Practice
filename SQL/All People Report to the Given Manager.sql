SELECT e1.employee_id
FROM Employees e1
JOIN Employees e2
ON e1.manager_id = e2.employee_id AND
   e2.manager_id IN (SELECT employee_id
                     FROM Employees
                     WHERE manager_id = 1)
WHERE e1.employee_id <> 1;
