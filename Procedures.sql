#Display all employees
DROP PROCEDURE IF EXISTS GetAllEmployees;

DELIMITER $$

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM employees;
END $$

DELIMITER ;

CALL GetAllEmployees();

#Display employee details using employee ID
DROP PROCEDURE IF EXISTS GetEmployeeByID;

DELIMITER $$

CREATE PROCEDURE GetEmployeeByID(IN emp_id INT)
BEGIN
    SELECT *
    FROM employees
    WHERE employee_id = emp_id;
END $$

DELIMITER ;

CALL GetEmployeeByID(5);

#Display employees by department
DROP PROCEDURE IF EXISTS GetEmployeesByDepartment;

DELIMITER $$

CREATE PROCEDURE GetEmployeesByDepartment(IN dept_id INT)
BEGIN
    SELECT *
    FROM employees
    WHERE department_id = dept_id;
END $$

DELIMITER ;

CALL GetEmployeesByDepartment(1);

-- Display employees earning above a given salary
DROP PROCEDURE IF EXISTS GetEmployeesBySalary;

DELIMITER $$

CREATE PROCEDURE GetEmployeesBySalary(IN min_salary DECIMAL(10,2))
BEGIN
    SELECT employee_name, salary
    FROM employees
    WHERE salary > min_salary;
END $$

DELIMITER ;

CALL GetEmployeesBySalary(40000);

#Count employees in a department
DROP PROCEDURE IF EXISTS CountEmployeesByDepartment;

DELIMITER $$

CREATE PROCEDURE CountEmployeesByDepartment(IN dept_id INT)
BEGIN
    SELECT COUNT(*) AS total_employees
    FROM employees
    WHERE department_id = dept_id;
END $$

DELIMITER ;

CALL CountEmployeesByDepartment(1);

