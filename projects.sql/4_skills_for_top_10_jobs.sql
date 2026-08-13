SELECT s2.skills, ROUND(AVG(j.salary_year_avg), 0) as avg_salary 
FROM  job_postings_fact j
INNER JOIN skills_job_dim s ON s.job_id = j.job_id
INNER JOIN skills_dim s2 ON s2.skill_id = s.skill_id
WHERE j.salary_year_avg IS NOT NULL
AND j.job_title_short = 'Data Analyst'
AND job_work_from_home = TRUE
GROUP BY  s2.skills
ORDER BY avg_salary DESC LIMIT 25
