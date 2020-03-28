SELECT stu.*, sub.*, COUNT(exam.subject_name) AS attended_exams
FROM (Students AS stu
      CROSS JOIN Subjects AS sub)
LEFT JOIN Examinations AS exam ON stu.student_id = exam.student_id AND sub.subject_name = exam.subject_name
GROUP BY stu.student_id, sub.subject_name;
