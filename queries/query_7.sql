SELECT gr.group_name,
	   s.student_name,
	   sub.subject_name,
	   g.grade_number,
	   g.date_recv
FROM groups AS gr
JOIN students AS s ON s.group_id = gr.id
JOIN grades AS g ON g.student_id = s.id
JOIN subjects AS sub ON g.subject_id = sub.id
WHERE gr.group_name ='Group C'
AND sub.subject_name = 'Physics';