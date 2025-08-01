# 📊 Project and Task Management SQL Analytics

This SQL-based project simulates a real-world scenario of managing and analyzing data for a company handling multiple projects, team members, and their tasks. It focuses on practical database design and advanced SQL querying using realistic business logic.

---

## 🧱 Database Schema

### 🗂️ Tables Created:

#### ✅ Projects
- `project_id`
- `project_name`
- `project_start`
- `proj_completion`
- `team_id`
- `fund`

#### ✅ Tasks
- `task_id`
- `project_id`
- `assigned_to`
- `task_name`
- `deadline`
- `status`

#### ✅ Teams
- `member_id`
- `team_id`
- `names`
- `roles`
- `email`
- `location`

#### ✅ Model_Training
- `training_id`
- `project_id`
- `model_name`
- `accuracy`
- `training_date`

#### ✅ Data_Sets
- `dataset_id`
- `project_id`
- `dataset_name`
- `size_gb`
- `last_updated`

---

## 🧠 SQL Concepts Demonstrated

- **CTEs** (Common Table Expressions)
- **Window Functions** (`RANK()`, `ROW_NUMBER()`, `COUNT() OVER`)
- **Correlated Subqueries**
- **Aggregations with CASE & Filtering**
- **Subqueries in SELECT and WHERE**
- **Date-based Conditions using `CURRENT_DATE + INTERVAL`**
- **Foreign Key Relationships**

---

## 🔍 Query Highlights

1. **Project Task Summary using CTE**  
   Shows project name along with total tasks and completed tasks using a `WITH` clause.

2. **Top 2 Most Active Team Members**  
   Uses `ROW_NUMBER()` to identify the top 2 members with the most tasks assigned.

3. **Tasks Due Earlier than the Project’s Average Due Date**  
   A correlated subquery filters tasks that are due before their project’s average.

4. **Project with Maximum Budget**  
   A simple subquery returns the highest-budget project.

5. **Completed Task Percentage per Project**  
   Calculates the percentage of tasks marked 'Completed' for each project.

6. **Task Count per Team Member (Window Function)**  
   Uses `COUNT() OVER (PARTITION BY assigned_to)` to show task load.

7. **Pending Tasks for Team Leads (Due Soon)**  
   Combines join + filters for `role = 'Team Lead'` with due date in next 15 days.

8. **Projects with No Tasks Assigned**  
   Uses `LEFT JOIN` and `IS NULL` to find unassigned projects.

9. **Best Performing AI Model per Project**  
   Ranks AI models by accuracy and returns the top one per project.

10. **Projects with Large Datasets Updated Recently**  
    Filters datasets over 10 GB updated in the last 30 days.

---

## ▶️ How to Use

1. Open a SQL environment (e.g., **MySQL Workbench**, **SQLite**).
2. Run the following scripts in order:
- Create and Insert:
  - `Projects`
  - `Tasks`
  - `Teams`
- Run Queries 1–8.
- Create and Insert:
  - `Model_Training`
  - `Data_Sets`
- Run Queries 9–10.

---

## 🧪 Sample Outputs

### 1. 📌 Project Task Summary

| project_name             | total_tasks | completed_tasks |
|--------------------------|-------------|------------------|
| Sales Dashboard          | 2           | 1                |
| HR Automation Tool       | 2           | 1                |
| Mobile Tracker           | 2           | 0                |

---

### 2. 👥 Top Assigned Team Members

| member_name   | task_count |
|---------------|------------|
| Ravi          | 5          |
| Roy           | 3          |

---

### 3. 🧠 Best Performing AI Model

| project_name            | model_name      | accuracy |
|-------------------------|-----------------|----------|
| Sales Dashboard         | PredictPro      | 93.00    |
| E-commerce Remodel      | RecommenderAI   | 93.50    |

---

### 4. 💾 Large and Fresh Datasets

| project_name               |
|----------------------------|
| Mobile Tracker             |
| E-commerce Remodel         |

---

## 📌 Note

This assignment demonstrates a complete end-to-end understanding of:
- Database schema design
- Relational modeling with keys
- Advanced querying for business insights

It was completed as part of my internship to apply real-world analytics on simulated organizational data.
