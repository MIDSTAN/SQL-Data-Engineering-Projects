# 1.11 · Joins

This lesson compares how join types retain matching and non-matching rows, then connects job postings to companies and skills.

```text
┌────────────────────┐       join key       ┌─────────────────┐
│ job_postings_fact  │──company_id / job_id─│ company / skills│
└────────────────────┘                      └─────────────────┘
       │                                           │
       └── INNER · LEFT · RIGHT · FULL OUTER ─────┘
```

Script: [`1.11_JOINs.sql`](1.11_JOINs.sql)
