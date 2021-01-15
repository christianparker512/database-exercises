

use employees;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
LIMIT 10;


SELECT emp_no, CONCAT(e.first_name, ' ', e.last_name) AS full_name, hire_date
FROM employees AS e
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010);