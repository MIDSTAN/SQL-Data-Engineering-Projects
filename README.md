# SQL for Data Engineering

A hands-on SQL portfolio repository focused on exploring job-market data, building data warehouses, and transforming raw datasets into analytics-ready models.

This repository brings together practical SQL projects that demonstrate how data can move from raw source files to structured datasets that support reporting and analysis.

## Projects

| Project | Focus | What it demonstrates |
|---|---|---|
| [01 — Exploratory Data Analysis](Projects/1_EDA/) | Job-market analytics | Querying and exploring job-posting data to identify trends and insights. |
| [02 — Data Warehouse & Data Mart Build](Projects/2_WH_Mart_Build/) | Data warehouse development | Building an ETL workflow that transforms raw CSV data into a star schema and data marts. |
| [03 — Flat-to-Warehouse Build](Projects/3_Flat_to_WH_Build/) | Data modeling and transformation | Converting flat job-posting data into a normalized, analytics-ready star schema. |

> Project 03 is an additional project and may not be covered in the original course material.

## Skills & Concepts

- **SQL:** querying, filtering, joins, aggregations, subqueries, and data transformations
- **Exploratory Data Analysis:** investigating datasets and answering analytical questions
- **Data Warehousing:** designing structured analytical data models
- **Dimensional Modeling:** working with fact tables, dimension tables, and star schemas
- **ETL:** transforming raw CSV data into structured datasets
- **Data Marts:** organizing data for focused analytical use cases
- **DuckDB / MotherDuck:** querying and working with analytical datasets

## Tech Stack

- SQL
- DuckDB
- MotherDuck
- CSV datasets

## Repository Structure

```text
.
├── Projects/
│   ├── 1_EDA/
│   ├── 2_WH_Mart_Build/
│   └── 3_Flat_to_WH_Build/
└── Resources/
```

## Getting Started

You can run the SQL locally with DuckDB or use MotherDuck in the cloud.

### Option 1: MotherDuck (Cloud)

1. Create or sign in to a MotherDuck account.
2. Open MotherDuck Studio.
3. Attach the shared `data_jobs` database using the connection details available to you:

```sql
ATTACH 'md:_share/data_jobs/87603155-cdc7-4c80-85ad-3a6b0d760d93';
```

4. Run the SQL queries in the relevant project folders.

Access to the shared database may depend on the availability and permissions of the original share.

### Option 2: DuckDB (Local)

1. Install DuckDB by following the [official installation guide](https://duckdb.org/docs/stable/installation/).
2. Start the DuckDB CLI:

```bash
duckdb
```

3. If you are using the shared MotherDuck database, connect to it from your DuckDB session:

```sql
ATTACH 'md:_share/data_jobs/87603155-cdc7-4c80-85ad-3a6b0d760d93';
USE data_jobs;
```

4. Open the relevant project folder and follow its instructions to run the SQL files.

## Learning Outcomes

Through these projects, I am developing practical experience in:

- Turning business questions into SQL queries.
- Exploring real-world job-posting data.
- Joining and aggregating data across related tables.
- Designing fact and dimension tables.
- Transforming raw data into analytics-ready structures.
- Organizing data into warehouse and data-mart layers.

## Notes

- Project-specific setup instructions and SQL files are maintained in their respective folders.
- Update the database connection details if the shared MotherDuck database is no longer available.
- This repository is a learning and portfolio project. The README describes the work contained in the repository; it does not imply production deployment.

## Feedback

Suggestions and constructive feedback are welcome. If you spot an issue or have an idea for improving the SQL queries or data models, feel free to open an issue or submit a pull request.