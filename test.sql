-- total cases  vs population
SELECT location,date,total_cases,total_deaths, 
(total_deaths/total_cases)*100.00 as DeathPercentge from CovidDeaths
where location like '%states%';
