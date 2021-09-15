-- total cases  vs population
SELECT location,date,total_cases,total_deaths, 
(total_deaths/total_cases)*100.00 as DeathPercentge from CovidDeaths
where location like '%states%';

-- percentage of got covid
SELECT location,date,total_cases,population,
(total_cases/population)*100 as percentofpopulation
FROM CovidDeaths 
where location='Sri Lanka';


-- countries with hightest infection rate compared to population
SELECT location,date,max(total_cases) as highestInfectionCount,population,
max((total_cases/population))*100 as percentofpopulation
FROM CovidDeaths 
`	group by location,population
ORDER by percentofpopulation DESC;

-- countries with highest death counts per population
SELECT location,population,max(total_deaths) as highestDeathCount,
max((total_deaths/population))*100 as highestDeathCountsPerPopulation
FROM CovidDeaths
where continent is not null
GROUP by location 
order by highestDeathCount DESC;




-- compare as continent
SELECT continent,location,population,max(total_deaths) as highestDeathCount
FROM CovidDeaths
--where continent is not null
GROUP by continent 
order by highestDeathCount DESC;

-- countries with highest death count per population

SELECT location,max(CAST(total_deaths as INT)) as total_death_count
from CovidDeaths
where continent is not NULL
GROUP by location 
ORDER by total_death_count desc;
