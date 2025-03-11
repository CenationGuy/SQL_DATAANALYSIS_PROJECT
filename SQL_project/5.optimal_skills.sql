/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles



WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim  
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
    GROUP BY skills_dim.skill_id
    ORDER BY demand_count DESC
), 
average_sal AS (
    SELECT 
        skills_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS average_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL 
    GROUP BY skills_dim.skill_id
    ORDER BY average_salary DESC
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    average_sal.average_salary
FROM skills_demand
INNER JOIN average_sal 
    ON skills_demand.skill_id = average_sal.skill_id
WHERE 
    demand_count >10
ORDER BY 
    demand_count DESC,
    average_salary DESC
LIMIT 10;

-- rewriting this same query more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;


/* [
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "92628",
    "average_salary": "96435"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "67031",
    "average_salary": "86419"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "57326",
    "average_salary": "101512"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "46554",
    "average_salary": "97978"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "39468",
    "average_salary": "92324"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "30075",
    "average_salary": "98708"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "14034",
    "average_salary": "93707"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "14034",
    "average_salary": "93707"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "13848",
    "average_salary": "88316"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "13591",
    "average_salary": "82941"
  }
] */