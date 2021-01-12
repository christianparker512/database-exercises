USE employees;


SELECT first_name
    FROM employees
    WHERE first_name LIKE 'E%';

SELECT first_name, last_name
FROM employees
WHERE last_name in('Pearson', 'Luks', 'Peyn');

SELECT emp_no
FROM titles
WHERE to_date is NULL;

describe titles;

SELECT emp_no, first_name, last_name
FROM employees
Where last_name IN ('Herber;, "Baek')
    AND emp_no <20000;

SELECT emp_no, first_name, last_name
FROM employees
Where emp_no <20000
and last_name In('Herber', 'Baek')
or first_name = 'Shridhar';