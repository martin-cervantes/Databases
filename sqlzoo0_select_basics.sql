/* SQL Zoo 0 - SELECT Basics */

/* Show the population of Germany */

SELECT population
FROM world
WHERE name = 'Germany';

/* Show the name and the population for 'Sweden', 'Norway' and 'Denmark'. */

SELECT name, population
FROM world
WHERE name
IN ('Sweden', 'Norway', 'Denmark');

/* Show the country and the area for countries with an area between 200,000 and 250,000. */

SELECT name, area
FROM world
WHERE area
BETWEEN 200000 AND 250000;

/* Show per-capita GDP for the trillion dollar countries to the nearest $1000. */

SELECT name, ROUND(gdp/population,-3)
FROM world
WHERE gdp > 1000000000000;

/* Show name and population of all contries that its population is between 1M an 1.25M */

SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000

/* Show name and population of all contries that its names starts with Al */

SELECT name, population
FROM world
WHERE name LIKE "Al%"

/* Show name of all contries that its names ends with a or l */

SELECT name
FROM world
WHERE name
LIKE 'a%'
OR name
LIKE '%l'

/* Show name and length of all contries that its length is 5 and region = Europe */

SELECT name, length(name)
FROM world
WHERE length(name) = 5
AND region = 'Europe'

SELECT name, area * 2
FROM world
WHERE population = 64000

/* Show the countries with an area larger than 50000 and a population smaller than 10000000 */

SELECT name, area, population
FROM world
WHERE area > 50000
AND population < 10000000

/* Show the population density of China, Australia, Nigeria and France */

SELECT name, population
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia')
