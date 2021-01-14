USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(50) NOT NULL DEFAULT 'unknown',
    name VARCHAR(50) NOT NULL DEFAULT 'untitled' UNIQUE,
    release_date INT UNSIGNED,
    sales FLOAT UNSIGNED,
    genre VARCHAR(100),
    -- the primary key creates a relationship with other tables. The primary key needs to be unique.
    PRIMARY KEY(id)

);