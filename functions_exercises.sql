USE employees;

SELECT first_name
FROM employees
WHERE first_name LIKE '%sus%';

SELECT NOW();

SELECT CURDATE();

SELECT CONCAT(
               'Teaching people to code for ',
               UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'),
               ' seconds'
           );

use employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena' , 'Vidya', 'Maya')
  AND gender = 'M'
ORDER BY last_name DESC, first_name ASC;

# Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column in your results.
SELECT CONCAT(first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE 'e%' AND last_name LIKE '%e'
ORDER BY last_name;

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

# For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use now() or curdate())
SELECT CONCAT(first_name, ' ', last_name), DATEDIFF(curdate(), hire_date)
FROM employees
WHERE birth_date LIKE '%-12-25'
  AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY DATEDIFF(curdate(), hire_date);