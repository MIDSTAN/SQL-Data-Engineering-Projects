/*
Question: Which skills have the highest median annual pay in remote Data Engineer postings?
Method: Compare skills with more than 100 postings that include an annual salary.
*/

SELECT
    COUNT(jpf.*) AS demand_count,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
    sd.skills
FROM
    job_postings_fact as jpf
INNER JOIN
    skills_job_dim as sjd
    ON
    jpf.job_id = sjd.job_id
INNER JOIN 
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer'
    AND 
    jpf.job_work_from_home = True
    AND
    jpf.salary_year_avg IS NOT NULL
GROUP BY
    sd.skills
HAVING
    demand_count > 100
ORDER BY
    ROUND(MEDIAN(jpf.salary_year_avg),0) DESC
LIMIT 10;

/*
Key insight: Median salary is less affected by unusually high or low listings
than the mean. The 100-posting cutoff also keeps skills with very small samples
out of the comparison. This query's result rows are not yet captured; run it
with access to the external `data_jobs` database to see the ranking.
*/
