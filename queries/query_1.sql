SELECT s.student_name,
	   AVG(g.grade_number) AS average_grade
FROM grades AS g
JOIN students AS s ON g.student_id = s.id
GROUP BY s.id
ORDER BY average_grade DESC
LIMIT 5;
