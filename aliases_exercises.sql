# 2. use employees database
use employees;

# 3 Return 10 employees in a result set named 'full_name' in the format of 'last name, first name' for each employee.
SELECT CONCAT (last_name, ', ', first_name) as full_name
from employees
limit 10;

#4 add the birth_date for each employee as 'DOB' to the query
SELECT CONCAT(last_name, ', ', first_name) as full_name, birth_date AS DOB
from employees
limit 10;

# 5 Update the query to format full name to include the employee number so it is formatted as 'employee number - last name, first name'.
SELECT CONCAT (emp_no, '-', last_name, ', ', first_name) as full_name, birth_date AS DOB
from employees
limit 10;
