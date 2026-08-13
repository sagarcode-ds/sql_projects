SELECT s2.skill_id,s2.skills, COUNT(j.*) as job_count
FROM job_postings_fact j
INNER JOIN skills_job_dim s ON j.job_id = s.job_id
INNER JOIN skills_dim s2 ON s2.skill_id = s.skill_id
WHERE job_title_short = 'Data Analyst' 
AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
GROUP BY s2.skill_id,s2.skills
ORDER BY job_count DESC