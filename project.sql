-- q1
SELECT j.job_title_short, j.salary_year_avg, c.name as company 
FROM job_postings_fact j
INNER JOIN company_dim c ON j.company_id = c.company_id
WHERE job_title_short = 'Data Analyst' AND
job_work_from_home = TRUE
ORDER BY salary_year_avg DESC LIMIT 10

-- q2
with remote_data_analyst_jobs as
(SELECT j.job_id, j.job_title_short, j.salary_year_avg, c.name as company 
FROM job_postings_fact j
INNER JOIN company_dim c ON j.company_id = c.company_id
WHERE job_title_short = 'Data Analyst' AND
job_work_from_home = TRUE
ORDER BY salary_year_avg DESC LIMIT 10)

SELECT DISTINCT(s2.skills), r.job_title_short, r.salary_year_avg FROM skills_job_dim s
INNER JOIN remote_data_analyst_jobs r ON s.job_id = r.job_id
INNER JOIN skills_dim s2 ON s2.skill_id = s.skill_id
ORDER BY r.salary_year_avg DESC 

