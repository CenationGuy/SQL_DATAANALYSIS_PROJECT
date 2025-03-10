SELECT 
      job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST',
      EXTRACT(MONTH FROM job_posted_date) AS month_column,
      EXTRACT(YEAR FROM job_posted_date) AS year_column
FROM  
    job_postings_fact

LIMIT 5;