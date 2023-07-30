SELECT
	employees.id,
	employees.name

FROM employees
JOIN departments
ON employees.department_id = departments.id 

WHERE
	employees.id != departments.manager_id