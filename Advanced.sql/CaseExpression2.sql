SELECT
  COUNT(job_id) as number_of_postings,

    CASE
      WHEN job_location = 'Anywhere' THEN 'Remote'
      WHEN job_location = 'New York, NY' THEN 'Local'
      ELSE 'ONSITE'
    END AS location_Category

FROM
  job_postings_fact

WHERE
  job_title_short = 'Data Engineer'

GROUP BY
   location_Category

