/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

Select *
From coviddeaths
where continent is not null
order by 3,4;

Select *
From covidvaccinations
order by 3,4;

-- Select Data that we are going to be using

Select Location, date, total_cases, new_cases, total_deaths, population
from coviddeaths
order by 1,2;

-- Looking at Total Cases vs Total Deaths
-- Shows the likelihood of dying if you contract covid in your country

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from coviddeaths
-- Where location like '%states%'
order by 1,2; 

-- Looking at the total cases vs the population
-- Shows what percentage of population got covid

Select Location, date, total_cases, population, (total_cases/population)*100 as PercentPopulationInfected
from coviddeaths
-- Where location like '%states%'
order by 1,2; 

-- Looking at countries with highest infection rate compared to Population

Select Location, population,  MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
from coviddeaths
Group by Location, population
order by PercentPopulationInfected desc;

-- Showing Countries with the Highest Death Count per Population
-- Since total_deaths data type is _ we have to change it to an integer. In MySQL we use the cast function and we label it as SIGNED

Select Location, MAX(CAST(total_deaths as signed)) as TotalDeathCount
from coviddeaths
Where location NOT in ('World','Europe', 'North America', 'European Union', 'South America', 'Asia')
Group by Location
order by TotalDeathCount desc ;

-- Showing Continents with the Highest Death Count by Continent

Select continent, MAX(CAST(total_deaths as signed)) as TotalDeathCount
from coviddeaths
where continent not in ('world')
Group by continent
order by TotalDeathCount desc ;

-- Global Numbers:
-- Amount of new COVID cases everyday in the world, Amount of new COVID deaths everyday in the world and the percentage of deaths due to covid.
-- Amount of new COVID cases everyday in the world

Select date, SUM(new_cases) as CovidCasesGlobally, SUM(CAST(new_deaths as SIGNED)) as CovidDeathsGlobally, SUM(CAST(new_deaths as SIGNED))/SUM(new_cases)*100 as DeathPercentage
From coviddeaths
Group by date
order by 1,2;


-- Looking at Total Population vs Vaccinations

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as SIGNED)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
From coviddeaths dea
Join covidvaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3;

-- Using CTE to perform Calculation on Partition By in previous query

With PopvsVac(continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as SIGNED)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
From coviddeaths dea
Join covidvaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
-- order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac;

-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists PercentPopulationVaccinated;
Create table PercentPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
date numeric,
population numeric,
new_vaccinations numeric,
RollingPeopleVaccinated numeric
);

Insert into PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as SIGNED)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
From coviddeaths dea
Join covidvaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date ;
-- order by 2,3;

Select *, (RollingPeopleVaccinated/Population)*100
From PercentPopulationVaccinated;

-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as 
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as SIGNED)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
From coviddeaths dea
Join covidvaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date;
-- order by 2,3;

Select *
From PercentPopulationVaccinated
