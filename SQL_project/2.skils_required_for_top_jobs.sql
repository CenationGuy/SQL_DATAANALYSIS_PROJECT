/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS(
SELECT
 job_id,
 job_title,
 job_schedule_type,
 salary_year_avg,
 company_dim.name

FROM  
  job_postings_fact
INNER JOIN company_dim
ON job_postings_fact.company_id=company_dim.company_id

WHERE
  job_title = 'Data Analyst' AND
  job_location = 'Anywhere' AND
  salary_year_avg IS NOT NULL

ORDER BY
  salary_year_avg DESC

LIMIT 10
)

SELECT 
   top_paying_jobs.*,
   skills_dim.skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim
ON skills_job_dim.job_id=top_paying_jobs.job_id
INNER JOIN skills_dim
ON skills_dim.skill_id=skills_job_dim.skill_id

ORDER BY 
   salary_year_avg DESC;

/* Skills Analysis for Highest-Paid Data Analyst Roles
The dataset contains the top 10 highest-paid Data Analyst job listings, along with their required skills. Below are key insights derived from the "Skills" column.

📌 Most In-Demand Skills
Python 🐍 - Mentioned in 7 listings, making it the most sought-after skill.
SQL 🗄️ - Required in 6 listings, reinforcing its importance in database management.
R 📊 - Featured in 5 listings, widely used for statistical analysis.*/

/*
[
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "name": "Plexus Resource Solutions",
    "skills": "python"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "name": "Plexus Resource Solutions",
    "skills": "mysql"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "name": "Plexus Resource Solutions",
    "skills": "aws"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "r"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "matlab"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "pandas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "151500.0",
    "name": "Get It Recruit - Healthcare",
    "skills": "sql"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "151500.0",
    "name": "Get It Recruit - Healthcare",
    "skills": "python"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "151500.0",
    "name": "Get It Recruit - Healthcare",
    "skills": "r"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "Level",
    "skills": "sql"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "Level",
    "skills": "python"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "Level",
    "skills": "r"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "Level",
    "skills": "golang"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "Level",
    "skills": "elasticsearch"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "Level",
    "skills": "aws"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "Level",
    "skills": "bigquery"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "Level",
    "skills": "gcp"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "Level",
    "skills": "pandas"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "Level",
    "skills": "scikit-learn"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "Level",
    "skills": "looker"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "Level",
    "skills": "kubernetes"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "CyberCoders",
    "skills": "python"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "CyberCoders",
    "skills": "java"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "CyberCoders",
    "skills": "r"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "CyberCoders",
    "skills": "javascript"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "CyberCoders",
    "skills": "c++"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "CyberCoders",
    "skills": "tableau"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "CyberCoders",
    "skills": "power bi"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "name": "CyberCoders",
    "skills": "qlik"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "140500.0",
    "name": "Uber",
    "skills": "sql"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "140500.0",
    "name": "Uber",
    "skills": "python"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "140500.0",
    "name": "Uber",
    "skills": "r"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "140500.0",
    "name": "Uber",
    "skills": "swift"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "140500.0",
    "name": "Uber",
    "skills": "excel"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "140500.0",
    "name": "Uber",
    "skills": "tableau"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "140500.0",
    "name": "Uber",
    "skills": "looker"
  },
  {
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "138500.0",
    "name": "Overmind",
    "skills": "sql"
  },
  {
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "138500.0",
    "name": "Overmind",
    "skills": "python"
  },
  {
    "job_id": 1326467,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "135000.0",
    "name": "EPIC Brokers",
    "skills": "excel"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "135000.0",
    "name": "InvestM Technology LLC",
    "skills": "sql"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "135000.0",
    "name": "InvestM Technology LLC",
    "skills": "excel"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "135000.0",
    "name": "InvestM Technology LLC",
    "skills": "power bi"
  }
]  */