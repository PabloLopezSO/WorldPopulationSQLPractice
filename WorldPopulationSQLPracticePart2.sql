/*1.-How many entries in the countries table are from Africa?*/

SELECT COUNT(*) AS "Entries" 
FROM countries 
WHERE countries.continent = "Africa";

/*2.-What was the total population of the continent of Oceania in 2005?*/

SELECT population_years.population, 
    countries.name, countries.continent 
FROM population_years 
    INNER JOIN countries ON (countries.id = population_years.id) 
WHERE population_years.year = 2005 AND countries.continent = "Oceania";

/*3.-What is the average population of countries in South America in 2003?*/

SELECT AVG(population_years.population) as "Average Population", 
    countries.name, countries.continent 
FROM population_years 
    INNER JOIN countries ON (countries.id = population_years.id) 
WHERE countries.continent = "South America" 
GROUP BY countries.name;

/*4.-What country had the smallest population in 2007?*/

SELECT population_years.population, 
    countries.name, 
    countries.continent 
FROM population_years 
    INNER JOIN countries ON (countries.id = population_years.id) 
WHERE population_years.year = 2007 
ORDER BY population_years.population ASC LIMIT 1;

/*5.-What is the average population of Poland during the time period covered by this dataset?*/

SELECT AVG(population_years.population) as "Average Population", 
    countries.name, countries.continent 
FROM population_years 
    INNER JOIN countries ON (countries.id = population_years.id) 
WHERE countries.name = "Poland";

/*7.-How many countries have the word “The” in their name?*/

SELECT COUNT(countries.name) as "Countries that have The in their name" 
FROM population_years 
    INNER JOIN countries ON (countries.id = population_years.id) 
WHERE countries.name LIKE '%The%';

/*8.-What was the total population of each continent in 2010?*/

SELECT SUM( DISTINCT population_years.population) as "Total_Population", 
    countries.name, 
    countries.continent 
FROM population_years 
    INNER JOIN countries ON (countries.id = population_years.id) 
WHERE population_years.year = 2010 
GROUP BY countries.continent 
ORDER BY Total_Population DESC;