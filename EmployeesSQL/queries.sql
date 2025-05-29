--1
select 
   employees.emp_no AS Employeenumber,
    last_name,
    first_name,
    sex,
    salary 
from 
  employees 
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--2
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR from hire_date) = 1986;

--3
SELECT
    department_manager.dept_no,
	departments.dept_name,
	employees.emp_no,
	employees.first_name,
	employees.last_name
FROM
    department_manager
	INNER JOIN departments ON department_manager.dept_no=departments.dept_no
	INNER JOIN employees ON department_manager.emp_no=employees.emp_no
	
--4
SELECT
    department_employees.dept_no,
	departments.dept_name,
	employees.emp_no,
	employees.first_name,
	employees.last_name
FROM
    department_employees
	INNER JOIN departments ON department_employees.dept_no=departments.dept_no
	INNER JOIN employees ON department_employees.emp_no=employees.emp_no
	
--5
SELECT
    first_name,
    last_name,
    sex
FROM
    employees
WHERE
    first_name='Hercules' AND
    last_name LIKE 'B%'

--6
SELECT
    employees.emp_no,
    employees.last_name,
    employees.first_name

FROM department_employees 

INNER JOIN employees ON department_employees.emp_no = employees.emp_no
WHERE
    department_employees.dept_no = (
        SELECT dept_no FROM 
        departments WHERE dept_name = 'Sales'
    )
--7
SELECT
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
FROM
    department_employees
INNER JOIN
    employees ON department_employees.emp_no = employees.emp_no
INNER JOIN
    departments ON department_employees.dept_no = departments.dept_no
WHERE
    department_employees.dept_no IN (
        SELECT dept_no
        FROM departments
        WHERE dept_name IN ('Sales', 'Development')
    );

--8
SELECT
    last_name,
    COUNT(*) AS frequency
FROM
    employees
GROUP BY
    last_name
ORDER BY
    frequency DESC;