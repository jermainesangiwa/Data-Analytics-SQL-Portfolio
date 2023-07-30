SELECT
	employees.name AS employee_name,
	employees.hire_date,
	departments.name AS department_name,
	DENSE_RANK() OVER(
		PARTITION BY departments.name
		ORDER BY hire_date
	)rank

FROM employees
JOIN departments
ON employees.department_id = departments.id