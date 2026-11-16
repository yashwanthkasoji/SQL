#Assign row numbers to employees based on salary
SELECT
    employee_id,
    employee_name,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

#Rank employees based on salary
SELECT
    employee_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

#Rank employees without skipping numbers
SELECT
    employee_name,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

#Assign row numbers department-wise
SELECT
    employee_name,
    department_id,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_row
FROM employees;

#Find average salary department-wise without GROUP BY
SELECT
    employee_name,
    department_id,
    salary,
    AVG(salary) OVER (
        PARTITION BY department_id
    ) AS department_avg_salary
FROM employees;

#Calculate running total of salaries
SELECT
    employee_name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
    ) AS running_total
FROM employees;

#Compare an employee's salary with the previous employee
SELECT
    employee_name,
    salary,
    LAG(salary) OVER (
        ORDER BY employee_id
    ) AS previous_salary
FROM employees;

#Display the next employee's salary
SELECT
    employee_name,
    salary,
    LEAD(salary) OVER (
        ORDER BY employee_id
    ) AS next_salary
FROM employees;

-- Find the highest salary in each department
SELECT
    employee_name,
    department_id,
    salary,
    FIRST_VALUE(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS highest_salary
FROM employees;

-- Divide employees into four salary groups
SELECT
    employee_name,
    salary,
    NTILE(4) OVER (
        ORDER BY salary DESC
    ) AS salary_group
FROM employees;

