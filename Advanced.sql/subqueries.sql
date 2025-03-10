--- given use case we need to find the the companies who dont ask for degress




SELECT 
    name 
FROM 
    company_dim
WHERE
    company_id IN


     (SELECT 
      company_id

     FROM
      job_postings_fact

     WHERE
      job_no_degree_mention = TRUE );