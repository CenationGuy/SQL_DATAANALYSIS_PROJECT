--- PROB 2 IS WE HAVE TO FIND OUT THE  AVERAGE SALARY HOURLY YEARLY FOR A SPECIFIC JOB_SCHEDULE TYPE AFTER JUN E 1 

SELECT 
    job_schedule_type,
    AVG(salary_year_avg) AS salary_yearly,
    AVG(salary_hour_avg) AS salary_hourly,
    

FROM 
       job_postings_fact
WHERE 
        job_posted_date > '2023-06-01'  -- Ensure filtering correctly
GROUP BY 
        job_schedule_type;
