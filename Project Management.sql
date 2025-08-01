#   SQL ASSIGNMENT  -|
#   -----------------|
#   Project Management  -|
#   ---------------------|


#   Introduction  -|
#   This SQL assignment simulates a real-world company setup where projects, tasks, teams, models, and datasets
#   are tracked using SQL. The script demonstrates the creation of a project management schema with queries
#   covering CTEs, window functions, subqueries, aggregation, joins, and date operations.
#   The database consists of:
#     • Projects: Basic project info and budget
#     • Tasks: Assigned work per project
#     • Teams: Team member roles and identities
#     • Model_Training: AI model training per project
#     • Data_Sets: Dataset tracking for each project

CREATE DATABASE PROJECT;  -- creating a new database
USE PROJECT;			  -- using the database for further proceedings

#   Create the tables Projects, Tasks, and Teams
CREATE TABLE Projects(
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    project_start DATE,
    proj_completion DATE,
    team_id INT,
    fund DECIMAL(10, 2)
);						  -- creating table projects with columns id, name, start and end dates, team id and funds for projects.
						  -- the project id is primary key which will not accept any null or repeated values.

INSERT INTO Projects VALUES(701, 'Sales Dashboard', '2024-02-01', '2024-07-30', 2, 50000),
						   (702, 'E-commerce Remodel', '2024-03-01', '2024-08-15', 3, 120000),
                           (703, 'HR Automation Tool', '2024-01-15', '2024-05-30', 2, 65000),
                           (704, 'Employee Portal', '2024-04-05', '2024-09-10', 4, 72000),
                           (705, 'Mobile Tracker', '2024-06-10', '2024-10-01', 3, 85000),
                           (706, 'Data Pipeline Upgrade', '2024-05-15', '2024-11-30', 1, 99000),
                           (707, 'Customer Insights Engine', '2024-06-20', '2024-11-01', 4, 87500),
                           (708, 'Financial Forecast System', '2024-02-01', '2024-07-31', 1, 105000),
                           (709, 'Logistics AI Integration', '2024-03-25', '2024-08-30', 3, 115000),
                           (714, 'Inventory Management System', '2024-09-10', '2025-03-15', 3, 88000),
                           (715, 'Remote Work Analytics', '2024-07-25', '2024-12-31', 4, 92500);
						  -- inserting values in the Projects table


CREATE TABLE Tasks(
    task_id INT PRIMARY KEY,
    project_id INT,
    assigned_to INT,
    task_name VARCHAR(100),
    deadline DATE,
    status VARCHAR(20),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);						  -- creating table tasks with columns id, project id, name, assigned to, proj deadline and status.
						  -- the project id is foreign key which will be used for joining tables.

INSERT INTO Tasks VALUES(201, 702, 105, 'Setup Payment Gateway', '2024-06-10', 'Completed'),
						(202, 701, 103, 'Implement Charts', '2024-05-15', 'Pending'),
                        (203, 701, 104, 'Design UI Mockups', '2024-04-01', 'Completed'),
                        (204, 702, 106, 'Add Product Filters', '2024-06-20', 'Completed'),
                        (205, 703, 104, 'Form Automation Scripts', '2024-03-25', 'Pending'),
                        (206, 703, 103, 'HR Dashboard Build', '2024-04-20', 'Completed'),
                        (207, 704, 105, 'Create Login System', '2024-07-01', 'Pending'),
                        (208, 704, 102, 'Integrate Attendance API', '2024-08-10', 'Completed'),
                        (209, 705, 106, 'Setup Location Tracking', '2024-09-01', 'Pending'),
                        (210, 705, 105, 'Optimize Battery Usage', '2024-08-20', 'Pending'),
                        (211, 706, 112, 'Design ETL Pipeline', '2024-10-15', 'Completed'),
                        (212, 706, 102, 'Build Monitoring Scripts', '2024-11-10', 'Pending'),
                        (213, 707, 107, 'Survey Data Integration', '2024-08-01', 'Completed'),
                        (214, 708, 112, 'Forecast Algorithm Setup', '2024-06-05', 'Pending'),
                        (215, 709, 106, 'AI Model Deployment', '2024-07-25', 'Completed'),
                        (216, 708, 103, 'Review Forecast Results', '2025-08-05', 'Pending'),
                        (217, 709, 103, 'Client Feedback Integration', '2025-08-10', 'Pending'),
                        (218, 707, 103, 'Update Survey Logic', '2025-08-15', 'Pending');
						  -- inserting values in the Tasks table

