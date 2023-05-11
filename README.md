# Data Analytics Project - COVID-19 Data Exploration

This project focuses on analyzing a big COVID-19 dataset using SQL queries to gain insights and understand various aspects of the pandemic. The project utilizes Python (pandas) and SQL skills such as joins, CTEs, temp tables, window functions, aggregate functions, creating views, and converting data types. The dataset includes information on COVID-19 cases, deaths, vaccinations, and population. Data visualization was created using Tableau.

Dashboard link here: https://us-west-2b.online.tableau.com/t/marcosgarcia/views/ExploringCOVID-19DatausingPythonandSQL/Dashboard1/93a85565-308f-46e9-8ea7-5b45653287bb/cc18ae83-9627-4e67-8953-1ee28d025a55

## Project Structure

The project consists of the following files

- `DataPreparation.ipynb`: Python code containing data cleaning and preparation
- `COVIDSQLAnalysis.sql`: SQL code containing queries for data exploration.
- `README.md`: Markdown file providing an overview of the project.

## Dataset

The project utilizes the following datasets:

- `coviddeaths`: Contains information on COVID-19 deaths, including location, date, total cases, new cases, total deaths, and population.
- `covidvaccinations`: Contains information on COVID-19 vaccinations, including location, date, and new vaccinations.

## Project Objectives

The main objectives of this data analytics project are as follows:

1. Explore and analyze the relationship between COVID-19 cases and deaths.
2. Determine the percentage of the population infected by COVID-19.
3. Identify countries with the highest infection rates and death counts.
4. Analyze COVID-19 statistics at the global level.
5. Investigate the correlation between population and vaccinations.

## Instructions

To run the SQL code and reproduce the analysis, follow these steps:

1. Ensure you have access to a database management system (DBMS) that supports SQL queries.
2. Import the `coviddeaths` and `covidvaccinations` datasets into your DBMS.
3. Open the `data_analytics.sql` file in your preferred SQL editor or DBMS interface.
4. Execute the SQL queries sequentially to obtain the desired results.

Please note that the specific steps and commands may vary depending on your DBMS and setup.

## Results and Findings

The results and findings of the data analytics project include:

- Analysis of the likelihood of dying if contracting COVID-19 in different countries.
- Calculation of the percentage of the population infected by COVID-19.
- Identification of countries with the highest infection rates and death counts.
- Insights into global COVID-19 cases, deaths, and death percentages.
- Examination of the correlation between population and vaccinations.

These findings provide valuable insights into the impact of COVID-19 and help understand the global scenario.

## Contributing

Contributions to the project are welcome! If you have any suggestions, improvements, or additional analyses to add, please feel free to submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

We would like to acknowledge the data sources used in this project:

- Edouard Mathieu, Hannah Ritchie, Lucas Rodés-Guirao, Cameron Appel, Charlie Giattino, Joe Hasell, Bobbie Macdonald, Saloni Dattani, Diana Beltekian, Esteban Ortiz-Ospina and Max Roser (2020) - "Coronavirus Pandemic (COVID-19)". Published online at OurWorldInData.org. Retrieved from: 'https://ourworldindata.org/coronavirus' [Online Resource]

Special thanks to the open-source community for providing the data and tools necessary for this analysis.

---
