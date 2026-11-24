SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf
LEFT JOIN 
    company_dim as cd
ON
    jpf.company_id = cd.company_id
LIMIT 10;

/*
Output: The first 10 left-join rows were not captured.
Key insight: LEFT JOIN preserves every job posting; company columns are NULL
when a posting has no matching company_id.
*/


SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf
RIGHT JOIN 
    company_dim as cd
ON
    jpf.company_id = cd.company_id
LIMIT 10;

/*
Output: The first 10 right-join rows were not captured.
Key insight: RIGHT JOIN preserves every company row, including companies with
no matching posting; posting columns are NULL for those rows.
*/


SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf
INNER JOIN 
    company_dim as cd
ON
    jpf.company_id = cd.company_id
LIMIT 10;

/*
Output: The first 10 inner-join rows were not captured.
Key insight: INNER JOIN keeps only postings whose company_id matches a company.
*/


SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf
FULL OUTER JOIN 
    company_dim as cd
ON
    jpf.company_id = cd.company_id
LIMIT 10;

/*
Output: The first 10 full-outer-join rows were not captured.
Key insight: FULL OUTER JOIN retains unmatched rows from both tables and fills
the missing side with NULLs.
*/


SELECT
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM
    job_postings_fact AS jpf
INNER JOIN 
    skills_job_dim AS sjd
ON
    jpf.job_id = sjd.job_id
INNER JOIN
    skills_dim AS sd
ON 
    sjd.skill_id = sd.skill_id;

/*
Output: The joined job and skill rows were not captured; the query has no LIMIT.
Key insight: Joining through skills_job_dim connects each posting to readable
skill names in skills_dim. A job can appear on multiple rows when it has
multiple associated skills.
*/
