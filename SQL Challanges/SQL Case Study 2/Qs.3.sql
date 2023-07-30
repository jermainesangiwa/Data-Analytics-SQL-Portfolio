SELECT
	employees.id,
	employees.name AS employee_name,
	employees.hire_date,
	departments.name AS department_name,
	projects.name AS projet_name,
	projects.start_date AS project_start_date

FROM employees
JOIN projects
JOIN departments
ON employees.department_id = projects.department_id
AND employees.department_id = departments.id

WHERE
	employees.hire_date > projects.start_date