# Remote Data Engineer Skills: Demand vs. Salary

An exploratory SQL project that turns remote data engineering job postings into a practical view of **which skills employers request, what they pay, and where demand and compensation overlap**. The analysis uses DuckDB and the `data_jobs` dataset.

## At a glance

| Analysis | Question answered | Approach |
| --- | --- | --- |
| [01 · In-demand skills](01_top_demanded_skills.sql) | Which skills appear most often in remote Data Engineer postings? | Count postings by skill; return the top 10. |
| [02 · Highest-paying skills](02_top_paying_skills.sql) | Which skills have the highest median annual salary? | Compare median reported salary for skills with over 100 postings. |
| [03 · Demand + pay](03_optimal_skills.sql) | Which skills balance strong demand and compensation? | Rank by median salary weighted by the natural log of posting count. |

## A finding from the captured results

In the saved demand-query output, **SQL (29,221 postings)** and **Python (28,776)** lead the remote Data Engineer skill list. AWS (17,823), Azure (14,143), and Spark (12,799) follow, with Airflow, Snowflake, Databricks, Java, and GCP also in the top 10.

The demand figures above are preserved from a previous query run. The dataset is external and requires an active MotherDuck connection to reproduce; the salary and combined-ranking queries are included, but their result rows are not currently captured in this repository.

## How the analysis works

Each query connects job postings to their associated skills:

```text
job_postings_fact ── job_id ── skills_job_dim ── skill_id ── skills_dim
   role · remote · pay        posting-to-skill map             skill name
```

- All queries focus on `Data Engineer` roles marked as remote (`job_work_from_home = TRUE`).
- Salary comparisons ignore postings without a reported annual salary and require more than 100 qualifying postings per skill.
- The combined ranking uses `median_salary × LN(demand_count) / 1,000,000`. The logarithm tempers the effect of very high posting counts; the score is a comparison aid, not a salary figure.

## Run the queries

The SQL files expect a DuckDB connection with access to the external `data_jobs` database. The dataset is not stored in this repository.

```bash
duckdb md:data_jobs < 01_top_demanded_skills.sql
duckdb md:data_jobs < 02_top_paying_skills.sql
duckdb md:data_jobs < 03_optimal_skills.sql
```

You’ll need DuckDB, a working MotherDuck connection, and permission to access `data_jobs`. If the connection is unavailable, the scripts remain readable as standalone examples of the analysis logic.

## Skills demonstrated

DuckDB SQL · multi-table joins · filtering · grouped aggregations · median salary analysis · result thresholds · logarithmic scoring · translating a market question into reproducible queries

## Scope and limitations

This is a descriptive analysis of the available postings, not a forecast of future demand. Salary results reflect only postings with annual salary data, and the combined score depends on the chosen formula and threshold. The dataset and its date coverage are external to this repository.
