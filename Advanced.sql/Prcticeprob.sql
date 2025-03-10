-- i need to create tabels for all different months that will hold data regarding job for respected month
CREATE TABLE jan_jobs AS
   SELECT *
   FROM job_postings_fact
   WHERE
    EXTRACT(MONTH FROM job_posted_date)=1;


CREATE TABLE FEB_jobs AS
   SELECT *
   FROM job_postings_fact
   WHERE
    EXTRACT(MONTH FROM job_posted_date)=2;


CREATE TABLE MARCH_jobs AS
   SELECT *
   FROM job_postings_fact
   WHERE
    EXTRACT(MONTH FROM job_posted_date)=3;