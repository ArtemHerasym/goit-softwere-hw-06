SELECT DISTINCT sub.subject_name,
	   p.professor_name,
	   s.student_name
FROM grades g
JOIN students s ON g.student_id = s.id
JOIN subjects sub ON g.subject_id = sub.id
JOIN professors p ON sub.professor_id = p.id
WHERE p.professor_name = 'Professor Johnny Benton'
AND s.student_name = 'Jocelyn Zuniga';
