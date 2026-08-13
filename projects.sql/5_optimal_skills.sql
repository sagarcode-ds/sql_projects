WITH skills_demand AS 
(SELECT s2.skill_id,s2.skills, COUNT(j.*) as job_count
FROM job_postings_fact j
INNER JOIN skills_job_dim s ON j.job_id = s.job_id
INNER JOIN skills_dim s2 ON s2.skill_id = s.skill_id
WHERE job_title_short = 'Data Analyst' 
AND job_work_from_home = TRUE
AND salary_year_avg IS NOT NULL
GROUP BY s2.skill_id,s2.skills
),

avg_salary_per_skill AS 
(SELECT s2.skill_id, s2.skills, ROUND(AVG(j.salary_year_avg), 0) as avg_salary 
FROM  job_postings_fact j
INNER JOIN skills_job_dim s ON s.job_id = j.job_id
INNER JOIN skills_dim s2 ON s2.skill_id = s.skill_id
WHERE j.salary_year_avg IS NOT NULL
AND j.job_title_short = 'Data Analyst'
AND job_work_from_home = TRUE
GROUP BY  s2.skills,s2.skill_id
)


SELECT s.skill_id, s.skills, s.job_count, a.avg_salary
FROM skills_demand s
INNER JOIN avg_salary_per_skill a
ON s.skill_id = a.skill_id
ORDER BY a.avg_salary DESC, s.job_count DESC
LIMIT 25
