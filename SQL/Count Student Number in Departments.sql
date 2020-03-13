SELECT d.dept_name, COUNT(DISTINCT student_id) AS student_number
FROM department AS d
LEFT JOIN student AS s
USING (dept_id)
GROUP BY dept_id
ORDER BY student_number DESC, d.dept_id
