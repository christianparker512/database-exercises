USE employees;

SELECT CONCAT(first_name, ' ', last_name)
FROM employees;

SELECT CONCAT(first_name, ' ', last_name) AS 'All employees'
FROM employees;

SELECT first_name, last_name
FROM employees
WHERE last_name = 'A%a'
  AND last_name NOT LIKE '%a%';


-- # Returns result in Date-TIME
SELECT NOW();

#Returns result as DATE
SELECT CURDATE();

#Returns result as TIME
SELECT CURTIME();

#Returns the unitx time stamp
SELECT UNIX_TIMESTAMP();