--question 1--
SELECT * 
FROM movies.movies;

--question 2--
SELECT title, id
FROM movies.movies
LIMIT 10;

--question 3--
SELECT * FROM movies.movies 
WHERE id = 485;

--question 4--
SELECT * FROM movies.movies
WHERE title = 'Made in America (1993)';

--question 5--
SELECT * FROM movies.movies
ORDER BY title ASC
limit 10;

--question 6--
SELECT * FROM movies.movies
WHERE title lIKE '%2002%';

--quesion 7--
SELECT * FROM movies.movies
WHERE title LIKE '%Godfather, the%';

--question 8--
SELECT * FROM movies.movies
WHERE genres LIKE '%Comedy%';

--question 9--
SELECT * FROM movies.movies
WHERE genres LIKE '%Comedy%'
AND title LIKE '%2000%';

--question 10--
SELECT * FROM movies.movies
WHERE genres LIKE '%Comedy%'
AND title LIKE '%death%'
OR title LIKE '%die%';

--question 11--
SELECT * FROM movies.movies
WHERE (
title LIKE '%2002%'
OR title LIKE '%2001%'
)
AND title LIKE '%super%';

--question 12--
CREATE TABLE `movies`.`actors` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `character_name` VARCHAR(45) NOT NULL,
  `movie_id` INT NOT NULL,
  `birthday` DATETIME NOT NULL,
  PRIMARY KEY (`id`));

--question 13--
INSERT INTO movies.actors
(name, character_name, movie_id, birthdate)
VALUES
('Henry Carville', 'Superman', '136864', '1983-05-05')

--question 14--
-- g: 1, pg: 2, pg-13: 3, r: 4, nc-17: 5
ALTER TABLE `movies`.`movies`
ADD COLUMN `mpaa` INT NULL
AFTER `genres`,
  CHANGE COLUMN `id` `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE;
;

UPDATE movies.movies
set mpaa = 1
WHERE id = 1;

UPDATE movies.movies
set mpaa = 3
WHERE id = 2;

UPDATE movies.movies
set mpaa = 3
WHERE id = 3;

UPDATE movies.movies
set mpaa = 4
WHERE id = 4;

UPDATE movies.movies
set mpaa = 2
WHERE id = 5;

--question 15--

SELECT mov.title, rat.rating
FROM movies.movies mov
INNER JOIN movies.ratings rat
ON mov.id = rat.movie_id
WHERE title LIKE '%godfather%'
ORDER BY title ASC;

--question 16--

SELECT mov.title, rat.rating
FROM movies.movies mov
INNER JOIN movies.ratings rat
ON mov.id = rat.movie_id
WHERE title LIKE '%godfather%'
ORDER BY title DESC;

--question 17--

SELECT
mov.title,
lin.imdb_Id
FROM movies.movies mov
INNER JOIN movies.links lin
ON mov.id = lin.movie_Id
WHERE (genres LIKE '%comedy%'
AND title LIKE '%2005%');

--question 18--


????


--question 19--

SELECT 
AVG(r.rating) average
FROM movies.ratings r
WHERE r.movie_id = 1;

--question 20--

SELECT 
SUM(r.rating) average
FROM movies.ratings r
WHERE r.movie_id = 1;

--question 21--

SELECT r.movie_id, AVG(r.rating) average
FROM movies.ratings r
GROUP BY r.movie_id
HAVING AVG(r.rating) > 4;