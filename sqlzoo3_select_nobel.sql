/* SQL Zoo 3 - SELECT Nobel */

/* Show nobel prizes for 1950 */

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

/* Show who won the 1962 prize for Literature. */

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature';

/* Show the year and subject that won 'Albert Einstein' his prize. */

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

/* Give the name of the 'Peace' winners since the year 2000, including 2000. */

SELECT winner
FROM nobel
WHERE subject = 'Peace' and yr >= 2000;

/* Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive. */

SELECT *
FROM nobel
WHERE subject = 'Literature'
AND yr >= 1980
AND yr <= 1989;

/* Show all details of the presidential winners */

SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

/* Show the winners with first name John */

SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

/* Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984. */

SELECT *
FROM nobel
WHERE subject = 'Physics' AND yr = 1980
OR subject = 'Chemistry' AND yr = 1984;

/* Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine */

SELECT *
FROM nobel
WHERE yr = 1980
AND subject <> 'Chemistry'
AND subject <> 'Medicine';

/* Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004) */

SELECT *
FROM nobel
WHERE yr < 1910
AND subject = 'Medicine'
OR yr >= 2004
AND subject = 'Literature';

/* Find all details of the prize won by Peter Grünberg */

SELECT *
FROM nobel
WHERE winner = 'Peter Grünberg';

/* Find all details of the prize won by Eugene O'Neill */

SELECT *
FROM nobel
WHERE winner = 'Eugene O\'Neill';

/* List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order. */

SELECT winner, yr, subject
FROM nobel
WHERE winner
LIKE 'Sir%'
ORDER BY yr DESC, winner ASC;

/* Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last. */

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'), subject, winner;


/* Show the name of winner's names beginning with C and ending in n */

SELECT winner
FROM nobel
WHERE winner
LIKE 'C%'
AND winner LIKE '%n'

/* Show how many Chemistry awards were given between 1950 and 1960 */

SELECT COUNT(subject) FROM nobel
WHERE subject = 'Chemistry'
AND yr BETWEEN 1950 and 1960;

/* Show the amount of years where no Medicine awards were given */

SELECT COUNT(DISTINCT yr)
FROM nobel
WHERE yr NOT IN
(SELECT DISTINCT yr
 FROM nobel
 WHERE subject = 'Medicine');

/* Lir Sir and year like 196... */

SELECT subject, winner
FROM nobel
WHERE winner LIKE 'Sir%' AND yr LIKE '196%';

/* show the year when neither a Physics or Chemistry award was given */

SELECT yr
FROM nobel
WHERE yr
NOT IN(SELECT yr
FROM nobel
WHERE subject IN ('Chemistry','Physics'));

/* Show the years when a Medicine award was given but no Peace or Literature award was */

SELECT DISTINCT yr
FROM nobel
WHERE subject='Medicine'
AND yr NOT IN(SELECT yr FROM nobel
              WHERE subject='Literature')
AND yr NOT IN (SELECT yr FROM nobel
               WHERE subject='Peace');

/* Show the subject and count from year 1960 */

SELECT subject, COUNT(subject)
FROM nobel
WHERE yr ='1960'
GROUP BY subject;
