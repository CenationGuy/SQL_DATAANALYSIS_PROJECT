SELECT
   job_title_short,
   job_location,

    CASE
      WHEN job_location = 'Anywhere' THEN 'Remote'
      WHEN job_location = 'New York, NY' THEN 'Local'
      ELSE 'ONSITE'
    END AS location_Category

FROM
  job_postings_fact;