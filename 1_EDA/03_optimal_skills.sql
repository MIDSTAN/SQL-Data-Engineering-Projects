/*
Question: Which skills balance demand and median pay in remote Data Engineer postings?
Method: Rank skills with more than 100 salary-reporting postings by median salary
weighted by the natural logarithm of posting count.
*/


SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
    COUNT(jpf.*) AS demand_count,
    ROUND(LN(COUNT(jpf.*)),1) AS ln_demand_count,
    ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*))) / 1_000_000, 1) AS optimal_score
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
    COUNT(jpf.*) > 100
ORDER BY
    optimal_score DESC
LIMIT 10;


/*
Key insight: The logarithm compresses the contribution of posting volume, so
high demand still matters without increasing the score linearly. The score
combines demand and pay for comparison; it is not itself a salary. Result rows
are not yet captured and require access to the external `data_jobs` database.
*/
