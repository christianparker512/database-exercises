SELECT 'Pink Floyd albums' AS '';
SELECT * FROM albums WHERE artist = "Pink Floyd";

SELECT 'The year Sgt. Pepper''s Lonely Hearts Club Band was released' AS '';
SELECT release_date FROM albums WHERE album_name = 'The year Sgt. Pepper''s Lonely Hearts Club Band was released'

SELECT 'The genre for Nevermind' AS '';
SELECT genre FROM albums WHERE album_name = 'Nevermind'

SELECT 'Albums released in the 90''s' AS '';
SELECT * FROM albums WHERE release_date between 1990 and 1999;

SELECT 'Albums with less than 20 million certified sales' AS '';
SELECT album_name FROM albums WHERE sales < 20.0;

SELECT 'All the albums with a genre of "Rock"' AS '';
SELECT album_name FROM albums WHERE genre = "Rock";
