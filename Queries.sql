#Display employees earning more than 50000
SELECT *
FROM employees
WHERE salary > 50000;

#Find the top highest paid employees.
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

#calculate the total number of employees in each department
SELECT d.department_name,
       COUNT(e.employee_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

#Find the average salary of each department
SELECT d.department_name,
       ROUND(AVG(e.salary), 2) AS average_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

#Display departments whose average salary exceeds 50000
SELECT d.department_name,
       AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 50000;

 #Calculate the total monthly salary expenditure of the company.
 SELECT salary_month,
       SUM(net_salary) AS total_salary_expenditure
FROM salaries
GROUP BY salary_month
ORDER BY salary_month;

#Find the attendance percentage of each employee.
SELECT e.employee_id,
       e.employee_name,
       ROUND(
           SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END)
           * 100.0 / COUNT(a.attendance_id), 2
       ) AS attendance_percentage
FROM employees e
JOIN attendance a
ON e.employee_id = a.employee_id
GROUP BY e.employee_id, e.employee_name;

#Identify the project with the highest budget.
SELECT project_name, budget
FROM projects
ORDER BY budget DESC
LIMIT 1;

#Find the number of approved, rejected and pending leave requests.
SELECT status,
       COUNT(*) AS total_requests
FROM leave_requests
GROUP BY status;

-- Display employees who are not assigned to any project.
SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN employee_project ep
ON e.employee_id = ep.employee_id
WHERE ep.employee_id IS NULL;

