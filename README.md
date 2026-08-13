# Data Analyst Job Market Analysis (SQL)

## Introduction

This project digs into the data analyst job market using SQL. The goal was to answer a practical question I had as someone building toward a data career: **which skills are actually worth learning first** — the ones that show up most often in job postings, and the ones tied to the highest salaries?

The repository contains five queries that build on each other, moving from "what does the best-paid job look like?" to "what skills should I prioritize learning?"

## Background

The data comes from a real-world dataset of job postings (job titles, salaries, locations, and the skills tied to each posting), used as the basis for a SQL learning project. Each query in this repo was written to answer one specific question:

1. What are the top-paying Data Analyst jobs?
2. What skills are required for those top-paying jobs?
3. What skills are most in demand for Data Analyst roles overall?
4. Which skills are associated with the highest average salaries?
5. Which skills are the "optimal" ones to learn — high demand **and** high pay?

The queries filter on remote ("Anywhere") Data Analyst postings so the comparison is apples-to-apples across companies and locations.

## Tools I Used

- **PostgreSQL** — the database engine the queries are written against (uses Postgres-specific syntax like `EXTRACT()`, `AT TIME ZONE`, and `::` type casting)
- **SQL** — CTEs, joins, aggregates, filtering, and sorting to explore the data
- **Git & GitHub** — version control and hosting this project
- *(Editor: VS Code with a SQL extension, or your preferred SQL client — swap this line if you used something else)*

## The Analysis

Each query lives in its own file under `projects.sql/`.

**1. Top Paying Jobs** (`1_top_paying_jobs.sql`)
Joins job postings to `company_dim` to pull the 10 highest-paying remote Data Analyst roles, along with company name and posting date.

**2. Skills for Top Paying Jobs** (`2_top_paying_skills.sql`)
Takes the top 10 jobs from query 1 as a CTE, then joins through `skills_job_dim` and `skills_dim` to see exactly which skills those specific high-paying roles ask for.

**3. Most In-Demand Skills** (`3_most_demanded_skills.sql`)
Steps back from just the top 10 and looks across *all* remote Data Analyst postings, counting how often each skill appears to rank overall demand.

**4. Top Paying Skills** (`4_top_paying_skills.sql`)
Instead of counting frequency, this ranks skills by the **average salary** of postings that mention them — surfacing skills that may be rarer but command a premium.

**5. Optimal Skills** (`5_optimal_skills.sql`)
Combines queries 3 and 4 into two CTEs joined on `skill_id`, so each skill shows both its demand (job count) and its average pay side by side. This is the query that actually answers "what should I learn next?" — the skills that score well on both dimensions, not just one.

## What I Learned

Working through this project helped me get comfortable with:

- **CTEs (`WITH` clauses)** — breaking a complex question into smaller, named, reusable pieces, and combining separate CTEs in a final join (query 5)
- **Multiple join types** — `INNER JOIN` for required matches vs. `LEFT JOIN` when a match (like a company name) shouldn't cause a row to disappear
- **Aggregation** — `COUNT()`, `AVG()`, and `ROUND()` together to summarize salary and demand data meaningfully
- **Filtering before and after aggregation** — using `WHERE` to narrow the raw rows and thinking about where a `HAVING` clause would matter (e.g., excluding skills with too few postings from skewing the "optimal skills" ranking)
- **Sorting and limiting results** to keep output focused on the most relevant rows (`ORDER BY ... LIMIT`)

## Conclusions

*This section is meant to hold the actual findings — the specific top-paying jobs, the specific skills that came out on top for demand vs. pay, and what that suggests about what to learn next. I haven't filled in numbers here since I don't have the query results in front of me — if you run these against the database and share the output, I can help write this section up with real figures instead of leaving it generic.*

A placeholder structure to fill in once you have results:

- **Top paying jobs:** what salary range and job titles topped query 1?
- **In-demand skills:** which 3–5 skills appeared most often in query 3?
- **High-paying skills:** which skills topped query 4, and were they surprising (niche/rare tools) or expected (core skills)?
- **Optimal skills:** where query 3 and query 4 overlapped in query 5 — these are the skills worth prioritizing first.
