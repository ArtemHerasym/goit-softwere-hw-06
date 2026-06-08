SELECT p.professor_name,
	   s.student_name,
	   ROUND(AVG(g.grade_number), 2) AS average_grade
FROM grades g
JOIN students s ON g.student_id = s.id
JOIN subjects sub ON g.subject_id = sub.id
JOIN professors p ON sub.professor_id = p.id
WHERE p.id = 5
AND s.id = 5
GROUP BY s.id, s.student_name, p.id, p.professor_name;
