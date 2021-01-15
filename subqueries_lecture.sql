# SUB-QUERY - a nested SELECT within another query...

SELECT column_a, column_b, column_c
FROM table_a
WHERE column_a IN (
    SELECT column_a
    FROM table_b
    WHERE column_b = true
);

-- Joins: often used when data is needed from two or more tables
-- returns only rows of data
-- tend to be faster than sub-queries
-- syntax can be more complex

-- Sub-queries: often used when the data of one table needs to be filtered by additional tables
-- may return...
-- rows of data (another table)
-- a single row
-- a column of values
-- a single value (scaler)
-- tend to be more readable than joins
-- must be a nested SELECT (can't nest an Insert, for example)
-- sub-queries may be nested infinitely (avoid double nested queries, if possible)
USE employees;

SELECT * FROM salaries;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
LIMIT 10;

# find the information for the departments where the department name is 'Customer Service'

#first find the department number for Customer Service
SELECT * FROM departments;
SELECT dept_no FROM departments WHERE dept_name = 'Customer Service';

SELECT * FROM departments
WHERE dept_no = (
    SELECT dept_no FROM departments WHERE dept_name = 'Customer Service'
);

# Sales department manager employee number
SELECT emp_no
FROM dept_manager
WHERE dept_no IN (
    SELECT dept_no
    FROM departments
    WHERE dept_name = 'Sales'
)
  AND to_date > NOW();

# concatenate the first two employee's highest salaries
SELECT CONCAT (
               (
                   SELECT MAX(salary)
                   FROM salaries
                   WHERE emp_no = 10001
               ),
               ' ',
               (
                   SELECT MAX(salary)
                   FROM salaries
                   WHERE emp_no = 10002
               )
           );

# find first name and last name of all department managers

# Inner Join version
SELECT e.first_name, e.last_name
FROM employees AS e
         JOIN dept_manager AS dm ON e.emp_no = dm.emp_no;

# Subquery Version
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no FROM dept_manager
);

# Getting information from multiple tables
SELECT CONCAT (
               (
                   SELECT CONCAT(first_name, ' ', last_name)
                   FROM employees
                   WHERE emp_no = 10001
               ),
               ' works in a department called ',
               (
                   SELECT dept_name
                   FROM departments
                   WHERE dept_no = 'd005'
               ),
               '.'
           );

# all senior engineers from Customer Service department
SELECT *
FROM titles
WHERE title = 'Senior Engineer'
  AND emp_no IN (

    SELECT emp_no
    FROM dept_emp
    WHERE dept_no IN (

        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Customer Service'

    )

);
