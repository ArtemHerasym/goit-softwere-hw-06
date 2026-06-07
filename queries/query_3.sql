SELECT gr.group_name,
	   sub.subject_name,
	   AVG(g.grade_number) AS average_grade
FROM groups AS gr
JOIN students AS s ON gr.id = s.group_id
JOIN grades AS g ON s.id = g.student_id
JOIN subjects AS sub ON g.subject_id = sub.id
WHERE sub.subject_name = 'History'
GROUP BY gr.id, gr.group_name, sub.subject_name;
