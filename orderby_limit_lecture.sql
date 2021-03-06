use employees;

SELECT first_name, last_name
FROM employees
ORDER BY last_name DESC, first_name ASC;

SELECT first_name, last_name
FROM employees
ORDER BY first_name DESC, last_name ASC;

SELECT * FROM employees
ORDER BY gender
LIMIT 15 OFFSET 10;

SELECT first_name, last_name, birth_date
FROM employees
ORDER BY birth_date;

DESCRIBE employees;
