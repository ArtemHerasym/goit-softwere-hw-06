SELECT gr.group_name,
	   s.student_name
FROM groups AS gr
JOIN students AS s ON s.group_id = gr.id
WHERE gr.group_name = "Group A";