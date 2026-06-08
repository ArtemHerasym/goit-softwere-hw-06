SELECT p.professor_name,
	   ROUND(AVG(g.grade_number), 2) AS average_grade
FROM grades AS g
JOIN subjects AS sub ON g.subject_id = sub.id
JOIN professors AS p ON sub.professor_id = p.id
WHERE p.id = 5
GROUP BY p.id, p.professor_name;
