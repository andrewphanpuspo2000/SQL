create database practice;

use practice;

CREATE TABLE CricketScores (
    MatchID INT,
    PlayerID INT,
    PlayerName VARCHAR(100),
    TeamName VARCHAR(50),
    Runs INT,
    BallsFaced INT,
    MatchDate DATE
);

INSERT INTO CricketScores (MatchID, PlayerID, PlayerName, TeamName, Runs, BallsFaced, MatchDate)
VALUES
(1, 101, 'Virat Kohli', 'India', 75, 52, '2024-02-10'),
(1, 102, 'Joe Root', 'England', 60, 45, '2024-02-10'),
(1, 103, 'Babar Azam', 'Pakistan', 85, 56, '2024-02-10'),
(1, 104, 'Steve Smith', 'Australia', 45, 38, '2024-02-10'),
(2, 101, 'Virat Kohli', 'India', 120, 65, '2024-02-12'),
(2, 102, 'Joe Root', 'England', 70, 50, '2024-02-12'),
(2, 103, 'Babar Azam', 'Pakistan', 90, 60, '2024-02-12'),
(2, 104, 'Steve Smith', 'Australia', 55, 42, '2024-02-12'),
(3, 101, 'Virat Kohli', 'India', 30, 25, '2024-02-15'),
(3, 102, 'Joe Root', 'England', 95, 70, '2024-02-15'),
(3, 103, 'Babar Azam', 'Pakistan', 110, 66, '2024-02-15'),
(3, 104, 'Steve Smith', 'Australia', 70, 50, '2024-02-15'),
(4, 101, 'Virat Kohli', 'India', 80, 45, '2024-02-18'),
(4, 102, 'Joe Root', 'England', 55, 40, '2024-02-18'),
(4, 103, 'Babar Azam', 'Pakistan', 95, 50, '2024-02-18'),
(4, 104, 'Steve Smith', 'Australia', 65, 48, '2024-02-18'),
(5, 101, 'Virat Kohli', 'India', 105, 52, '2024-02-20'),
(5, 102, 'Joe Root', 'England', 75, 45, '2024-02-20'),
(5, 103, 'Babar Azam', 'Pakistan', 85, 47, '2024-02-20'),
(5, 104, 'Steve Smith', 'Australia', 92, 50, '2024-02-20'),
(6, 105, 'Kane Williamson', 'New Zealand', 60, 42, '2024-02-22'),
(6, 106, 'David Warner', 'Australia', 45, 35, '2024-02-22'),
(6, 107, 'Rohit Sharma', 'India', 100, 55, '2024-02-22'),
(6, 108, 'Ben Stokes', 'England', 85, 50, '2024-02-22'),
(7, 105, 'Kane Williamson', 'New Zealand', 130, 70, '2024-02-25'),
(7, 106, 'David Warner', 'Australia', 90, 60, '2024-02-25'),
(7, 107, 'Rohit Sharma', 'India', 75, 45, '2024-02-25'),
(7, 108, 'Ben Stokes', 'England', 100, 55, '2024-02-25'),
(8, 109, 'Quinton de Kock', 'South Africa', 110, 65, '2024-02-28'),
(8, 110, 'Shubman Gill', 'India', 95, 50, '2024-02-28'),
(8, 111, 'Jos Buttler', 'England', 105, 55, '2024-02-28'),
(8, 112, 'Glenn Maxwell', 'Australia', 65, 45, '2024-02-28');


SELECT * from practice.CricketScores;

select cs1.playername,cs1.runs, row_number() over(order by runs desc) as rw_num from practice.CricketScores cs1;

select cs1.*, row_number() over(order by MatchDate desc,Runs desc) as rw_num from practice.CricketScores cs1;



CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'HR'),
(4, 'Engineering'),
(5, 'Finance');

CREATE TABLE employee_hiredate (
    id INT PRIMARY KEY,
    hire_date DATE NOT NULL
);

INSERT INTO employee_hiredate (id, hire_date) VALUES
(1, '2021-01-10'),
(2, '2021-05-15'),
(3, '2021-07-20'),
(4, '2021-09-12'),
(5, '2021-11-25'),
(6, '2022-01-01'),
(7, '2022-01-10'),
(8, '2022-06-15'),
(9, '2022-11-22'),
(10, '2023-01-10'),
(11, '2023-03-05'),
(12, '2023-07-19'),
(13, '2023-09-10'),
(14, '2024-02-15'),
(15, '2024-05-20'),
(16, '2024-07-30'),
(17, '2024-11-10');

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    job_title VARCHAR(50),
    salary DECIMAL(10, 2),
    hiredate_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (hiredate_id) REFERENCES employee_hiredate(id)
);

