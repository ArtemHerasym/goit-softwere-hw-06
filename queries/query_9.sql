SELECT DISTINCT s.student_name,
	   sub.subject_name
FROM grades AS g
JOIN students AS s ON g.student_id = s.id
JOIN subjects AS sub ON g.subject_id = sub.id
WHERE s.student_name = 'Daniel Lawrence';
