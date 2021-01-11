USE codeup_test_db;

CREATE TABLE transactions(
    id INT,
    date DATE,
    description VARCHAR(255),
    amount DECIMAL (10,2)

);

DESCRIBE transactions;

DROP TABLE transactions;

CREATE TABLE users (
    id INT UNSIGNED,
    --if zero then user is not admin.
    --if one then user is an admin
    is_admin TINYINT
    zipcode char(15)
    -- a string with fixed number of characters where the length can be from 1 to 255.

);

CREATE TABLE blog_posts(
    title VARCHAR(100),
    body text
    -- VarChar Strings up to 65,535 characters long.
    -- most common type of column you will use.
    -- anything more than 255 characters should use TEXT.
    -- date yyy-mm-dd
    -- time: uses 24-hour times.
    -- DATETIME: a combined date and time value. Does not store any timezone information. YYYY-MM-DD  HH:MM:SS
    );
CREATE TABLE IF NOT EXISTS blog_posts(
    title VARCHAR(100) NOT NULL,
    body TEXT
    --Text: A large block of characters that can be any length.
    -- NULL: in mMySQL, null can be thought of as the absence of value
    -- use null where it makes sense for information to be missing when a record is created.
        -- for example - maybe adding a phone number is optional when you register.
    -- use not null when it doesn't make sense for the record to lack data for a given column
        -- for example, you would want to collect an email from a user when they register.
);

CREATE TABLE IF NOT EXISTS contacts (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100 NOT NULL,
    last_name VARCHAR(100) NOT NULL DEFAULT 'unknown',
    phone_number VARCHAR (50) NOT NULL,
    address VARCHAR (255),,
    email VARCHAR (50),
    zipcode char(15)
    PRIMARY KEY(id))

)