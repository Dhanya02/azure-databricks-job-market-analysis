# Azure Databricks Job Market Analysis

## Project Overview
This project analyzes a job market dataset using **Databricks SQL**.  
The dataset was uploaded into Databricks, cleaned using SQL transformations, and analyzed using complex SQL queries.

## Tech Stack
Azure Databricks (Databricks SQL)
SQL (CTE, Aggregations, Window Functions)
Databricks SQL Visualizations

## Dataset Columns
job_title
company
location
salary
experience
skills

## Key Tasks Performed
Uploaded CSV file and created a managed table in Databricks Catalog
  Cleaned data using SQL functions (TRIM, DISTINCT, filtering)
  Created a curated table for analysis (`job_market_clean`)
  Performed analysis using:
  GROUP BY + COUNT
    CTE (Common Table Expressions)
    Window Functions (RANK)

## SQL Queries

### Create Clean Table
```sql```
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

