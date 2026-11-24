# 1.12 · Query Execution

This lesson uses `EXPLAIN ANALYZE` to inspect a grouped query over U.S. job postings and companies.

```text
┌──────────────────────────┐
│ Filter: U.S. postings    │
└────────────┬─────────────┘
             ▼
┌──────────────────────────┐
│ Join companies           │
└────────────┬─────────────┘
             ▼
┌──────────────────────────┐
│ Group · count · threshold│
└────────────┬─────────────┘
             ▼
┌──────────────────────────┐
│ EXPLAIN ANALYZE plan     │
└──────────────────────────┘
```

Script: [`1.12_Order_Execution.sql`](1.12_Order_Execution.sql)
