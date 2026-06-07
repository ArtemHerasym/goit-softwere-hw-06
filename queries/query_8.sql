SELECT p.professor_name,
	   sub.subject_name,
	   ROUND(AVG(g.grade_number), 2) AS average_grade
FROM grades AS g
JOIN subjects AS sub ON g.subject_id = sub.id
JOIN professors AS p ON sub.professor_id = p.id
WHERE p.professor_name = 'Professor Renee Alexander'
GROUP BY p.id, p.professor_name, sub.id, sub.subject_name;