CREATE TABLE Teams(
  member_id INT PRIMARY KEY,
  team_id INT,
  names VARCHAR(50),
  roles VARCHAR(50),
  email VARCHAR(100),
  location VARCHAR(100)
);						  -- creating table teams with columns id, member id, names, roles, emails and locations.
						  -- the member id is primary key which will not accept any null or repeated values.

INSERT INTO Teams VALUES(101, 1, 'Anita', 'Project Manager', 'anita67@company.com', 'Bangalore'),
						(103, 2, 'Ravi', 'Team Lead', 'ravi123@company.com', 'Hyderabad'),
                        (102, 1, 'Vikram', 'Developer', 'vikram.yadav@company.com', 'Delhi'),
                        (107, 4, 'Amit', 'DevOps Engineer', 'amit45@company.com', 'Pune'),
                        (104, 2, 'Priya', 'UI/QA Engineer', 'priya97das@company.com', 'Chennai'),
                        (105, 3, 'Roy', 'Backend Developer', 'nina00@company.com', 'Mumbai'),
                        (106, 3, 'Rajeev', 'AI Specialist', 'rajeev.singh@company.com', 'Noida'),
                        (108, 4, 'Sonal', 'Tester', 'mehra.sonal@company.com', 'Ahmedabad'),
                        (109, 1, 'Subham', 'UI/UX Designer', 'subham35@company.com', 'Kolkata'),
                        (110, 2, 'Deepak', 'QA Engineer', 'deepak.rathi@company.com', 'Chandigarh'),
                        (111, 3, 'Sen', 'DevOps Engineer', 'sen1246@company.com', 'Jaipur'),
                        (112, 4, 'Rohit', 'ETL & Forecast', 'rohit@company.com', 'Lucknow'),
                        (113, 2, 'Manish', 'Business Analyst', 'manishtiwari@company.com', 'Nagpur'),
                        (114, 1, 'Thomas', 'Product Owner', 'tina53.thomas@company.com', 'Gurgaon'),
                        (115, 3, 'Farhan', 'Tester', 'farhan0000@company.com', 'Indore');
						  -- inserting values in the Teams table


#   Query1. Using a CTE, find projects along with the number of tasks assigned and number of completed tasks.
#   Show project_name, total_tasks, completed_tasks.
WITH ProjectTaskStats AS (SELECT project_id, COUNT(*) AS total_tasks,
						  SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed_tasks FROM Tasks
                          GROUP BY project_id)
                          SELECT p.project_name, pts.total_tasks, pts.completed_tasks FROM Projects p
                          JOIN ProjectTaskStats pts ON p.project_id = pts.project_id;
						  -- WITH is Common Table Expression(CTE) that allows naming a temporary result set.
                          -- To count tasks per project used count().
                          -- Using conditional logic within sum() to only count the completed tasks.
                          -- Grouping rows by project_id using group by.
                          -- Combining Projects and CTE results using join on common column project_id.

#   Query2. Write a query to find the top 2 team members with the highest number of tasks assigned across all projects.
#   Use window functions (ROW_NUMBER() or RANK()).
SELECT * FROM (SELECT t.member_id, t.names, t.roles, COUNT(ts.task_id) AS task_count,
			   ROW_NUMBER() OVER (ORDER BY COUNT(ts.task_id) DESC) AS row_num
               FROM Teams t JOIN Tasks ts ON t.member_id = ts.assigned_to
               GROUP BY t.member_id, t.names, t.roles) ranked WHERE ranked.row_num <= 2;
						  -- Counting number of tasks assigned to each member using count().
                          -- To define window for the window function using over.
                          -- Sorting task count in descending order using order by.
                          -- ROW_NUMBER() assigns a unique rank by task count.
                          -- Grouping to aggregate task counts.
                          -- Filtering using where.

