SELECT
    dept_name,
    IFNULL(COUNT(student_id), 0) AS student_number
FROM
    department AS d
    LEFT JOIN student AS s USING (dept_id)
GROUP BY d.dept_id
ORDER BY
    student_number DESC,
    dept_name;
