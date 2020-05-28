/* SQL Zoo 2 - SELECT World */

/* Show the name, continent and population of all countries. */

SELECT name, continent, population
FROM world;

/* Show the name for the countries that have a population of at least 200 million. */

SELECT name
FROM world
WHERE population > 200000000;

/* Give the name and the per capita GDP for those countries with a population of at least 200 million. */

SELECT name, gdp/population
FROM world
WHERE population > 200000000;

/* Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions. */

SELECT name, population/1000000
FROM world
WHERE continent = 'South America';

/* Show the name and population for France, Germany, Italy */

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

/* Show the countries which have a name that includes the word 'United' */

SELECT name
FROM world
WHERE name
LIKE 'United%';

/* Show the countries that are big by area or big by population. Show name, population and area. */

SELECT name, population, area
FROM world
WHERE area > 3000000
OR population > 250000000;

/* Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area. */

SELECT name, population, area
FROM world
WHERE (population > 250000000 OR area > 3000000)
AND NOT(population > 250000000 AND area > 3000000);

/* Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places. */

SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';


/* QUIZ */

/* Show the name of countries beginning with U */

SELECT name
FROM world
WHERE name
LIKE 'U%';

/* Show just the population of United Kingdom */

SELECT population
FROM world
WHERE name = 'United Kingdom';

/* Show cities where continent is France: */

SELECT continent
FROM world
WHERE name = 'France';

SELECT name, population / 10
FROM world
WHERE population < 10000;

/* Show name and population of countries in Europe and Asia */

SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia');

/* Select the code which would give two rows */

SELECT name
FROM world
WHERE name IN ('Cuba', 'Togo');

/* Show the cities in South America where population is grater than 40M */

SELECT name FROM world
WHERE continent = 'South America'
AND population > 40000000;
