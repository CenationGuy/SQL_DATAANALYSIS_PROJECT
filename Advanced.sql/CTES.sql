--- based on company how many job counts are there 

WITH company_count AS (
   SELECT
    company_id,
    count(*) AS number_of_postings

   FROM
    job_postings_fact

   GROUP BY
    company_id )

SELECT 
     name, 
     number_of_postings
FROM company_dim
LEFT JOIN company_count
ON company_dim.company_id=company_count.company_id;

--- main querry