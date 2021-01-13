use employees;
SELECT first_name

SELECT first_name
FROM employees
Where first_name = 'Irena'
    or first_name = 'Vidya'
    or first_name = 'Maya';

SELECT *
FROM employees
Where (first_name = 'Irena'
   or first_name = 'Vidya'
   or first_name = 'Maya')
and gender = 'M';

SELECT *
    FROM employees
    WHERE last_name
    like 'E%' OR last_name like '%E';

SELECT *
FROM employees
WHERE last_name
    like 'E%' AND last_name like '%E';

SELECT *
FROM employees
WHERE hire_date BETWEEN 1990 and 1999;

SELECT *
FROM employees
WHERE birth_date like '%-12-25';

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01'
    AND '1999-12-31' AND birth_date like '%-12-25';

SELECT first_name, last_name
FROM employees
WHERE last_name like '%q%';

SELECT first_name, last_name
FROM employees
WHERE last_name like '%q%' AND NOT last_name LIKE '%qu%';