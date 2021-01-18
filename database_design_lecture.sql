Guide to Database Design

#### Normalization

The process of "normalizing" a relational database design. Different levels of normalization are possible, each level further seperating concerns and abstracting data over multiple tables.

#### Entity Relationship Diagram (ERD)

A way to visually describe the schema of a database and the relationships between tables.

#### One-to-One Relationship
- ***Definition:*** a relationship where one record on a table matches with one record on another table.
- ***Example:*** users and user_details
- ***Common strategy to implement:*** the owner table of the relationship should have a foreign key to the non-owner.

#### One-to-Many Relationship

- ***Definition:*** a relationship where one record on a table matches with several records on another table.
- ***Example:*** users and posts
- ***Common strategy to implement:*** the table on the many side should have a foreign key pointing to the single owner from the owning-side table.

#### Many-to-Many Relationship

- ***Definition:*** a relationship where one record on a table matches with several records on another table and a record on the other table matches with several records on the first table.
- ***Example:*** users and events
- ***Common strategy to implement:*** neither table should have a foreign key to the other and instead, an associative (join) table should be used to link the two together via two foreign key columns, each linking to a primary key of both tables in the many-to-many relationship.

<div style="page-break-after: always;"></div>

## DB Design Conventions to Follow
    USE codeup_test_db;

     CREATE TABLE authors(
         id INT unsigned not null auto_increment,
         first_name VARCHAR(50),
         last_name VARCHAR(100) NOT NULL,
         PRIMARY KEY(id)
     );

    INSERT INTO authors (first_name, last_name) VALUES
        ('Christian', 'Parker'),
        ('Lisa', 'Parker'),
        ('Abby', 'Parker');

    DESCRIBE authors;

    SELECT * FROM authors;

    CREATE TABLE quotes1 (
        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        content TEXT NOT NULL,
        author_id INT UNSIGNED NOT NULL,
        Primary Key (id),
        Foreign Key (author_id) REFERENCES authors(id)
    );
    INSERT INTO quotes1(author_id, content)
    VALUES (1, 'good times'),
           (2, 'whatever'),
           (3, 'Anchor Down'),
            (1, 'Hook em');
    SELECT * from authors;
    DESCRIBE authors;
    SELECT * from quotes1;
    DESCRIBE quotes;
    SELECT * from quotes;
    SELECT * FROM quotes where id = 1;
    SELECT * from quotes where id = 2;

    SELECT * from quotes;
INSERT INTO authors(first_name, last_name) VALUES
('Douglas', 'Adams'),
('Mark', 'Twain'),
('Kurt', 'Vonnegut'),
('Carol', 'Dweck'),
('John', 'Muir');



SELECT * FROM employees WHERE hire_date = '1985-01-01';
SELECT * FROM employees where hire_date > '1985-01-01';
SELECT * from employees where hire_date < '1985-01-01';

SELECT * from employees where first_name like 'p%';
SELECT * from employees where last_name like '%p';

SELECT first_name
FROM employees
where first_name LIKE '%isa%';

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no BETWEEN 10026 and 10082;

SELECT emp_no, first_name, last_name
FROM employees
Where last_name IN ('Baek');

SELECT emp_no, first_name, last_name
FROM employees
Where last_name IN ('Baek', 'dredge');

SELECT emp_no, first_name, last_name
FROM employees
where last_name IN('Baek') and emp_no < 20000;

SELECT emp_no, first_name, last_name
FROM employees
where last_name IN('Baek') and emp_no < 20000 or first_name = 'Shridhar';

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
  AND (
            last_name IN ('Herber','Baek')
        or first_name = 'Shridhar'
    );


Select emp_no, first_name, last_name
from employees
where first_name in ('Irena', 'vidya','maya');

select emp_no, first_name, last_name
from employees
where last_name like 'e%';

select emp_no, first_name, last_name, hire_date
from employees
where hire_date > '1990-01-01';

select emp_no, first_name, last_name, birth_date
from employees
where birth_date like '%-12-25';

SELECT emp_no, first_name, last_name, hire_date
from employees
where hire_date between '1990-01-01' and '1999-12-31';

SELECT first_name, last_name
From employees
where last_name like 'q%';

SELECT first_name, last_name
FROM employees
where (first_name = 'Irena'
    or first_name = 'vidya'
    or first_name = 'maya');

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
WHERE hire_date BETWEEN '1990-01-01'
    AND '1999-12-31' AND birth_date like '%-12-25';

SELECT first_name, last_name
FROM employees
WHERE last_name like '%q%';

SELECT first_name, last_name
FROM employees
WHERE last_name like '%q%' AND NOT last_name LIKE '%qu%';


#order by....How to sort.
select first_name, last_name
from employees
order by last_name;

select emp_no, first_name, last_name
from employees
order by last_name desc;

Select emp_no, first_name, last_name
from employees
order by last_name desc, first_name asc;

select first_name, last_name
FROM employees
Order by last_name desc;

select first_name, last_name
FROM employees
Order by last_name asc;

Select emp_no, first_name, last_name
FROM employees
Where first_name like 'M%'
# order by first_name asc
limit 10;

SELECT emp_no, first_name, last_name
FROM employees
where first_name like 'M%'
# order by last_name desc
limit 25 offset 50;

SELECT emp_no, concat(first_name, ' ', last_name)
FROM employees
where first_name like 'M%';

SELECT curdate(), emp_no, concat(first_name, ' ', last_name)
FROM employees
where first_name not like '%a%' and last_name NOT LIKE '%a%';

select Now();

select curdate();

Select curtime();

Select distinct first_name
from employees;

SELECT first_name
From employees
GROUP BY first_name desc;

SELECT first_name
From employees
Group By last_name, first_name;

Select last_name, first_name
from employees
group by last_name, first_name;


1. All tables except associative tables should have a single primary key called id.

	```
	users
	  id
	  username
	  email
	  password
	```

2. All table cells must contain atomic data (a single cell cannot contain multiple values).

	```
	  users
	    id
	    username
	    phone_numbers

	  1 | bob123| 2105554545, 2105556767, 2105553232 <--- AVOID THIS!
	```


3. All columns within a single row should be independent from one another (if not, another table may be needed).

	```
	  users
	    id
	    name
	    favorite_color_1
	    favorite_color_2

      A better alternative...

	  users
	    id
	    name

	  colors
	    id
	    name

	  color_user
	    color_id
	    user_id
	```

4. When duplicate values exist accross multiple rows, consider breaking out the column(s) into another table.

  ```
  users
      id
      username
      email
      password
      home_state

  1 | bob123 | bob@email.com | JKL3J2JHSURNZ931H | Texas
  2 | kev123 | kev@email.com | JKL3J2JHSURNZ931H | Texas <--- duplicate!
  3 | dan123 | dan@email.com | JKL3J2JHSURNZ931H | Arizona
  4 | mat123 | mat@email.com | JKL3J2JHSURNZ931H | Washington
  5 | rob123 | rob@email.com | JKL3J2JHSURNZ931H | Texas <--- duplicate!

  Consider a states table.
 ```

## Helpful Links

##### Additional Info

- ERDs Explained: [https://www.lucidchart.com/pages/er-diagrams](https://www.lucidchart.com/pages/er-diagrams)
- Guide to Crow's Foot notation: [https://www.vertabelo.com/blog/crow-s-foot-notation/](https://www.vertabelo.com/blog/crow-s-foot-notation/)

##### ERD Creation Apps

- [draw.io](https://google.com)
- [lucidchart](https://www.lucidchart.com)
- [sqldbm](https://sqldbm.com)
- Don't forget about good 'ol pencil and paper or a whiteboard!


