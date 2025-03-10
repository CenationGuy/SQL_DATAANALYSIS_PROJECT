
WITH remote_jobs_skills AS
(SELECT
  
  skills_job_dim.skill_id ,
  COUNT (*) AS skills_count

FROM skills_job_dim
INNER JOIN job_postings_fact
ON skills_job_dim.job_id= job_postings_fact.job_id

WHERE job_postings_fact.job_work_from_home = TRUE AND
job_title_short = 'Data Analyst'

GROUP BY 
  skill_id 
)

SELECT remote_jobs_skills.skill_id, skills_dim.skills,remote_jobs_skills.skills_count
FROM skills_dim
INNER JOIN remote_jobs_skills
ON skills_dim.skill_id=remote_jobs_skills.skill_id
ORDER BY skills_count DESC
LIMIT 5;