#   Query3. Using a correlated subquery, find tasks whose due_date is earlier than the average due_date of all tasks
#   in the same project.
SELECT DATE(FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(deadline)))) AS avg_due_date FROM Tasks;
						  -- Converts deadline to UNIX format (seconds).
                          -- Using avg to find the mean then converting to date format.
SELECT task_name, deadline FROM Tasks t1 WHERE deadline < (SELECT AVG(DATE(deadline)) FROM Tasks t2 WHERE t1.project_id = t2.project_id);
						  -- Calculating the average deadline of tasks while converting to DATE only and dropping time.
                          -- Filtering tasks where the deadline is earlier than calculated average in the sub-query.
                          -- Using correlation with where clause.

#   Query4. Find the project(s) with the maximum budget using a subquery.
SELECT * FROM Projects WHERE fund = (SELECT MAX(fund) FROM Projects);
						  -- Using sub-query to calculate the maximum fund value.
                          -- Max() for maximum value.

#   Query5. Write a query that returns the percentage of completed tasks per project. 
#   Use aggregate filtering or FILTER clause if supported.
SELECT p.project_name, COUNT(t.task_id) AS total_tasks,
					   SUM(CASE WHEN t.status = 'Completed' THEN 1 ELSE 0 END) AS completed_tasks,
                       ROUND(100.0 * SUM(CASE WHEN t.status = 'Completed' THEN 1 ELSE 0 END) / COUNT(t.task_id), 2) AS completed_percentage
                       FROM Projects p LEFT JOIN Tasks t ON p.project_id = t.project_id GROUP BY p.project_name;
						  -- For calculating total tasks per project using count.
                          -- Conditional logic for only completed values in the sum().
                          -- Using operations to calculate the percentage.
                          -- Using round() to round off to only 2 decimal places.
                          -- Left join to combine tables
                          -- Grouping based on project names.
                                                    
                          
#   Query6. Use a window function to show each task with its assigned_to, task_name, and the count of tasks
#   assigned to that person, ordered by assigned_to.
SELECT tm.names AS assigned_to, t.task_name, COUNT(*) OVER (PARTITION BY t.assigned_to) AS assigned_tasks_total
							    FROM Tasks t JOIN Teams tm ON t.assigned_to = tm.member_id ORDER BY t.assigned_to;
						  -- Defining the window scope for counting using over.
                          -- PARTITION BY used for reseting count per user.
                          -- Joining tables to get names from Teams.

#   Query7. Find all tasks assigned to team leads where the task is not completed and
#   due date is within the next 15 days from today.
SELECT t.* FROM Tasks t JOIN Teams tm ON t.assigned_to = tm.member_id WHERE tm.roles = 'Team Lead' AND t.status != 'Completed'
				AND t.deadline BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL 15 DAY;
						  -- Where clause for checking multiple conditions first the role to be team lead
                          -- second the task status to be not completed and deadline between a range.
                          -- CURRENT_DATE to get today’s date & to add 15 days to current date using + INTERVAL.


#   Query8. Write a query to list projects that have no tasks assigned yet (projects without any task records).
SELECT p.* FROM Projects p LEFT JOIN Tasks t ON p.project_id = t.project_id WHERE t.project_id IS NULL;
						  -- Using left join to keep all Projects records whether tasks exist or not.
                          -- Filtering projects without any tasks using is null with proj id.
                          

#   Query9. You have an to create additional table Model_Training (training_id, project_id, model_name,
#   accuracy, training_date). Write a query to list each project with its best(highest accuracy)
#   AI model name and accuracy. 
CREATE TABLE Model_Training(
    training_id INT PRIMARY KEY,
    project_id INT,
    model_name VARCHAR(100),
    accuracy DECIMAL(5,2),
    training_date DATE,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);						  -- creating table Model_Training with columns id, project id, name, accuracy and training date.
						  -- the project id is foreign key which will be used for joining tables.

