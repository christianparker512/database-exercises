

use employees;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
LIMIT 10;

# Find all the employees with the same hire date as employee 101010 using a subquery.
# 69 Rows
SELECT emp_no, CONCAT(e.first_name, ' ', e.last_name) AS full_name, hire_date
FROM employees AS e
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010);

# 2. Find all the titles held by all employees with the first name Aamod.
# 314 total titles, 6 unique titles
SELECT title, COUNT(title)
FROM titles
WHERE emp_no IN (SELECT emp_no
                 FROM employees
                 WHERE first_name = 'Aamod')
group by title;

SELECT first_name, last_name, gender
    FROM employees
    where emp_no in (
        SELECT emp_no
        FROM dept_manager
        WHERE to_date = '9999-01-01')
        AND gender = 'F'
         ORDER BY first_name;

# Bonus find all the department names that currently have female managers
SELECT dept_name FROM departments WHERE dept_no IN (
    SELECT dept_no
    FROM dept_emp
    WHERE emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE emp_no IN(
            SELECT emp_no
            FROM dept_manager
            WHERE to_date = '9999-01-01'
        ) AND gender = 'F'
    )
);

# Bonus #2 Find the first and last name of the employee with the highest salary.

SELECT dept_no
FROM dept_manager
WHERE to_date = '9999-01-01';

SELECT emp_no
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date = '9999-01-01'
) AND gender = 'F';

SELECT MAX(salary) FROM salaries;

SELECT first_name, last_name FROM employees WHERE emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE salary IN (
        SELECT MAX(salary)
        FROM salaries
    )
)










