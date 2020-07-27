SELECT * FROM suicidedata;
ALTER TABLE suicidedata ALTER COLUMN gdp_for_year TYPE BIGINT USING gdp_for_year::bigint;


SELECT country, SUM(suicides_no) AS suicides FROM suicidedata WHERE year = 2015 AND country IN (SELECT country FROM suicidedata WHERE year = 1985 GROUP BY country) GROUP BY country ORDER BY country;
SELECT country, SUM(suicides_no) AS suicides FROM suicidedata WHERE year = 1985 AND country IN (SELECT country FROM suicidedata WHERE year = 2015 GROUP BY country) GROUP BY country ORDER BY country;

SELECT generation, SUM(suicides_no) AS suicides FROM suicidedata GROUP BY generation ORDER BY suicides DESC;

SELECT age, SUM(suicides_no) AS suicides FROM suicidedata GROUP BY age ORDER BY suicides DESC;

SELECT country, SUM(suicides_no) AS suicides FROM suicidedata GROUP BY country ORDER By suicides DESC LIMIT 10;

SELECT country, SUM(suicidesper100pop) AS suicides_rates, MAX(gdp_per_capita) AS gdp_for_year FROM suicidedata GROUP BY year ORDER BY year;

-- Table for avg suicide rates and gdp per capita by country
SELECT country, AVG(derivedtable.suicide_rates) AS avg_rates, AVG(gdp_per_capita) AS avg_gdp_per_capita FROM (SELECT year, country, SUM(suicidesper100pop) AS suicide_rates, MAX(gdp_per_capita) AS gdp_per_capita FROM suicidedata GROUP BY year, country ORDER BY year) AS derivedTable GROUP BY country;

SELECT year, avg(gdp_for_year) AS avggdpper100pop, AVG(suicidesper100pop) FROM suicidedata GROUP BY year ORDER BY year;


ALTER TABLE suicidedata ALTER COLUMN hdi_for_year TYPE float USING hdi_for_year::float;
SELECT year, AVG(derivedTable.suicidesper100pop) AS suicide_rates, AVG(derivedTable.gdp_per_capita) AS gdp_per_capita
FROM (SELECT country,year,SUM(suicidesper100pop) AS suicidesper100pop,MAX(gdp_per_capita) AS gdp_per_capita FROM suicidedata WHERE hdi_for_year <>0 GROUP BY country,year)
AS derivedTable
GROUP BY year;