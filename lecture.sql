ALTER TABLE job_applied
ADD contact VARCHAR(20);

SELECT * FROM job_applied;

UPDATE job_applied
SET contact = 'sagar bhattarai'
WHERE job_id = 301;

UPDATE job_applied
SET contact = 'alice'
WHERE job_id = 302;

UPDATE job_applied
SET contact = 'bob'
WHERE job_id = 303;

UPDATE job_applied
SET contact = 'ram shankhar'
WHERE job_id = 304 ;


ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name

ALTER TABLE job_applied 
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact_name;


drop TABLE job_applied;


SELECT '2026-08-08'::DATE, 'true'::BOOLEAN

SELECT job_title_short, job_location, job_posted_date::DATE
FROM job_postings_fact;

SELECT job_title_short, job_location, 
job_posted_date AT TIME ZONE 'utc' AT TIME ZONE 'est',
EXTRACT(MONTH FROM job_posted_date) as date_month,
EXTRACT(YEAR FROM job_posted_date) as date_year
FROM job_postings_fact;


SELECT EXTRACT(MONTH FROM job_posted_date) as date_month,count(job_id) 
FROM job_postings_fact 
WHERE job_title_short = 'Data Analyst'
GROUP BY date_month
ORDER BY count(job_id) DESC;

-- practice problem 1 solution
SELECT job_schedule_type, AVG(salary_year_avg) as average_yearly_salary, 
AVG(salary_hour_avg) as average_hourly_salary
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
GROUP BY job_schedule_type;

-- practice problem 2 solution
SELECT EXTRACT(MONTH FROM (job_posted_date AT TIME ZONE 'utc' AT TIME ZONE 'America/New_York')) as date_month, 
COUNT(job_id) as no_of_job_postings
FROM job_postings_fact
WHERE EXTRACT(YEAR FROM job_posted_date) = '2023'
GROUP BY date_month
ORDER BY date_month;

-- practice problem 3 solution
SELECT c.company_id, c.name, j.job_posted_date FROM job_postings_fact j
INNER JOIN company_dim c
ON j.company_id = c.company_id
WHERE EXTRACT(QUARTER FROM job_posted_date) = 2
AND EXTRACT(YEAR FROM job_posted_date) = 2023
AND job_health_insurance = TRUE;


CREATE TABLE january_jobs as 
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1


-- Create a table containing only jobs posted in February
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;


-- Create a table containing only jobs posted in March
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT * FROM january_jobs ;