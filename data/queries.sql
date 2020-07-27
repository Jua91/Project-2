-- Interactive choropleth map with hover – by city and suicide number
-- Line chart – number of suicides by age
-- Bar chart – Top 10 countries by number of suicides
-- Pie chart – Male vs Female suicide rate
-- Scatter plot – check for correlation between GDP and number of suicides
-- Scatter plot – Y- axis – beginning year of dataset, X-axis – ending year of our dataset

-- DROP TABLE suicidedata;
SELECT * FROM suicidedata;

-- ALTER COLUMN TYPE
ALTER TABLE suicidedata ALTER COLUMN gdp_for_year TYPE BIGINT USING gdp_for_year::bigint;

-- suicide number by age
SELECT age, SUM(suicides_no) AS suicides FROM suicidedata GROUP BY age ORDER BY suicides DESC;
-- suicide number by age group in 2016
SELECT age, SUM(suicides_no) AS suicides FROM suicidedata WHERE year = 2011 GROUP BY age ORDER BY suicides DESC;


-- suicide number by country
SELECT country, SUM(suicides_no) AS suicides FROM suicidedata GROUP BY country ORDER BY suicides DESC;
-- suicide number by country in 2016 and 1985
-- US doesnot have 2016 data
SELECT country, SUM(suicides_no) AS suicides FROM suicidedata WHERE year=2015 GROUP BY country ORDER BY suicides DESC;
SELECT country, SUM(suicides_no) AS suicides FROM suicidedata WHERE year=1985 GROUP BY country ORDER BY suicides DESC;


-- suicide number by generation
SELECT generation, SUM(suicides_no) AS suicides FROM suicide_data GROUP BY generation ORDER BY suicides DESC;


-- suicide number by gender
SELECT sex, SUM(suicides_no) AS suicides FROM suicidedata GROUP BY sex;
-- yearly suicide number by gender
SELECT sex,year, SUM(suicides_no) AS suicides FROM suicidedata GROUP BY sex, year ORDER BY year DESC;

