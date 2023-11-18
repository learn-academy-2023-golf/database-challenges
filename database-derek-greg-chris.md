<!-- Be sure to copy the queries in the file in the database repository for later reference.

What is the population of the US? (HINT: 278357000)
SELECT name, population 
FROM country
WHERE population = 278357000

What is the area of the US? (HINT: 9.36352e+06)
SELECT name, surfacearea
FROM country
WHERE surfacearea = 9.36352e+06

Which countries gained their independence before 1963?
<>SELECT *
FROM country
WHERE INDEPYEAR < 1963

List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37 entries)
SELECT name, population
FROM country
WHERE population < 30000000
AND continent = 'Africa'
AND lifeexpectancy > 45

Which countries are something like a republic? (HINT: Are there 122 or 143?)
SELECT name, population
FROM country
WHERE governmentform 
LIKE '%epublic';

Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)
Select name, governmentform, indepyear
from country
where governmentform LIKE '%Republic'
AND indepyear > 1945

Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)
Select name, governmentform, indepyear
from country
where governmentform NOT LIKE '%Republic'
AND indepyear > 1945

Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)
SELECT NAME, lifeexpectancy
FROM country
WHERE lifeexpectancy IS NOT null
ORDER BY lifeexpectancy ASC 
LIMIT 15


Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)
SELECT NAME, lifeexpectancy
FROM country
WHERE lifeexpectancy IS NOT null
ORDER BY lifeexpectancy DESC
LIMIT 15

Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)
SELECT NAME, surfacearea, population,
population/surfacearea AS population_density
FROM country
WHERE population > 0
ORDER BY population_density ASC
limit 5

Which countries have the highest population density?(HINT: starts with Macao)
SELECT NAME, surfacearea, population,
population/surfacearea AS population_density
FROM country
WHERE population > 0
ORDER BY population_density DESC
limit 5

Which is the smallest country by area? (HINT: .4)
SELECT NAME, surfacearea
FROM country
ORDER BY surfacearea ASC

Which is the smallest country by population? (HINT: 50)?
SELECT NAME, population
FROM country
WHERE population > 0
ORDER BY population ASC

Which is the biggest country by area? (HINT: 1.70754e+07)
SELECT NAME, surfacearea
FROM country
WHERE surfacearea > 0
ORDER BY surfacearea DESC

Which is the biggest country by population? (HINT: 1277558000)
SELECT NAME, population
FROM country
WHERE population > 0
ORDER BY population DESC

Who is the most influential head of state measured by population? (HINT: Jiang Zemin)
SELECT headofstate
FROM country
WHERE population > 0
ORDER BY population DESC

Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)
SELECT name, gnp
FROM country
WHERE gnp > 0
ORDER BY gnp DESC
limit 10

Of the 10 least populated countries with permanent residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)
SELECT name, population, surfacearea
FROM country
WHERE population > 0 
AND surfacearea > 0
ORDER BY population ASC
limit 10


Which region has the highest average gnp? (HINT: North America)
SELECT name, region, gnp
FROM country
WHERE gnp > 0
ORDER BY gnp DESC

Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)
SELECT name, headofstate, surfacearea
FROM country
WHERE surfacearea > 0
ORDER BY surfacearea DESC

What is the average life expectancy for all continents?
SELECT continent, lifeexpectancy
FROM country
WHERE lifeexpectancy > 0
ORDER BY lifeexpectancy DESC

What are the most common forms of government? (HINT: use count(*))


How many countries are in North America?


What is the total population of all continents?





🏔 Stretch Goals
Which countries have the letter "z" in the name? How many?
Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)
Of the smallest 10 countries by population, which has the biggest per capita gnp?
Of the biggest 10 countries by area, which has the biggest gnp?
Of the biggest 10 countries by population, which has the biggest per capita gnp?
What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?
What year is this country database from? Cross reference various pieces of information to determine the age of this database. -->
