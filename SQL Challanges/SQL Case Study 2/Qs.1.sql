SELECT
	departments.id,
	departments.name AS department_name,
	projects.name,
	projects.start_date,
	projects.end_date,
	JULIANDAY(projects.end_date) - JULIANDAY(projects.start_date) AS project_length
	
FROM projects
JOIN departments
ON projects.department_id = departments.id

GROUP BY
	departments.id
ORDER BY
	project_length DESC