# 1.10 · Data Modeling

The exercises inspect job, company, and skill tables, then explore database metadata and table structure.

```text
┌───────────────────────┐
│ job_postings_fact     │
└──────┬─────────┬──────┘
       │         │
       ▼         ▼
┌─────────────┐ ┌──────────────────┐     ┌─────────────┐
│ company_dim │ │ skills_job_dim   │────▶│ skills_dim  │
└─────────────┘ └──────────────────┘     └─────────────┘
```

Script: [`1.10_Data_Modeling.sql`](1.10_Data_Modeling.sql)

The file includes sample row inspections plus metadata queries for tables, columns, constraints, keys, and the `job_postings_fact` schema.
