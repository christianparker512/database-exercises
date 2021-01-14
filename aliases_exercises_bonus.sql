use employees;

# what are the names of the 10 most recently hired females in the company? the first 10? (no group by needed)

# what are the top three most common job titles?

select title, count(*) from titles
group by title
order by count(*) desc
limit 3;

describe titles;

# what is the most common 'from date' for job titles? for staff only?

# what is the highest employee number for an engineer?



# what is the most common birthday?


# what is the most common female birthday? male?



# what is the most common hire date for female and male employees?
# what is the longest last name of someone born on March 8, 1952?
# what is the lowest employee number for the first senior engineers in the company?