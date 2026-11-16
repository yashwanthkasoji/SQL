#Create a view displaying all employee details.
CREATE VIEW employee_view AS
SELECT *
FROM employees;

#Create a view displaying employee names and salaries.
CREATE VIEW employee_salary_view AS
SELECT employee_name, salary
FROM employees;

#Create a view displaying employees earning more than ₹50,000.
CREATE VIEW high_salary_view AS
SELECT employee_name, salary
FROM employees
WHERE salary > 50000;

#Create a view displaying employees belonging to department 1.
CREATE VIEW it_employee_view AS
SELECT *
FROM employees
WHERE department_id = 1;

#Create a view displaying employee names and hire dates.
CREATE VIEW employee_hire_view AS
SELECT employee_name, hire_date
FROM employees;

#Create a view displaying department-wise employee counts.
CREATE VIEW department_count_view AS
SELECT department_id, COUNT(*) AS total_employees
FROM employees
GROUP BY department_id;

#Create a view displaying monthly salary details.
CREATE VIEW monthly_salary_view AS
SELECT employee_id, salary_month, basic_salary,
       bonus, deductions, net_salary
FROM salaries;

#Create a view displaying all approved leave requests
CREATE VIEW approved_leave_view AS
SELECT *
FROM leave_requests
WHERE status = 'Approved';

#Retrieve employees earning more than ₹45,000 from the high-salary view.
SELECT *
FROM high_salary_view
WHERE salary > 45000;

#Replace an existing view and drop another view.
CREATE OR REPLACE VIEW employee_salary_view AS
SELECT employee_name, salary, email
FROM employees;

-- DROP VIEW employee_hire_view;