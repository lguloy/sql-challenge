--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT EMPLOYEES.emp_no, EMPLOYEES.last_name, EMPLOYEES.first_name, EMPLOYEES.sex, SALARIES.salary
FROM SALARIES
JOIN EMPLOYEES ON
EMPLOYEES.emp_no = SALARIES.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM EMPLOYEES
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT DEPT_MANAGER.dept_no, DEPT_MANAGER.emp_no, departments.dept_name, EMPLOYEES.last_name, EMPLOYEES.first_name
FROM EMPLOYEES
RIGHT JOIN DEPT_MANAGER ON
EMPLOYEES.emp_no = DEPT_MANAGER.emp_no 
LEFT JOIN departments ON
DEPT_MANAGER.dept_no = departments.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT DEPT_EMP.emp_no, EMPLOYEES.last_name, EMPLOYEES.first_name, departments.dept_name
FROM EMPLOYEES
LEFT JOIN DEPT_EMP ON
EMPLOYEES.emp_no = DEPT_EMP.emp_no
LEFT JOIN departments ON
DEPT_EMP.dept_no = departments.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM EMPLOYEES
WHERE first_name ='Hercules' 
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT DEPT_EMP.emp_no, EMPLOYEES.last_name, EMPLOYEES.first_name, departments.dept_name
FROM EMPLOYEES
LEFT JOIN DEPT_EMP ON
EMPLOYEES.emp_no = DEPT_EMP.emp_no
LEFT JOIN departments ON
DEPT_EMP.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT DEPT_EMP.emp_no, EMPLOYEES.last_name, EMPLOYEES.first_name, departments.dept_name
FROM EMPLOYEES
LEFT JOIN DEPT_EMP ON
EMPLOYEES.emp_no = DEPT_EMP.emp_no
LEFT JOIN departments ON
DEPT_EMP.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as count 
FROM EMPLOYEES
GROUP BY last_name
ORDER BY count DESC;
