-- Create 'departments' table
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

-- Create 'employees' table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    hire_date DATE,
    job_title VARCHAR(50),
    department_id INT REFERENCES departments(id)
);

-- Create 'projects' table
CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    department_id INT REFERENCES departments(id)
);

-- Insert data into 'departments'
INSERT INTO departments (name, manager_id)
VALUES ('HR', 1), ('IT', 2), ('Sales', 3);

-- Insert data into 'employees'
INSERT INTO employees (name, hire_date, job_title, department_id)
VALUES ('John Doe', '2018-06-20', 'HR Manager', 1),
       ('Jane Smith', '2019-07-15', 'IT Manager', 2),
       ('Alice Johnson', '2020-01-10', 'Sales Manager', 3),
       ('Bob Miller', '2021-04-30', 'HR Associate', 1),
       ('Charlie Brown', '2022-10-01', 'IT Associate', 2),
       ('Dave Davis', '2023-03-15', 'Sales Associate', 3);

-- Insert data into 'projects'
INSERT INTO projects (name, start_date, end_date, department_id)
VALUES ('HR Project 1', '2023-01-01', '2023-06-30', 1),
       ('IT Project 1', '2023-02-01', '2023-07-31', 2),
       ('Sales Project 1', '2023-03-01', '2023-08-31', 3);
       
UPDATE departments
SET manager_id = (SELECT id FROM employees WHERE name = 'John Doe')
WHERE name = 'HR';

UPDATE departments
SET manager_id = (SELECT id FROM employees WHERE name = 'Jane Smith')
WHERE name = 'IT';

UPDATE departments
SET manager_id = (SELECT id FROM employees WHERE name = 'Alice Johnson')
WHERE name = 'Sales';
