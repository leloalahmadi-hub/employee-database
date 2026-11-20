-- Employee Database Project (MySQL)

CREATE DATABASE employee_db;
USE employee_db;

CREATE TABLE employees (
    employee_id   VARCHAR(10)    PRIMARY KEY,
    employee_name VARCHAR(100),
    department    VARCHAR(50),
    job_title     VARCHAR(50),
    salary        DECIMAL(12,4),
    hire_date     DATE,
    city          VARCHAR(50),
    email         VARCHAR(100)
);


DESCRIBE employees;


INSERT INTO employees
    (employee_id, employee_name, department, job_title, salary, hire_date, city, email)
VALUES
    ('EMP1024', 'Ahmed Ali',      'IT',        'Software Developer',   8500.00, '2022-03-15', 'Riyadh', 'ahmed@email.com'),
    ('EMP1178', 'Sara Mohammed',  'HR',        'HR Specialist',        6500.00, '2021-07-10', 'Jeddah', 'sara@email.com'),
    ('EMP1235', 'Khalid Saad',    'Finance',   'Accountant',           7200.00, '2020-11-01', 'Dammam', 'khalid@email.com'),
    ('EMP1310', 'Mona Fahad',     'Marketing', 'Marketing Specialist', 6800.00, '2023-01-20', 'Jeddah', NULL),
    ('EMP1452', 'Omar Yusuf',     'IT',        'Data Analyst',         9200.00, '2019-05-12', 'Riyadh', 'omar@email.com'),
    ('EMP1537', 'Laila Hassan',   'Sales',     'Sales Executive',      6000.00, '2022-09-18', 'Makkah', 'laila@email.com'),
    ('EMP1689', 'Faisal Nasser',  'IT',        'System Administrator', 7800.00, '2020-02-25', 'Riyadh', 'faisal@email.com'),
    ('EMP1744', 'Aisha Salem',    'HR',        'Recruitment Officer',  5900.00, '2024-04-08', 'Jeddah', 'aisha@email.com'),
    ('EMP1862', 'Mohammed Adel',  'Finance',   'Financial Analyst',    8800.00, '2021-12-14', 'Dammam', 'mohammed@email.com'),
    ('EMP1931', 'Amal Tariq',     'Marketing', 'Content Specialist',   5400.00, '2023-06-30', 'Riyadh', NULL);

SELECT * FROM employees;


-- =====================================================
-- Retrieving data with SELECT

-- 1) All employee data
SELECT * FROM employees;

-- 2) Name, department and salary only
SELECT employee_name, department, salary FROM employees;

-- 3) Name and salary with renamed columns
SELECT employee_name AS employee,
       salary        AS monthly_salary
FROM employees;

-- 4) All departments without duplicates
SELECT DISTINCT department FROM employees;

-- 5) Employee ID, name and job title only
SELECT employee_id, employee_name, job_title FROM employees;


-- =====================================================
-- Filtering data with WHERE

-- 1) Salary greater than 7000
SELECT * FROM employees WHERE salary > 7000;

-- 2) Employees in Jeddah
SELECT * FROM employees WHERE city = 'Jeddah';

-- 3) Salary between 5000 and 8000
SELECT * FROM employees WHERE salary BETWEEN 5000 AND 8000;

-- 4) IT and HR departments only
SELECT * FROM employees WHERE department IN ('IT', 'HR');

-- 5) Names starting with A
SELECT * FROM employees WHERE employee_name LIKE 'A%';

-- 6) IT employees with salary greater than 8000
SELECT * FROM employees WHERE department = 'IT' AND salary > 8000;

-- 7) Employees not in Marketing
SELECT * FROM employees WHERE department <> 'Marketing';

-- 8) Employees in Riyadh or Jeddah
SELECT * FROM employees WHERE city IN ('Riyadh', 'Jeddah');


-- =====================================================
-- Handling NULL values

-- 1) Employees without an email
SELECT * FROM employees WHERE email IS NULL;

-- 2) Employees with an email
SELECT * FROM employees WHERE email IS NOT NULL;

-- 3) ID, name and email for employees with a missing email
SELECT employee_id, employee_name, email
FROM employees
WHERE email IS NULL;

-- 4) Count with email vs. without email
SELECT COUNT(email)            AS with_email,
       COUNT(*) - COUNT(email) AS without_email
FROM employees;


-- =====================================================
-- Sorting and limiting results

-- 1) By salary, lowest to highest
SELECT * FROM employees ORDER BY salary ASC;

-- 2) By salary, highest to lowest
SELECT * FROM employees ORDER BY salary DESC;

-- 3) Top 3 salaries
SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

-- 4) Lowest 5 salaries
SELECT * FROM employees ORDER BY salary ASC LIMIT 5;

-- 5) By department, alphabetically
SELECT * FROM employees ORDER BY department ASC;

-- 6) Within each department, by salary highest to lowest
SELECT * FROM employees ORDER BY department ASC, salary DESC;

-- 7) 5 most recently hired employees
SELECT * FROM employees ORDER BY hire_date DESC LIMIT 5;


-- =====================================================
-- Calculated columns

SELECT employee_name,
       salary,
       salary * 0.10 AS raise_amount,
       salary * 1.10 AS salary_after_raise,
       salary * 12   AS annual_salary
FROM employees;


-- =====================================================
-- Aggregate functions

-- 1) to 5) Overall statistics
SELECT COUNT(*)    AS total_employees,
       SUM(salary) AS total_salaries,
       AVG(salary) AS average_salary,
       MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary
FROM employees;

-- 6) Number of IT employees
SELECT COUNT(*) AS it_employees_count
FROM employees
WHERE department = 'IT';

-- 7) Average salary in HR only
SELECT AVG(salary) AS hr_average_salary
FROM employees
WHERE department = 'HR';

-- 8) Number of employees in Jeddah
SELECT COUNT(*) AS jeddah_employees_count
FROM employees
WHERE city = 'Jeddah';


-- =====================================================
-- Updating data with UPDATE
-- (Show the record before and after; always target by employee_id)

-- 1) Set EMP1178 salary to 7000
SELECT * FROM employees WHERE employee_id = 'EMP1178';
UPDATE employees SET salary = 7000 WHERE employee_id = 'EMP1178';
SELECT * FROM employees WHERE employee_id = 'EMP1178';

-- 2) Set EMP1452 city to Jeddah
SELECT * FROM employees WHERE employee_id = 'EMP1452';
UPDATE employees SET city = 'Jeddah' WHERE employee_id = 'EMP1452';
SELECT * FROM employees WHERE employee_id = 'EMP1452';

-- 3) EMP1310: salary 7200 and city Riyadh
SELECT * FROM employees WHERE employee_id = 'EMP1310';
UPDATE employees SET salary = 7200, city = 'Riyadh' WHERE employee_id = 'EMP1310';
SELECT * FROM employees WHERE employee_id = 'EMP1310';


-- =====================================================
-- Deleting data with DELETE

-- 1) Show EMP1931 before deleting
SELECT * FROM employees WHERE employee_id = 'EMP1931';

-- 2) Delete the employee (always with a WHERE condition)
DELETE FROM employees WHERE employee_id = 'EMP1931';

-- 3) Verify the deletion (should return no rows)
SELECT * FROM employees WHERE employee_id = 'EMP1931';
SELECT * FROM employees;

-- DELETE vs DROP:
-- DELETE FROM employees WHERE ...  removes specific rows; the table and other data stay.
-- DROP TABLE employees;            removes the whole table: structure and all data.
