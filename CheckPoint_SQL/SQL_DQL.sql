CREATE DATABASE Checkpoint_DQL;
GO
 
USE Checkpoint_DQL;
GO
-- creating Department table
CREATE TABLE Department (
Num_S INT PRIMARY KEY,
Label VARCHAR(255),
Manager_Name VARCHAR(255)
);

-- creating Employee table
CREATE TABLE  Employee (
Num_E INT PRIMARY KEY,
Name VARCHAR(255),
Position VARCHAR(255),
Salary DECIMAL(10, 2),
Department_Num_S INT,
FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S)
);

-- creating Project table
CREATE TABLE  Project(
Num_P INT PRIMARY KEY,
Title VARCHAR(255),
Start_Date DATE,
End_Date DATE,
Department_Num_S INT,
FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S)
);

-- creating Employee_Project table
CREATE TABLE Employee_Project(
Employee_Num_E INT,
FOREIGN KEY (Employee_Num_E) REFERENCES Employee(Num_E), 
Project_Num_P INT,
FOREIGN KEY (Project_Num_P) REFERENCES Project(Num_P), 
Role VARCHAR(255)
);

-- Inserting the informations in the tables
INSERT INTO Department(Num_S,Label,Manager_Name)
VALUES
(1,'IT','Alice Johnson'),
(2,'HR','Bob Smith'),
(3,'Marketing','Clara Bennett');


INSERT INTO Employee(Num_E,Name,Position,Salary,Department_Num_S)
VALUES
(101,'John Doe','Developer',60000.00,1),
(102,'Jane Smith','Analyst',55000.00,2),
(103,'Mike Brown','Designer',50000.00,3),
(104,'Sarah Johnson','Data Scientist',70000.00,1),
(105,'Emma Wilson','HR Specialist',52000.00,2);


INSERT INTO Project(Num_P,Title,Start_Date,End_Date,Department_Num_S)
VALUES
(201,'Website Redesign','2024-01-15','2024-06-30',1),
(202,'Employee Onboarding','2024-03-01','2024-09-01',2),
(203,'Market Research','2024-02-01','2024-07-31',3),
(204,'IT Infrastructure Setup','2024-04-01','2024-12-31',1);


INSERT INTO Employee_Project(Employee_Num_E,Project_Num_P,Role)
VALUES
(101,201,'Frontend Developer'),
(104,201,'Backend Developer'),
(102,202,'Trainer'),
(105,202,'Coordinator'),
(103,203,'Research Lead'),
(101,204,'Network Specialist');

--Updating the Employee_Project Table
UPDATE Employee_Project
SET 
	Role= 'Full Stack Developer'
WHERE Employee_Num_E = 101;

--Deletion of Num_E=101
DELETE FROM Employee_Project
WHERE Employee_Num_E = 103; 

DELETE FROM Employee
WHERE Num_E = 103;

SELECT * FROM Employee_Project;
GO
SELECT * FROM Employee;
GO


--Write a query to retrieve the names of employees who are assigned to more than one project, including the total number of projects for each employee.
SELECT e.Name, COUNT(ep.Project_Num_P) AS Total_Project
FROM Employee_Project AS ep
JOIN Employee AS e
ON ep.Employee_Num_E = e.Num_E
GROUP BY e.Name
HAVING COUNT(ep.Project_Num_P)>1;
GO

--Write a query to retrieve the list of projects managed by each department, including the department label and managerís name.
SELECT * FROM Department;
GO
SELECT * FROM Project;
GO


SELECT 
    p.Title,
    d.Label,
    d.Manager_Name
FROM Department AS d
JOIN Project AS p
  ON d.Num_S = p.Department_Num_S;
  GO

  --Write a query to retrieve the names of employees working on the project "Website Redesign," including their roles in the project.

SELECT * FROM Employee;
GO
SELECT * FROM Project;
GO

SELECT E.Name, P.Role
FROM Employee AS E
JOIN Employee_Project AS EP ON E.Num_E = EP.Employee_Num_E
JOIN Project AS P ON EP.Project_Num_P = P.Num_P
WHERE P.Title ='Website Redesign'
GO

--Write a query to retrieve the department with the highest number of employees, including the department label, manager name, and the total number of employees.
SELECT * FROM Employee;
GO
SELECT * FROM Department;
GO
--Count employees per department
SELECT Department_Num_S, COUNT(*) AS emp_count
FROM Employee
GROUP BY Department_Num_S;
GO
--Maximum count from that list
SELECT MAX(emp_count) AS max
FROM (SELECT Department_Num_S, COUNT(*) AS emp_count
FROM Employee
GROUP BY Department_Num_S) AS dept_counts;
GO


SELECT D.Label, D.Manager_Name, COUNT(E.Num_E) AS Total_Employees
FROM Department AS D
LEFT JOIN Employee AS E
ON E.Department_Num_S=D.Num_S
GROUP BY D.Label, D.Manager_Name
HAVING COUNT(E.Num_E) =(SELECT MAX(emp_count) AS Max
FROM (SELECT Department_Num_S, COUNT(*) AS emp_count
FROM Employee
GROUP BY Department_Num_S) AS dept_counts
);
GO

--Write a query to retrieve the names and positions of employees earning a salary greater than 60,000, including their department names.

SELECT E.Name, E.Position, D.Label
FROM Employee AS E
JOIN Department AS D
ON E.Department_Num_S= D.Num_S
WHERE E.Salary > 60000.00;
GO

--Write a query to retrieve the number of employees assigned to each project, including the project title.

SELECT P.Title, COUNT(EP.Employee_Num_E) AS Total_Employee
FROM Employee_Project AS EP
JOIN Project AS P
ON EP.Project_Num_P= P.Num_P
GROUP BY P.Title;
GO
--include projects that have zero employees assigned
SELECT P.Title, COUNT(EP.Employee_Num_E) AS Total_Employee
FROM Employee_Project AS EP
LEFT JOIN Project AS P
ON EP.Project_Num_P= P.Num_P
GROUP BY P.Title;
GO
--Write a query to retrieve a summary of roles employees have across different projects, including the employee name, project title, and role.

SELECT 
   EP.Role, P.Title, E.Name 
FROM Employee_Project AS EP 
  JOIN Project AS P 
    ON EP.Project_Num_P=P.Num_P 
  JOIN Employee AS E 
    ON EP.Employee_Num_E=E.Num_E
GO

--Write a query to retrieve the total salary expenditure for each department, including the department label and manager name.
SELECT 
    D.Label,D.Manager_Name,
    SUM(E.Salary) AS Total_Salary_Expenditure
FROM Employee AS E
JOIN Department AS D 
  ON E.Department_Num_S = D.Num_S
GROUP BY D.Label, D.Manager_Name;
GO

