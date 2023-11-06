-- Be sure to copy the queries in the file in the database repository for later reference.

-- What is the population of the US? (HINT: 278357000)

SELECT name, population
FROM country
WHERE name = 'United States'

-- What is the area of the US? (HINT: 9.36352e+06)

SELECT name, surfacearea
FROM country
WHERE name = 'United States'

-- Which countries gained their independence before 1963?

SELECT name, indepyear
FROM country
WHERE indepyear < 1963

-- List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37 entries)

SELECT name, continent, population, lifeexpectancy
FROM country
WHERE continent = 'Africa'
AND population < 30000000
AND lifeexpectancy > 45

-- Which countries are something like a republic? (HINT: Are there 122 or 143?)

SELECT name, governmentform
FROM country
WHERE governmentform LIKE 'Republic'
-- This returns 122 items

SELECT name, governmentform
FROM country
WHERE governmentform LIKE '%Republic'
-- This returns 143 items

-- Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)

SELECT name, governmentform, indepyear
FROM country
WHERE governmentform LIKE '%Republic'
AND indepyear > 1945

-- Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)

SELECT name, governmentform, indepyear
FROM country
WHERE governmentform NOT LIKE '%Republic'
AND indepyear > 1945

-- Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)

SELECT name, governmentform, lifeexpectancy
FROM country
ORDER BY lifeexpectancy
LIMIT 15

-- Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)

SELECT name, governmentform, lifeexpectancy
FROM country
WHERE lifeexpectancy IS NOT null
ORDER BY lifeexpectancy DESC
LIMIT 15

-- Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)

SELECT name, governmentform, population, surfacearea, population / surfacearea AS population_density
FROM country
WHERE population != 0
ORDER BY population_density
LIMIT 5

-- Which countries have the highest population density?(HINT: starts with Macao)

SELECT name, governmentform, population, surfacearea, population / surfacearea AS population_density
FROM country
WHERE population != 0
ORDER BY population_density DESC
LIMIT 5

-- Which is the smallest country by area? (HINT: .4)

SELECT name, surfacearea
FROM country
ORDER BY surfacearea
LIMIT 1

-- Which is the smallest country by population? (HINT: 50)?

SELECT name, population
FROM country
WHERE population != 0
ORDER BY population
LIMIT 1

-- Which is the biggest country by area? (HINT: 1.70754e+07)
SELECT name, surfacearea
FROM country
ORDER BY surfacearea DESC 
LIMIT 1

-- Which is the biggest country by population? (HINT: 1277558000)
SELECT name, population
FROM country
ORDER BY population DESC 
LIMIT 1

-- Who is the most influential head of state measured by population? (HINT: Jiang Zemin)
SELECT name, population, headofstate
FROM country
ORDER BY population DESC
LIMIT 1

-- Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)
WITH most_gnp AS (
	SELECT name, population, gnp
	FROM country
	ORDER BY gnp DESC
	LIMIT 10
)
SELECT name, population, gnp
FROM most_gnp
ORDER BY population
LIMIT 1

-- Of the 10 least populated countries with permanent residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)
WITH least_pop AS (
	SELECT name, population, surfacearea
	FROM country
	WHERE population != 0
	ORDER BY population
	LIMIT 10
)
SELECT name, population, surfacearea
FROM least_pop
ORDER BY surfacearea DESC
LIMIT 1

-- Which region has the highest average gnp? (HINT: North America)
SELECT region, SUM(gnp)
FROM country
GROUP BY region
ORDER BY SUM(gnp) DESC
LIMIT 1


-- Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)
SELECT headofstate, SUM(surfacearea)
FROM country
GROUP BY headofstate
ORDER BY SUM(surfacearea) DESC
LIMIT 1


-- What is the average life expectancy for all continents?
SELECT continent, AVG(lifeexpectancy)
FROM country
GROUP BY continent

-- What are the most common forms of government? (HINT: use count(*))
SELECT governmentform, COUNT(*)
FROM country
GROUP BY governmentform
ORDER BY count DESC

-- How many countries are in North America?
SELECT COUNT(continent)
FROM country
WHERE continent = 'North America'


-- What is the total population of all continents?
SELECT continent, SUM(population)
FROM country
GROUP BY continent


-- 🏔 Stretch Goals
-- Which countries have the letter "z" in the name? How many?
SELECT name
FROM country
WHERE name 
LIKE '%Z%'
OR name LIKE '%z%'

-- Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)
WITH smallest_area AS (
	SELECT name, gnp, surfacearea
	FROM country
	ORDER BY surfacearea
	LIMIT 10
)
SELECT name, gnp, surfacearea
FROM smallest_area
ORDER BY gnp DESC
LIMIT 1

-- Of the smallest 10 countries by population, which has the biggest per capita gnp?
WITH smallest_pop AS (
	SELECT name, gnp, population
	FROM country
	WHERE population != 0
	ORDER BY population
	LIMIT 10
)
SELECT name, gnp, gnp / population AS percapita_gnp
FROM smallest_pop
ORDER BY percapita_gnp DESC
LIMIT 1


-- Of the biggest 10 countries by area, which has the biggest gnp?
WITH largest_area AS (
	SELECT name, surfacearea, gnp
	FROM country
	ORDER BY surfacearea DESC
	LIMIT 10
)
SELECT name, surfacearea, gnp
FROM largest_area
ORDER BY gnp DESC
LIMIT 1

-- Of the biggest 10 countries by population, which has the biggest per capita gnp?
WITH largest_pop AS (
	SELECT name, population, gnp
	FROM country
	ORDER BY population DESC
	LIMIT 10
)
SELECT name, population, gnp / population AS percapita_gnp
FROM largest_pop
ORDER BY percapita_gnp DESC
LIMIT 1

-- What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?

WITH largest_area AS (
	SELECT name, surfacearea
	FROM country
	ORDER BY surfacearea DESC
	LIMIT 10
)
SELECT SUM(surfacearea)
FROM largest_area

WITH smallest_area AS (
	SELECT name, surfacearea
	FROM country
	ORDER BY surfacearea
	LIMIT 10
)
SELECT SUM(surfacearea)
FROM smallest_area


-- What year is this country database from? Cross reference various pieces of information to determine the age of this database.

-- Year: 2001

SELECT name, headofstate
FROM country 
WHERE name LIKE 'United States'

SELECT name, population, headofstate
FROM country
ORDER BY population DESC

-- returns George W. Bush who served from January 2001- January 2009 

-- Jiang Zemin 1993-2003 served as headofstate of China

-- Cassam Uteem served as headofstate 1992-2002

-- Abdurrahman Wahid served as headofstate 1991-2001