INSERT INTO Model_Training VALUES(1, 701, 'TransformerX', 91.25, '2024-05-01'),
                                 (2, 702, 'RecommenderAI', 93.50, '2024-07-15'),
                                 (3, 709, 'LogiAI', 88.00, '2024-06-30'),
                                 (4, 703, 'VisionNetX', 92.10, '2024-07-01'),
                                 (5, 705, 'ChatPilot', 90.75, '2024-07-10'),
                                 (6, 704, 'TrendSeer', 87.50, '2024-07-25'),
                                 (7, 707, 'OptiRoute', 91.00, '2024-08-01'),
                                 (8, 702, 'MetaMatch', 92.35, '2024-08-02'),
                                 (9, 706, 'FraudDetectAI', 89.60, '2024-08-05'),
                                 (10, 703, 'AutoGrade', 90.10, '2024-08-07'),
                                 (11, 701, 'PredictPro', 93.00, '2024-08-10'),
                                 (12, 705, 'ClassiFy', 88.95, '2024-08-12');
						  -- inserting values into Model_Training table

SELECT mt.project_id, p.project_name, mt.model_name, mt.accuracy FROM Model_Training mt 
					  JOIN Projects p ON p.project_id = mt.project_id WHERE (mt.project_id, mt.accuracy)
                      IN (SELECT project_id, MAX(accuracy) FROM Model_Training GROUP BY project_id);
						  -- Joining tables Model_Training and Projects using project_id.
                          -- Using sub-query to find model with maximum accuracy for each project_id.
                          -- Filtering rows with the results of the sub-query.



#   Query10. You have to create additional table Data_Sets (dataset_id, project_id, dataset_name, size_gb, last_updated).
#   Write a query to find all projects with datasets larger than 10GB that were updated within the last 30 days.
CREATE TABLE Data_Sets(
    dataset_id INT PRIMARY KEY,
    project_id INT,
    dataset_name VARCHAR(100),
    size_gb DECIMAL(6,2),
    last_updated DATE,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);						  -- creating table Data_Sets with columns id, project id, name, size in gb and last updated.
						  -- the project id is foreign key which will be used for joining tables.

INSERT INTO Data_Sets VALUES(1, 701, 'Sales2024', 12.5, '2024-07-01'),
							(2, 703, 'HR_Data', 8.0, '2024-08-25'),
                            (3, 709, 'LogisticsData', 15.2, '2023-07-05'),
                            (4, 706, 'ETL_Archive', 11.0, '2024-06-20'),
                            (5, 705, 'Tracker_Logs', 13.8, '2025-07-10'),
                            (6, 702, 'Ecom_Analytics', 14.5, '2025-07-28');
						  -- inserting values into Data_Sets table

SELECT ds.project_id, p.project_name, ds.dataset_name, ds.size_gb, ds.last_updated FROM Data_Sets ds
					  JOIN Projects p ON ds.project_id = p.project_id WHERE ds.size_gb > 10
                      AND ds.last_updated >= CURRENT_DATE - INTERVAL 30 DAY;
						  -- Joining tables Data_Sets and Projects using project_id.
                          -- Using where clause to filter as size_gb > 10
                          -- also, CURRENT_DATE to get today’s date & to compute 30 days before today using
                          -- CURRENT_DATE - INTERVAL whose result is used to check for last updated within month.
                          

#   CONCLUSION  -|
#   -------------|
#   This assignment provided a comprehensive hands-on experience in working with relational databases in a
#   real-world project management scenario. It provided insights into advanced SQL capabilities including:
#      • Data modeling with relational table structures
#      • Joins and foreign key relationships
#      • Aggregate functions and conditional filtering
#      • Window functions like ROW_NUMBER and RANK
#      • Subqueries and date/time operations
#   Through these queries, I derived useful insights such as task completion rates, top performers, overdue tasks,
#   and resource allocation across projects.
#   This exercise enhanced my understanding of structured query design and how SQL can be used not just for data
#   retrieval but for meaningful decision-making.