-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, salaries.salary
FROM employees e
LEFT JOIN salaries
ON (e.emp_no = salaries.emp_no)
ORDER BY e.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE e.hire_date LIKE '%1986'
ORDER BY e.first_name;


/* 3. List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name. */
SELECT dm.dept_no, departments.dept_name, dm.emp_no, employees.first_name, employees.last_name
FROM dept_manager AS dm
LEFT JOIN employees ON (dm.emp_no = employees.emp_no)
LEFT JOIN departments ON (dm.dept_no = departments.dept_no)
ORDER BY dm.dept_no;


/* 4. List the department of each employee with the following information: 
employee number, last name, first name, and department name. */
SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM employees e
LEFT JOIN dept_emp ON (e.emp_no = dept_emp.emp_no)
LEFT JOIN departments ON (dept_emp.dept_no = departments.dept_no)
ORDER BY e.emp_no;


/* 5. List first name, last name, and sex for employees whose first name is 
"Hercules" and last names begin with "B." */
SELECT e.last_name, e.first_name, e.sex
FROM employees e
WHERE (e.first_name = 'Hercules' and e.last_name LIKE 'B%')
ORDER BY e.last_name;


/* 6. List all employees in the Sales department, including their employee number, 
last name, first name, and department name. */
SELECT e.emp_no ,e.last_name, e.first_name, departments.dept_name
FROM employees e
LEFT JOIN dept_emp ON (e.emp_no = dept_emp.emp_no)
LEFT JOIN departments ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales'
ORDER BY e.emp_no;


/* 7. List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name. */
SELECT e.emp_no ,e.last_name, e.first_name, departments.dept_name
FROM employees e
LEFT JOIN dept_emp ON (e.emp_no = dept_emp.emp_no)
LEFT JOIN departments ON (dept_emp.dept_no = departments.dept_no)
WHERE (departments.dept_name = 'Sales' OR departments.dept_name = 'Development')
ORDER BY e.emp_no;


/* 8. In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name. */
SELECT e.last_name, COUNT(e.last_name) FROM employees e
GROUP BY e.last_name
ORDER BY COUNT(e.last_name) DESC;