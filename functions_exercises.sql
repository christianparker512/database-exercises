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

