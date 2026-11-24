SELECT 42 as answer;

/*
Output:
┌────────┐
│ answer │
├────────┤
│     42 │
└────────┘
1 row

Key insight: A scalar SELECT confirms that the SQL editor and connection can
execute a query without reading from a table.
*/
