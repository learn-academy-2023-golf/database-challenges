-- Challenges
-- Be sure to copy the queries in the file in the database repository for later reference.

-- What is the population of the US? (HINT: 278357000)

Select name, population
from country
where name = 'United States'

-- What is the area of the US? (HINT: 9.36352e+06)

Select name, surfacearea
from country
where name = 'United States'

-- Which countries gained their independence before 1963?

Select name, indepyear
from country
where indepyear <= '1963'

-- List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37 entries)

Select name, population, lifeexpectancy, continent
from country
where continent = 'Africa' 
AND lifeexpectancy > 45 
AND population < 3E7

-- Which countries are something like a republic? (HINT: Are there 122 or 143?)

Select name, governmentform
from country
where governmentform LIKE '%Republic'

-- Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)

Select name, governmentform, indepyear
from country
where governmentform LIKE '%Republic'
AND indepyear >= 1945

-- Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)

Select name, governmentform, indepyear
from country
where governmentform NOT LIKE '%Republic'
AND indepyear >= 1945

-- Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)

Select name, lifeexpectancy
from country
order by lifeexpectancy 
limit 15

-- Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)

Select name, lifeexpectancy
from country
Where lifeexpectancy is not null
order by lifeexpectancy DESC
limit 15

-- Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)

Select name, population, surfacearea,
population / surfacearea AS density
from country
where population > 0
order by density asc 
limit 5

-- Which countries have the highest population density?(HINT: starts with Macao)

Select name, population, surfacearea,
population / surfacearea AS density
from country
where population > 0
order by density desc 

-- Which is the smallest country by area? (HINT: .4)

Select name, surfacearea
from country
order by surfacearea asc
limit 1

-- Which is the smallest country by population? (HINT: 50)?

Select name, population
from country
where population > 0
order by population asc
limit 1

-- Which is the biggest country by area? (HINT: 1.70754e+07)

Select name, surfacearea
from country
order by surfacearea desc
limit 1

-- Which is the biggest country by population? (HINT: 1277558000)

Select name, population
from country
order by population desc
limit 1

-- Who is the most influential head of state measured by population? (HINT: Jiang Zemin)

Select headofstate, population
from country
order by population desc
limit 1

-- Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)

with top_gnp AS ( 
	SELECT name, population, gnp
	from country
	where gnp > 0
	order by gnp desc
	limit 10
)
select name, population, gnp
from top_gnp
order by population asc
limit 10

-- Of the 10 least populated countries with permanent residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)
WITH least_populated AS (
	SELECT name, surfacearea
	FROM country
	WHERE population > 0
	ORDER BY population ASC
	LIMIT 10
)
SELECT name, surfacearea
FROM least_populated
ORDER BY surfacearea DESC
limit 1

-- Which region has the highest average gnp? (HINT: North America)

SELECT region, AVG(gnp) AS avg_gnp
FROM country
GROUP BY region
ORDER BY avg_gnp DESC
limit 1

-- Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)

SELECT name, headofstate, surfacearea
from country
WHERE headofstate = 'Elisabeth II'
ORDER BY surfacearea DESC
LIMIT 1

-- What is the average life expectancy for all continents?

SELECT continent, AVG(lifeexpectancy) AS avg_life_expectancy
from country
GROUP BY continent

-- What are the most common forms of government? (HINT: use count(*))

SELECT governmentform, COUNT(*) AS frequency
from country
GROUP BY governmentform
ORDER BY frequency DESC

-- How many countries are in North America?

SELECT COUNT(*) AS number_of_countries
FROM country
WHERE continent = 'North America'

-- What is the total population of all continents?

SELECT continent, SUM(population) AS total_population
FROM country
Group by continent

-- 🏔 Stretch Goals

-- Which countries have the letter "z" in the name? How many?

SELECT name                     
FROM country
WHERE name
ILIKE '%z%' 

-- Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)

SELECT name                     
FROM country
WHERE name IN (
SELECT name
	FROM country
	ORDER BY surfacearea
	limit 10
)
ORDER BY gnp DESC
LIMIT 1

-- Of the smallest 10 countries by population, which has the biggest per capita gnp?

SELECT name                     
FROM country
WHERE name IN (
SELECT name
	FROM country
	WHERE population > 0
	ORDER BY population
	limit 10
)
ORDER BY gnp/population DESC
LIMIT 1

-- Of the biggest 10 countries by area, which has the biggest gnp?

SELECT name                     
FROM country
WHERE name IN (
SELECT name
	FROM country
	ORDER BY surfacearea DESC
	limit 10
)
ORDER BY gnp DESC
LIMIT 1

-- Of the biggest 10 countries by population, which has the biggest per capita gnp?

SELECT name                     
FROM country
WHERE population > 0 AND name IN ( 
SELECT name
	FROM country
	ORDER BY population DESC
	limit 10
)
ORDER BY gnp/population DESC
LIMIT 1

-- What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?

-- What year is this country database from? Cross reference various pieces of information to determine the age of this database.