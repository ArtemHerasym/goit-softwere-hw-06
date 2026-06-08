SELECT p.professor_name,
	   sub.subject_name
FROM professors AS p
JOIN subjects AS sub ON sub.professor_id = p.id
WHERE p.id = 5
