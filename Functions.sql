#Display all employee names in uppercase.
SELECT UPPER(employee_name) AS employee_name
FROM employees;

#Display all employee names in lowercase
SELECT LOWER(employee_name) AS employee_name
FROM employees;

#Find the number of characters in each employee's name.
SELECT employee_name,
       CHAR_LENGTH(employee_name) AS name_length
FROM employees;

#Display employee names along with their email addresses in a single column.
SELECT CONCAT(employee_name, ' - ', email) AS employee_details
FROM employees;

#Display employee salaries rounded to the nearest thousand.
SELECT employee_name,
       salary,
       ROUND(salary, -3) AS rounded_salary
FROM employees;

#Find the highest and lowest employee salaries.
SELECT MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary
FROM employees;

#Calculate how many days each employee has worked since joining, up to today.
SELECT employee_name,
       hire_date,
       DATEDIFF(CURDATE(), hire_date) AS working_days
FROM employees;

#Display salary months in a readable month-and-year format.
SELECT employee_id,
       DATE_FORMAT(salary_month, '%M %Y') AS salary_period
FROM salaries;

#Display employee bonuses, replacing NULL values with zero.
SELECT employee_id,
       IFNULL(bonus, 0) AS bonus
FROM salaries;

#Display employee names and their salary, replacing NULL salary values with zero.
SELECT employee_name,
       COALESCE(salary, 0) AS employee_salary
FROM employees;

