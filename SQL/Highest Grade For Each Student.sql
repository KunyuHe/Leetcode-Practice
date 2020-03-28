SELECT *
FROM (SELECT DISTINCT student_id, course_id, grade
      FROM enrollments
      ORDER BY grade DESC) AS temp
GROUP BY student_id;
