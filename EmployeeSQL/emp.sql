--emp.sql query - Randy Dettmer 2020/04/01


--list details of each employee
SELECT emp.emp_no, 
emp.last_name, 
emp.first_name, 
emp.gender, 
sal.salary
FROM employees AS emp
JOIN salaries AS sal
ON emp.emp_no = sal.emp_no;

--list employees hired in 1986
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--list the manager for each department
SELECT dpt.dept_no,
dpt.dept_name,
mgr.emp_no,
emp.last_name,
emp.first_name,
mgr.from_date,
mgr.to_date
FROM departments AS dpt
JOIN dept_manager AS mgr
ON dpt.dept_no = mgr.dept_no
JOIN employees AS emp 
ON mgr.emp_no = emp.emp_no;

--list department of each employee
SELECT de.emp_no,
emp.last_name,
emp.first_name,
dpt.dept_name
FROM dept_emp AS de
JOIN departments AS dpt
ON de.dept_no = dpt.dept_no
JOIN employees as emp
ON de.emp_no = emp.emp_no;

--list all employees whose first name is "Hercules" and last name begins with "B"
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

--list all employees in the Sales department
SELECT de.emp_no,
emp.last_name,
emp.first_name,
ds.dept_name
FROM dept_emp AS de
JOIN employees AS emp
ON de.emp_no = emp.emp_no
JOIN departments AS ds
ON de.dept_no = ds.dept_no
WHERE ds.dept_name LIKE 'Sales';

--list all employees in the Sales and Development departments
SELECT de.emp_no,
emp.last_name,
emp.first_name,
ds.dept_name
FROM dept_emp AS de
JOIN employees AS emp
ON de.emp_no = emp.emp_no
JOIN departments AS ds
ON de.dept_no = ds.dept_no
WHERE ds.dept_name LIKE 'Sales' 
OR ds.dept_name LIKE 'Development';

--in descending order list the frequency count of employee last names
SELECT last_name, COUNT(last_name) AS "lncnt"
FROM employees
GROUP BY last_name
ORDER BY "lncnt" DESC;



