EXPLAIN ANALYZE
SELECT
    cd.name as company_name,
    COUNT(jpf.*) AS posting_count
FROM 
    job_postings_fact AS jpf
LEFT JOIN
    company_dim as cd
ON
    jpf.company_id = cd.company_id
WHERE 
    jpf.job_country = 'United States'
GROUP BY 
    cd.name
HAVING
    COUNT(jpf.job_id) > 1000;

/*
Output: The EXPLAIN ANALYZE plan and measured timings were not captured.
Key insight: The query filters U.S. postings, joins company names, groups by
company, and retains groups with more than 1,000 postings. EXPLAIN ANALYZE
shows the physical operators and runtime for that work.
*/
