SELECT *

FROM


(SELECT *
FROM jan_jobs

UNION

SELECT *
FROM feb_jobs

UNION

SELECT *
FROM march_jobs) AS quarterly_jobs

WHERE salary_year_avg > 70000 AND
job_title_short = 'Data Analyst'

ORDER BY
salary_year_avg;