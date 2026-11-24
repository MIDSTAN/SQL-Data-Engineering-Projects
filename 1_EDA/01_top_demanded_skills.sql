/*
Question: Which skills appear most often in remote Data Engineer postings?
Method: Count job-skill associations and return the ten most frequent skills.
*/

SELECT
    COUNT(jpf.*) AS demand_count,
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
GROUP BY
    sd.skills
ORDER BY
    COUNT(jpf.*) DESC
LIMIT 10;


/*
Previously captured result:
| Skill      | Posting count |
|------------|--------------:|
| SQL        |        29,221 |
| Python     |        28,776 |
| AWS        |        17,823 |
| Azure      |        14,143 |
| Spark      |        12,799 |
| Airflow    |         9,996 |
| Snowflake  |         8,639 |
| Databricks |         8,183 |
| Java       |         7,267 |
| GCP        |         6,446 |

Key insight: SQL and Python lead the captured results, while cloud platforms
and data-processing tools make up much of the rest of the top 10.
*/
