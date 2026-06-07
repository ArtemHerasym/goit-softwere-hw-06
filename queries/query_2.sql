SELECT s.student_name,
	   sub.subject_name,
	   AVG(g.grade_number) AS average_grade
FROM grades AS g
JOIN students AS s ON g.student_id = s.id
JOIN subjects AS sub ON g.subject_id = sub.id
WHERE sub.subject_name = 'Math'
GROUP BY s.id, sub.id
ORDER BY average_grade DESC
LIMIT 1;