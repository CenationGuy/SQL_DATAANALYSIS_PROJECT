-- BASED ON MONTHS WE WILL SEE JOB POSTINGS

SELECT
  EXTRACT(MONTH FROM job_posted_date) as MONTHS_col,
  count(job_id) AS job_postings

FROM 
   job_postings_fact

WHERE 
     job_title_short = 'Data Analyst'

GROUP BY
    MONTHS_col

ORDER BY
    job_postings  DESC;