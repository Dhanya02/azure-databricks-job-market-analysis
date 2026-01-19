-- Azure Databricks Job Market Analysis (Databricks SQL)

-- 1) Preview raw data
SELECT * FROM job_market_sample LIMIT 10;

-- 2) Create clean table
CREATE OR REPLACE TABLE job_market_clean AS
SELECT DISTINCT
  TRIM(job_title) AS job_title,
  TRIM(company) AS company,
  TRIM(location) AS location,
  salary,
  TRIM(experience) AS experience,
  TRIM(skills) AS skills
FROM job_market_sample
WHERE job_title IS NOT NULL
  AND location IS NOT NULL;

-- 3) Top job roles
SELECT job_title, COUNT(*) AS total_jobs
FROM job_market_clean
GROUP BY job_title
ORDER BY total_jobs DESC;

-- 4) Top locations
SELECT location, COUNT(*) AS total_jobs
FROM job_market_clean
GROUP BY location
ORDER BY total_jobs DESC;

-- 5) Average salary by role
SELECT job_title, ROUND(AVG(salary),2) AS avg_salary
FROM job_market_clean
GROUP BY job_title
ORDER BY avg_salary DESC;

-- 6) Window function (salary ranking)
SELECT
  job_title,
  company,
  salary,
  RANK() OVER (PARTITION BY job_title ORDER BY salary DESC) AS salary_rank
FROM job_market_clean;
