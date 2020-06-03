/* SQL Zoo 7 - MORE JOIN */

/* List the films where the yr is 1962 [Show id, title] */

SELECT id, title
FROM movie
WHERE yr = 1962

/* Give year of 'Citizen Kane'. */

SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

/* List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year. */

SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr

/* Show the actor 'Glenn Close' id number */

SELECT id
FROM actor
WHERE name = 'Glenn Close'

/* What is the id of the film 'Casablanca' */

SELECT id
FROM movie
WHERE title = 'Casablanca'

/* Obtain the cast list for 'Casablanca'. */

SELECT name
FROM casting
JOIN actor
ON id = actorid
WHERE movieid = 11768

/* Obtain the cast list for the film 'Alien' */

SELECT name
FROM casting
JOIN actor
ON id = actorid
WHERE movieid = 10522

SELECT name
FROM casting
JOIN actor a
ON a.id = actorid
JOIN movie m
ON m.id = movieid
WHERE title = 'Alien'

/* List the films in which 'Harrison Ford' has appeared */

SELECT title
FROM actor a
JOIN casting
ON a.id = actorid
JOIN movie m
ON m.id = movieid
WHERE name = 'Harrison Ford'

/* List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role] */

SELECT title
FROM actor a
JOIN casting
ON a.id = actorid
JOIN movie m
ON m.id = movieid
WHERE name = 'Harrison Ford'
AND ord <> 1

/* List the films together with the leading star for all 1962 films. */

SELECT title, name
FROM actor a
JOIN casting
ON a.id = actorid
JOIN movie m
ON m.id = movieid
WHERE yr = 1962
AND ord = 1

/* Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies. */

SELECT yr, COUNT(title)
FROM actor a
JOIN casting
ON a.id = actorid
JOIN movie m
ON m.id = movieid
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(yr) > 2

/* List the film title and the leading actor for all of the films 'Julie Andrews' played in. */

SELECT title, name
FROM actor a
JOIN casting
ON actorid = a.id
JOIN movie m
ON movieid = m.id
WHERE ord = 1
AND movieid IN (SELECT movieid
                FROM actor
                JOIN casting
                ON actorid = id
                WHERE name = 'Julie Andrews')

/* Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles. */

SELECT name
FROM casting
JOIN actor
ON  actorid = id
WHERE ord = 1
GROUP BY name
HAVING COUNT(movieid) >= 15

/* List the films released in the year 1978 ordered by the number of actors in the cast, then by title. */

SELECT title, COUNT(actorid)
FROM casting
JOIN movie
ON movieid = id
WHERE yr = 1978
GROUP BY title
ORDER BY 2 DESC, 1 ASC

/* List all the people who have worked with 'Art Garfunkel'.  */

SELECT DISTINCT name
FROM actor
JOIN casting
ON actorid = id
WHERE name <> 'Art Garfunkel'
AND movieid IN (SELECT movieid
                FROM actor
                JOIN casting
                ON actorid = id
                WHERE name = 'Art Garfunkel')

/* lists the unfortunate directors of the movies which have caused financial loses (gross < budget) */

SELECT name
FROM actor INNER JOIN movie
ON actor.id = director
WHERE gross < budget

/* JOINing three tables */

SELECT *
FROM actor
JOIN casting
ON actor.id = actorid
JOIN movie
ON movie.id = movieid

/* Show the list of actors called 'John' by order of number of movies in which they acted */

SELECT name, COUNT(movieid)
FROM casting
JOIN actor
ON actorid = actor.id
WHERE name LIKE 'John %'
GROUP BY name
ORDER BY 2 DESC

/* Show titles where 'Paul Hogan' has been actor */

SELECT title
FROM movie
JOIN casting
ON movieid = movie.id
JOIN actor
ON actorid = actor.id
WHERE name = 'Paul Hogan'
AND ord = 1

/* Lists all the actors that starred in movies directed by Ridley Scott who has id 351 */

SELECT name
FROM movie
JOIN casting
ON movie.id = movieid
JOIN actor
ON actor.id = actorid
WHERE ord = 1
AND director = 351

/* List the movies where 'Robert De Niro' has been actor and */

SELECT title, yr
FROM movie, casting, actor
WHERE name = 'Robert De Niro'
AND movieid = movie.id
AND actorid = actor.id
AND ord = 3
