SELECT 
    job_id,
    job_title_short,
    salary_year_avg,
    company_id
FROM job_postings_fact
LIMIT 10;

/*
Output: The 10 returned job rows were not captured in the project files.
Key insight: These columns connect each posting to its title, compensation,
and company; LIMIT keeps the initial inspection small.
*/

SELECT
    *
FROM
    company_dim
WHERE
    name IN ('Facebook', 'Meta')
LIMIT 10;

/*
Output: The matching Facebook/Meta company rows were not captured.
Key insight: IN checks several candidate company names in one filter.
*/

SELECT 
    *
FROM
    skills_job_dim
LIMIT 5;

/*
Output: The five job-to-skill mapping rows were not captured.
Key insight: This bridge table links postings to skills through job_id and skill_id.
*/

SELECT 
    *
FROM
    skills_dim
LIMIT 5;

/*
Output: The five skill lookup rows were not captured.
Key insight: skills_dim maps each skill_id to a readable skill name and type.
*/

SELECT 
    *
FROM information_schema.tables
WHERE
    table_catalog = 'data_jobs';

/*
Output: The information_schema.tables rows were not captured.
Key insight: Catalog metadata can confirm which relations belong to data_jobs.
*/

SELECT 
    *
FROM information_schema.columns
WHERE
    table_catalog = 'data_jobs';

/*
Output: The information_schema.columns rows were not captured.
Key insight: Column metadata exposes names and types without sampling table data.
*/


SELECT 
    *
FROM information_schema.table_constraints
WHERE
    table_catalog = 'data_jobs';

/*
Output: The information_schema.table_constraints rows were not captured.
Key insight: Constraint metadata helps inspect declared integrity rules.
*/


SELECT 
    *
FROM information_schema.key_column_usage
WHERE
    table_catalog = 'data_jobs';

/*
Output: The information_schema.key_column_usage rows were not captured.
Key insight: Key-column metadata helps trace primary and foreign-key structure.
*/

PRAGMA show_tables;

/*
Output: Not captured as a query result. The available schema snapshot shows
company_dim, job_postings_fact, skills_dim, and skills_job_dim in data_jobs.
Key insight: Listing tables is a quick way to orient yourself in a new database.
*/

DESCRIBE job_postings_fact;

/*
Output: A schema snapshot records these job_postings_fact columns and types:
job_id INTEGER, company_id INTEGER, job_title_short VARCHAR, job_title VARCHAR,
job_location VARCHAR, job_via VARCHAR, job_schedule_type VARCHAR,
job_work_from_home BOOLEAN, search_location VARCHAR, job_posted_date TIMESTAMP,
job_no_degree_mention BOOLEAN, job_health_insurance BOOLEAN, job_country VARCHAR,
salary_rate VARCHAR, salary_year_avg DOUBLE, salary_hour_avg DOUBLE.

Key insight: DESCRIBE makes the table's available fields and data types explicit
before you build filters, joins, or aggregations.
*/
