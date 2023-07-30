SELECT
	e.id,
	e.name AS employee_name,
	e.hire_date,
	e2.name AS next_employee_name,
	MIN(e2.hire_date) AS next_hire_date,
	JULIANDAY(MIN(e2.hire_date)) - JULIANDAY(e.hire_date) AS duration,
	d.name AS department_name

FROM
	employees e
	JOIN employees e2 ON e.department_id = e2.department_id AND e.hire_date < e2.hire_date
	JOIN departments d ON e.department_id = d.id
	
GROUP BY
	e.id,
	employee_name,
	e.hire_date,
	department_name
ORDER BY
	department_name,
	e.hire_date