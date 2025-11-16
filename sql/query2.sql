SELECT student.student_id, student.student_name, AVG(student_exammark.exam_mark) AS average_mark
FROM student
JOIN student_exammark ON student.student_id = student_exammark.student_id
WHERE student.year = 1 AND student.programme = 'Computer Science'
GROUP BY student.student_id, student.student_name
ORDER BY average_mark DESC;