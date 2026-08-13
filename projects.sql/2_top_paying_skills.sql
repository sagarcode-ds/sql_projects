
WITH top_paying_jobs AS
(SELECT job_id, job_title_short, company_id, 
job_posted_date, job_no_degree_mention, 
salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' 
AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC LIMIT 10)

SELECT t.job_id, t.job_title_short, s2.skills FROM top_paying_jobs t
INNER JOIN skills_job_dim s ON t.job_id = s.job_id
INNER JOIN skills_dim s2 ON s2.skill_id = s.skill_id
ORDER BY t.salary_year_avg DESC 