INSERT INTO employees (employee_id, employee_name, department_id, job_title, salary, hiredate_id) VALUES
(1, 'Arjun Sharma', 1, 'Sales Manager', 60000.00, 6),
(2, 'Emily Johnson', 2, 'Marketing Specialist', 75000.00, 7),
(3, 'Li Wei', 1, 'Sales Executive', 50000.00, 8),
(4, 'Takumi Tanaka', 3, 'HR Manager', 65000.00, 9),
(5, 'Amir Khan', 2, 'Marketing Executive', 70000.00, 10),
(6, 'Namrata Giri', 3, 'Recruiter', 72000.00, 11),
(7, 'David Thompson', 1, 'Sales Coordinator', 55000.00, 12),
(8, 'Ashley Brown', 2, 'Digital Marketer', 78000.00, 13),
(9, 'Brian O Connor', 3, 'HR Assistant', 62000.00, 14),
(10, 'Rachel Taylor', 1, 'Sales Analyst', 59000.00, 15),
(11, 'Ali Hussain', 2, 'Marketing Analyst', 71000.00, 16),
(12, 'Lisa Wang', 3, 'HR Executive', 73000.00, 17),
(13, 'Kevin Park', 1, 'Sales Specialist', 68000.00, 6),
(14, 'Olivia Smith', 2, 'Campaign Manager', 76000.00, 7),
(15, 'Harpreet Singh', 3, 'HR Coordinator', 75000.00, 8),
(16, 'Daniel Kim', 1, 'Key Account Manager', 64000.00, 9),
(17, 'Fatima Begum', 2, 'Content Strategist', 79000.00, 10),
(18, 'Chris Patel', 3, 'HR Consultant', 67000.00, 11),
(19, 'Stephanie Nguyen', 1, 'Sales Trainer', 63000.00, 12),
(20, 'Andrew Wilson', 2, 'Product Manager', 74000.00, 13),
(21, 'Yuna Matsumoto', 3, 'Recruitment Specialist', 76000.00, 14),
(22, 'Jacob Johnson', 1, 'Sales Representative', 69000.00, 15),
(23, 'Hyejin Park', 2, 'SEO Expert', 78000.00, 16),
(24, 'Sungjae Kim', 3, 'HR Advisor', 74000.00, 17),
(25, 'Eric Chen', 1, 'Sales Strategist', 65000.00, 6),
(26, 'Jennifer Lopez', 2, 'Copywriter', 72000.00, 7),
(27, 'Joon Park', 3, 'HR Manager', 70000.00, 8),
(28, 'Amandeep Kaur', 1, 'Sales Planner', 66000.00, 9),
(29, 'Jayden Taylor', 2, 'Creative Director', 75000.00, 10),
(30, 'Jane Yadav', 3, 'HR Specialist', 73000.00, 11),
(31, 'Brian Singh', 1, 'Sales Engineer', 67000.00, 12),
(32, 'Eunji Lee', 2, 'Brand Manager', 76000.00, 13),
(33, 'Junho Kim', 3, 'HR Generalist', 78000.00, 14),
(34, 'David Kim', 1, 'Sales Consultant', 62000.00, 15),
(35, 'Sora Mehta', 2, 'Media Buyer', 73000.00, 16),
(36, 'Minho Das', 3, 'HR Partner', 72000.00, 17),
(37, 'Hyunji Roy', 1, 'Sales Architect', 65000.00, 6),
(38, 'Yongsu Singh', 2, 'Marketing Architect', 74000.00, 7),
(39, 'Heeju Gupta', 3, 'HR Analyst', 71000.00, 8),
(40, 'Daniel Khan', 1, 'Sales Designer', 68000.00, 9),
(41, 'Madhur Mehta', NULL, 'Consultant', 150000.00, 13),
(42, 'Biraj Giri', NULL, 'Advisor', 120000.00, 17);

/*
IMPORTANT QUERY:
- FROM
- JOIN
- ON
- WHERE
- GROUP BY
- HAVING
- SELECT
- ORDER BY
- LIMIT 
- OFFSET
*/

-- List all employees along with their department name and hire date.

select e1.employee_name,d.department_name,hd.hire_date, row_number() over()
from practice.employees e1
inner join practice.departments d on e1.department_id=d.department_id
inner join practice.employee_hiredate hd on e1.hiredate_id= hd.id;

-- Retrieve all employees who belong to a department, have a salary greater than $50,000, and were hired after January 1, 2022.

select e1.employee_name,e1.salary,d.department_name,hd.hire_date, row_number() over()
from practice.employees e1
inner join practice.departments d on e1.department_id=d.department_id
inner join practice.employee_hiredate hd on e1.hiredate_id= hd.id
where e1.salary>50000 and hd.hire_date>"2022-01-01" ;

-- Find the department name and the number of employees in each department,
-- including departments with no employees, and show the hire date of the first employee hired.

select d1.department_name, count(e1.employee_id) as number_of_employee,min(hd.hire_date) as first_hired
from practice.employees e1
left join practice.departments d1 on e1.department_id=d1.department_id
left join practice.employee_hiredate hd on e1.hiredate_id= hd.id
group by d1.department_name;

-- List all employees and their departments, but exclude those who do not belong to any department and show their hire date.

select e1.employee_name,e1.department_id, d1.department_name, hd.hire_date,row_number() over()
from practice.employees e1
inner join practice.departments d1 on e1.department_id=d1.department_id
inner join practice.employee_hiredate hd on e1.hiredate_id= hd.id;
