use employees;

select * from salaries;

select first_name, last_name, birth_date
From employees
where emp_no in(
    select emp_no
    from dept_manager
)
limit 10;

# select * from departments
# where dept_no
#     From departments
#     SELECT dept_no From departments where dept_name = 'customer service';

select * from departments
where dept_no = (
    SELECT dept_no
    FROM departments
    where dept_name = 'Customer Service'
    );

select emp_no
FROM dept_manager
WHERE dept_no IN (
        select dept_no
        FROM departments
        where dept_name = 'Sales'
    )
    AND to_date > NOW();

SELECT CONCAT (
    (
        select max(salary)
        FRom salaries
        WHERE emp_no = 10001
        ),
        ' ',
    (
        SELECT MAX(salary)
        FROM salaries
        WHERE emp_no = 1002
        )
       );

#     inner join version
    select e.first_name, e.last_name
    from employees as e
    join dept_manager as dm on e.emp_no = dm.emp_no;

#     subquery version
    select first_name, last_name
    from employees
    where emp_no in(
        Select emp_no from dept_manager
        );