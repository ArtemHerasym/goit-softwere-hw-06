SELECT gr.group_name,
	   s.student_name,
	   sub.subject_name,
	   g.grade_number,
	   g.date_recv
FROM grades g
JOIN students s ON g.student_id = s.id
JOIN groups gr ON s.group_id = gr.id
JOIN subjects sub ON g.subject_id  = sub.id
WHERE gr.group_name = 'Group A'
  AND sub.subject_name = 'English'
  AND g.date_recv = (
    SELECT MAX(g2.date_recv)
    FROM grades g2
    JOIN students s2 ON g2.student_id = s2.id
    JOIN groups gr2 ON s2.group_id = gr2.id
    JOIN subjects sub2 ON g2.subject_id = sub2.id
    WHERE gr2.group_name = 'Group A'
        AND sub2.subject_name = 'English'
  );
