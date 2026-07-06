-- CREATE DATABASE

CREATE DATABASE Services_Australia;

USE Services_Australia;

-- CREATING TABLE

CREATE TABLE hospital(
   id INT PRIMARY KEY,
   doctor varchar(50) NOT NULL,
   patient varchar(50) NOT NULL,
   age INT NOT NULL,
   appointment_date DATE NOT NULL,
   insurance varchar(50) NOT NULL,
   bill decimal(10,2) NOT NULL,
   diagnosis varchar(50) NOT NULL
);

DROP TABLE hospital;

-- Inserting data
INSERT INTO hospital(id, doctor, patient, age, appointment_date,insurance,bill,diagnosis) values 
(1, 'Dr. Johann Muller', 'Nima Sherpa', 45, '2023-02-15', 'Aetna', 1500.00, 'Diabetes'),
(2, 'Dr. Michael Bauer', 'Shita Rai', 25, '2022-02-10', 'Blue Cross', 500.00, 'Flu'),
(3, 'Dr. Emily Carter', 'John Smith', 38, '2023-03-12', 'Cigna', 1200.00, 'Hypertension'),
(4, 'Dr. Sarah Wilson', 'Emma Johnson', 29, '2023-04-05', 'UnitedHealth', 850.00, 'Asthma'),
(5, 'Dr. David Lee', 'Michael Brown', 51, '2023-05-18', 'Aetna', 2300.00, 'Heart Disease'),
(6, 'Dr. Olivia White', 'Sophia Davis', 33, '2022-06-20', 'Blue Cross', 950.00, 'Migraine'),
(7, 'Dr. James Anderson', 'William Garcia', 47, '2022-07-11', 'Cigna', 1800.00, 'Arthritis'),
(8, 'Dr. Maria Gonzalez', 'Isabella Martinez', 41, '2022-08-09', 'Humana', 1450.00, 'Pneumonia'),
(9, 'Dr. Robert King', 'Daniel Rodriguez', 60, '2023-09-01', 'Medicare', 2700.00, 'Kidney Stones'),
(10, 'Dr. Linda Scott', 'Mia Hernandez', 22, '2023-09-25', 'UnitedHealth', 400.00, 'Flu'),
(11, 'Dr. Kevin Harris', 'Ethan Clark', 55, '2022-10-14', 'Aetna', 3200.00, 'Cancer'),
(12, 'Dr. Rachel Adams', 'Charlotte Lewis', 31, '2023-11-03', 'Humana', 700.00, 'Anemia'),
(13, 'Dr. Brian Walker', 'Lucas Hall', 44, '2022-11-19', 'Blue Cross', 1600.00, 'Back Pain'),
(14, 'Dr. Jennifer Young', 'Amelia Allen', 36, '2023-12-08', 'Cigna', 980.00, 'Thyroid Disorder'),
(15, 'Dr. Christopher Green', 'Benjamin Wright', 49, '2022-12-21', 'Medicare', 2100.00, 'High Cholesterol');


-- Select command
SELECT * 
FROM services_australia.hospital;


-- where clause
-- Write a SQL to find all patients who are having bill amount greater than $500
SELECT patient,age,bill,diagnosis
FROM services_australia.hospital 
WHERE bill>1000;

-- where clause
-- write a SQL to find all patients name who are diagnosed with "flu"
SELECT patient,diagnosis
from services_australia.hospital
where diagnosis="flu";

/* write a SQL to find all patients name along with 
their doctor who are diagnosed with "flu" or "Hypertension" */
SELECT patient,diagnosis,doctor
from services_australia.hospital
WHERE diagnosis IN ("Flu","Hypertension");

/*
write a SQL to organise all patients with respect to their age in decending order 
*/
-- ORDER BY clause

SELECT * 
from services_australia.hospital
ORDER BY age DESC;

/*
write a SQL to organise all patients with respect to their age in decending order and above 40 
*/
-- ORDER BY clause

SELECT * 
from services_australia.hospital
WHERE age>40
ORDER BY age DESC;

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

-- first option
-- write sql query to find top 6 patients by their bill amount who have appointment date in year 2023
select patient,bill
from services_australia.hospital
where year(appointment_date)=2023
order by bill desc
limit 6;

-- Second option
-- write sql query to find top 6 patients by their bill amount who have appointment date in year 2023
select patient,bill
from services_australia.hospital
where appointment_date like '%2023%'
order by bill desc
limit 6;

-- Third option
-- write sql query to find top 6 patients by their bill amount who have appointment date in year 2023
select patient,bill
from services_australia.hospital
where appointment_date between "2023-01-01" and "2023-12-31"
order by bill desc
limit 6;


-- write a sql query to find 4th aged patient
select *
from services_australia.hospital
order by age desc
limit 1 offset 3;

-- write a sql query to find 4th ,5th aged patient
select *
from services_australia.hospital
order by age desc
limit 2 offset 3;

-- write a sql query to find 4th ,7th aged patient
-- UNION and UNION ALL
-- UNION remove the duplicate from first select query and second select query and so on
-- UNION ALL include all the duplicate from first select query and second select query and so on

(select *
from services_australia.hospital
order by age desc
limit 1 offset 3)

union all

(select *
from services_australia.hospital
order by age desc
limit 1 offset 7);


/*write a SQL query to find total patients who are diagnosed with "Flu" */

select count(id) as total_patients
FROM services_australia.hospital
where diagnosis="flu";

/*Write a query to find total bill claimed by patients from insurance company "Aetna"*/
select sum(bill) as total_bill
FROM services_australia.hospital
where insurance="Blue Cross";

-- GROUP BY

select insurance, count(id) as total_patients
from services_australia.hospital
group by insurance;

-- write a sql query to find average bill paid by each insurance company
select insurance, avg(bill) as average_bill
from services_australia.hospital
group by insurance;

-- GROUP BY more than 1
select insurance,diagnosis, count(id) as total_patients
from services_australia.hospital
group by insurance,diagnosis;

INSERT INTO hospital(id, doctor, patient, age, appointment_date,insurance,bill,diagnosis) values 
(100, 'Dr. Johann Muller', 'Milan Sherpa', 45, '2023-02-15', 'Aetna', 1500.00, 'Flu'),
(200, 'Dr. Michael Bauer', 'Thor Rai', 25, '2022-02-10', 'Blue Cross', 500.00, 'Flu'),
(300, 'Dr. Emily Carter', 'Eden Smith', 38, '2023-03-12', 'Cigna', 1200.00, 'Hypertension'),
(400, 'Dr. Sarah Wilson', 'Marry', 29, '2023-04-05', 'UnitedHealth', 850.00, 'Covid-19'),
(500, 'Dr. David Lee', 'Neon', 51, '2023-05-18', 'Aetna', 2300.00, 'Covid-19'),
(600, 'Dr. Olivia White', 'Dune', 33, '2022-06-20', 'Blue Cross', 950.00, 'Anemia');


-- write a sql query to find total number of patients have appointment each year

-- write a sql query to find total appointment in each year

select year(appointment_date),count(id) as total_patients
from services_australia.hospital
group by year(appointment_date);

-- write a sql to find insurance where patients are more than 3

select insurance, count(id) as total_count_patients
from services_australia.hospital
group by insurance
having count(id)>3;

-- subquery concept
select * 
from 
(select insurance, count(id) as total_patients
from services_australia.hospital
group by insurance
) x 
where x.total_patients>3;

-- write a sql query to find the patients who paid the max bill

select * 
from services_australia.hospital
where bill= (select max(bill) from services_australia.hospital);

select * 
from services_australia.hospital
order by bill desc;

-- find the second highest bill
select patient as patient_name,bill
from services_australia.hospital
where bill=(select max(bill)
from services_australia.hospital
where bill < (select max(bill) from services_australia.hospital));

-- Join for more detail find out in visual join website https://joins.spathon.com/

create database reading_cinema;

use reading_cinema;

CREATE TABLE Movies(
movie_id int primary key,
title varchar(50) not null,
director varchar(50),
release_year int
);

INSERT INTO Movies(movie_id,title,director,release_year) 
VALUES (1, 'Inception', 'Christopher Nolan', 2010),
    (2, 'The Dark Knight', 'Christopher Nolan', 2008),
    (3, 'Avatar', 'James Cameron', 2009),
    (4, 'Parasite', 'Bong Joon-ho', 2019),
    (5, 'Interstellar', 'Christopher Nolan', 2014);
    
CREATE TABLE Visitors(
visitor_id int primary key,
first_name varchar(255) not null,
last_name varchar(255) not null,
email varchar(255) unique not null,
phone varchar(15)
);
  
INSERT INTO Visitors (visitor_id, first_name, last_name, email, phone)
VALUES
    (1001, 'John', 'Smith', 'john.smith@email.com', '081234567801'),
    (1002, 'Emma', 'Johnson', 'emma.johnson@email.com', NULL),
    (1003, 'Michael', 'Brown', 'michael.brown@email.com', '081234567803'),
    (1004, 'Sophia', 'Davis', 'sophia.davis@email.com', NULL),
    (1005, 'William', 'Miller', 'william.miller@email.com', '081234567805'),
    (1006, 'Olivia', 'Wilson', 'olivia.wilson@email.com', '081234567806'),
    (1007, 'James', 'Moore', 'james.moore@email.com', NULL),
    (1008, 'Ava', 'Taylor', 'ava.taylor@email.com', '081234567808'),
    (1009, 'Benjamin', 'Anderson', 'benjamin.anderson@email.com', NULL),
    (1010, 'Isabella', 'Thomas', 'isabella.thomas@email.com', '081234567810'),
	(1011, 'Kurt', 'Hert', 'kurt.Hert@email.com', '081234567810'),
    (1012, 'Goban', 'Chev', 'Goban.Chev@email.com', '081234567810'),
    (1013, 'Mat', 'Howie', 'Mat.Howie@email.com', '081234567810')
    ;


CREATE TABLE Details(
 visitor_id int,
 movie_id int,
 date_visited date,
 FOREIGN KEY (visitor_id) REFERENCES Visitors(visitor_id),
 FOREIGN KEY (movie_id) REFERENCES Movies(Movie_id)
);

INSERT INTO Details (visitor_id, movie_id, date_visited)
VALUES
	(1001, 1, '2025-01-05'),
	(1002, 3, '2025-01-08'),
    (1003, 2, '2025-01-10'),
    (1004, 5, '2025-01-12'),
    (1005, 4, '2025-01-15'),
    (1006, 1, '2025-01-18'),
    (1007, 3, '2025-01-20'),
    (1007, 2, '2025-01-22'),
    (1009, 5, '2025-01-25'),
	(1010, 4, '2025-01-28'),
	(1013, 2, '2025-01-28')
    ;
    
Select * from reading_cinema.movies;
Select * from reading_cinema.visitors;
Select * from reading_cinema.details;

-- inner join
select *
from reading_cinema.visitors v1
inner join reading_cinema.details d1
on v1.visitor_id=d1.visitor_id;

-- write a sql query to find name of visitors who visited 28 January 2025
select v1.first_name, v1.last_name, concat(v1.first_name,' ',v1.last_name) as full_name
from reading_cinema.visitors v1
inner join reading_cinema.details d1
on v1.visitor_id=d1.visitor_id
where d1.date_visited="2025-01-28";

-- left join
-- write a sql query to find all visitor who have visited cinema as well as have not visited cinema
select *
from reading_cinema.visitors v1
left join reading_cinema.details d1
on v1.visitor_id=d1.visitor_id;

-- name of visitor who have not seen any movies
select *
from reading_cinema.visitors v1
left join reading_cinema.details d1
on v1.visitor_id=d1.visitor_id
where d1.visitor_id is null;

-- bulk

create database ANZ_bank;

use ANZ_bank;

CREATE TABLE dim_branch(
branch_bsb char(7) NOT NULL,
branch_name varchar(60) NOT NULL,
city varchar(60) NOT NULL,
state varchar(5) NOT NULL,
postcode varchar(8) NOT NULL,
bank varchar(10) NOT NULL,
opened_date DATE NOT NULL,
constraint pk_branch primary key(branch_bsb),
constraint chk_branch_state check(state IN ('NSW','VIC','QLD','SA','WA','TAS','NT','ACT'))
);


CREATE TABLE dim_officer(
officer_id CHAR(12) NOT NULL,
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(40) NOT NULL,
branch_bsb CHAR(7) NOT NULL,
seniority VARCHAR(20) NOT NULL,
constraint pk_officer PRIMARY KEY (officer_id),
constraint chk_officer_seniority CHECK (seniority IN ('Junior','Senior','Lead'))
);

CREATE TABLE dim_loan_product(
product_id CHAR(12) NOT NULL,
product_name VARCHAR(60) NOT NULL,
category VARCHAR(20) NOT NULL,
rate_type VARCHAR(20) NOT NULL,
base_rate_pct Decimal(5,2) NOT NULL,
constraint pk_product PRIMARY KEY (product_id),
constraint chk_product_ratetype CHECK (rate_type IN ('Fixed','Variable')),
constraint chk_product_rate CHECK (base_rate_pct > 0)
);


CREATE TABLE dim_customer(
customer_id CHAR(12) NOT NULL,
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(40) NOT NULL,
segment VARCHAR(30) NOT NULL,
home_branch_bsb CHAR(7) NOT NULL,
credit_band VARCHAR(20) NOT NULL,
constraint pk_customer PRIMARY KEY (customer_id),
constraint fk_customer_branch FOREIGN KEY (home_branch_bsb) REFERENCES dim_branch(branch_bsb),
constraint chk_customer_band CHECK (credit_band IN ('Excellent','Good','Fair','Poor'))
);

CREATE TABLE fact_loan (
    loan_account_no VARCHAR(20) NOT NULL,
    application_date DATE NOT NULL,
    disbursement_date DATE NULL, -- NULL when rejected

    branch_bsb CHAR(7) NOT NULL,
    officer_id CHAR(12) NOT NULL,
    product_id CHAR(12) NOT NULL,
    customer_id CHAR(12) NOT NULL,

    loan_status VARCHAR(20) NOT NULL,

    term_months INT NOT NULL,

    principal_amount DECIMAL(12,2) NOT NULL,
    approved_amount DECIMAL(12,2) NOT NULL,
    interest_rate_pct DECIMAL(5,2) NOT NULL,
    monthly_repayment DECIMAL(12,2) NOT NULL,
    total_interest DECIMAL(12,2) NOT NULL,
    outstanding_balance DECIMAL(12,2) NOT NULL,
    amount_repaid DECIMAL(12,2) NOT NULL,

    ltv_ratio_pct DECIMAL(5,1) NOT NULL,
    dti_ratio_pct DECIMAL(5,1) NOT NULL,

    credit_score INT NOT NULL,
    collateral_value DECIMAL(12,2) NOT NULL,
    fees_charged DECIMAL(10,2) NOT NULL,

    days_in_arrears INT NOT NULL,

    is_first_home_buyer TINYINT NOT NULL,
    is_refinance TINYINT NOT NULL,

    CONSTRAINT pk_loan PRIMARY KEY (loan_account_no),
	CONSTRAINT fk_loan_branch FOREIGN KEY (branch_bsb) REFERENCES dim_branch(branch_bsb),
	CONSTRAINT fk_loan_officer FOREIGN KEY (officer_id) REFERENCES dim_officer(officer_id),
	CONSTRAINT fk_loan_customer FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
	CONSTRAINT fk_loan_product FOREIGN KEY (product_id) REFERENCES dim_loan_product(product_id),
    CONSTRAINT chk_loan_status CHECK (loan_status IN ("Approved",'Disbursed','Repaid','Defaulted','Rejected','Arrears')),
    CONSTRAINT chk_loan_approved CHECK (approved_amount <= principal_amount),
    CONSTRAINT chk_loan_score CHECK (credit_score between 300 and 900),
    CONSTRAINT chk_loan_flags CHECK (is_first_home_buyer IN (0,1) AND is_refinance IN (0,1))
);

select * from anz_bank.dim_branch;
select * from anz_bank.fact_loan;
select count(loan_account_no) as total_data from anz_bank.fact_loan;
TRUNCATE table anz_bank.fact_loan;

-- REMOVE table
drop table dim_officer;

-- windows functions

create database samsung;

use samsung;
-- Create the employee table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_name VARCHAR(50),
    salary INT,
    hire_date DATE
);

-- Insert data into the employee table
INSERT INTO employee(emp_id,emp_name,department_name,salary,hire_date)
 VALUES (101, 'Aarav', 'Admin', 4000, '2020-01-15'),
(102, 'Rajani', 'HR', 3000, '2019-05-20'),
(103, 'Aakash', 'IT', 4000, '2020-03-10'),
(104, 'Devika', 'Finance', 6500, '2018-12-05'),
(105, 'Roshan', 'HR', 3000, '2021-02-28'),
(106, 'Rajendra', 'Finance', 5000, '2019-08-10'),
(107, 'Pratima', 'HR', 7000, '2022-04-15'),
(108, 'Maya', 'Admin', 4000, '2021-09-20'),
(109, 'Santosh', 'IT', 6500, '2023-06-25'),
(110, 'Vishal', 'IT', 7000, '2023-11-30'),
(111, 'Mira', 'IT', 8000, '2024-03-12'),
(112, 'Komal', 'IT', 10000, '2022-07-18'),
(113, 'Gagan', 'Admin', 2000, '2024-02-03'),
(114, 'Manjari', 'HR', 3000, '2022-11-08'),
(115, 'Chandani', 'IT', 4500, '2023-04-25'),
(116, 'Satish', 'Finance', 6500, '2021-06-30'),
(117, 'Anand', 'HR', 3500, '2020-10-15'),
(118, 'Tejas', 'Finance', 5500, '2022-01-05'),
(119, 'Chandrika', 'HR', 8000, '2023-09-10'),
(120, 'Monika', 'Admin', 5000, '2024-05-18'),
(121, 'Ranjana', 'IT', 6000, '2021-08-22'),
(122, 'Ishwar', 'IT', 8000, '2022-12-08'),
(123, 'Vikas', 'IT', 8000, '2020-10-30'),
(124, 'Dhirendra', 'IT', 11000, '2019-03-15'),
(125, 'Sunita', 'Admin', 5500, '2024-05-28'),
(126, 'Varsha', 'IT', 7000, '2024-06-10'),
(127, 'Pooja', 'HR', 4500, '2024-06-15'),
(128, 'Amitabh', 'Finance', 6000, '2024-07-02'),
(129, 'Neelam', 'Admin', 4800, '2024-07-20'),
(130, 'Ravi', 'IT', 7500, '2024-08-05'),
(131, 'Kirti', 'HR', 4000, '2024-08-18'),
(132, 'Anita', 'Finance', 6200, '2024-09-03'),
(133, 'Arjun', 'Admin', 5300, '2024-09-22'),
(134, 'Rajeshwor', 'IT', 7800, '2024-10-10');


select * from samsung.employee;

select e1.*, row_number() over (order by e1.salary desc) as rn from samsung.employee e1;
select e1.*, row_number() over (order by emp_id asc) as rn from samsung.employee e1;

select e1.*, rank() over (order by e1.salary desc) as rnk from samsung.employee e1;
select e1.*, dense_rank() over (order by e1.salary desc) as dr from samsung.employee e1;

with ctel as 
(
select e1.*, dense_rank() over(partition by e1.department_name order by e1.salary desc) as ranking
from samsung.employee e1
)

select * 
from ctel 
where ctel.ranking<=2;

select e1.*, row_number() over (order by e1.salary desc) as rn from samsung.employee e1;
select e1.*, rank() over (order by e1.salary desc) as rnk from samsung.employee e1;
select e1.*, dense_rank() over (order by e1.salary desc) as dr from samsung.employee e1;

with ctel as 
(
select e1.*, dense_rank() over(partition by e1.department_name order by e1.salary desc) as ranking
from samsung.employee e1
)

select * 
from ctel 
where ctel.ranking<=2;

-- lead

-- lag

-- ntile

-- sum

-- avg

select * 
from samsung.employee;

delete from samsung.employee where emp_id=103;

-- write a sql query to find to salary of person next to 102

with ctel2 
as(
select e1.*, 
lead(e1.salary) over(order by e1.emp_id asc) as next_salary
from samsung.employee e1
)

select ctel2.*,
(ctel2.next_salary-ctel2.salary) as diff
from ctel2;

with ctel 
as(
select e1.*, 
lag(e1.salary) over(order by e1.emp_id asc) as previous_salary
from samsung.employee e1
)


select ctel.*,
(ctel.previous_salary-ctel.salary) as diff
from ctel;

-- ntile

select e1.*,
ntile(3) over(order by e1.salary desc)
from samsung.employee e1;

select count(*) as count from (select e1.*,
ntile(3) over(order by e1.salary desc) as ntile_data
from samsung.employee e1) t where ntile_data=3;

-- sum average
-- write a sql query to find total salary of employee
select e1.*,
sum(e1.salary) over(partition by e1.department_name) as total_salary 
from samsung.employee e1;

select department_name,sum(salary)
from samsung.employee
group by department_name;


select e1.*,
sum(e1.salary) over() as total_salary 
from samsung.employee e1;


with cte1
as(
select e1.*,
sum(e1.salary) over() as total_salary 
from samsung.employee e1
)

select cte1.*,
(cte1.salary/cte1.total_salary)*100 as salary_pct
from cte1;

-- write a sql query to find salary ratio of each employee with respeact their own department salary

select *,
sum(salary) over(partition by department_name) as total_salary
from samsung.employee;

with cte1 as (
select *,
sum(salary) over(partition by department_name) as total_salary
from samsung.employee
)

select cte1.*, (salary/total_salary) as salary_percentage
from cte1;

-- write a sql query to find running total of salary 
-- in company with respect to each employee get hired

select *,
sum(e1.salary) over(order by hire_date asc) as total_salary
from samsung.employee e1;

-- write a sql query to find running total of salary 
-- in each department of company with respect to each employee get hired
select *,
sum(e1.salary) over(partition by department_name order by hire_date asc) as total_salary
from samsung.employee e1;

-- write a sql query to find different between 
-- salary of each employee and avg salary 
-- of each department

with cte1 as (
select *,
avg(e1.salary) over(partition by department_name) as average_salary
from samsung.employee e1
)

select cte1.*,
(salary-average_salary) as difference_salary
from cte1;

-- Date Functions

select curdate();
select now();

-- dob oct 11,2002

select timestampdiff(year,'2002-10-11',curdate()) as age;

select timestampdiff(month,'2002-10-11',curdate()) as age;

-- dateadd
select date_add(curdate(), interval 75 year);

select date_add(curdate(), interval 75 month);

select date_add(curdate(), interval 5 day);

select date_add(curdate(), interval -50 year);


-- write a sql query to find total number of employees got hired in the last 6 month
select date_add(curdate(), interval -6 month);

select *
from samsung.employee e1
where e1.hire_date >= (select date_add(curdate(), interval -6 month)
);


select *
from samsung.employee; 

-- write a sql query to find all the employees who have more than 7 years of experience

select e1.*,timestampdiff(year,e1.hire_date,curdate()) as time_diff
from samsung.employee e1;

select timestampdiff(year,'2024-09-22',curdate());

-- answer 1
with ctel 
as(
select e1.*,timestampdiff(year,e1.hire_date,curdate()) as time_diff
from samsung.employee e1
)

select ctel.* 
from ctel
where ctel.time_diff>=7;

-- sum

-- avg

select * 
from samsung.employee;

delete from samsung.employee where emp_id=103;

-- write a sql query to find to salary of person next to 102

with ctel2 
as(
select e1.*, 
lead(e1.salary) over(order by e1.emp_id asc) as next_salary
from samsung.employee e1
)

select ctel2.*,
(ctel2.next_salary-ctel2.salary) as diff
from ctel2;

with ctel 
as(
select e1.*, 
lag(e1.salary) over(order by e1.emp_id asc) as previous_salary
from samsung.employee e1
)


select ctel.*,
(ctel.previous_salary-ctel.salary) as diff
from ctel;

-- ntile

select e1.*,
ntile(3) over(order by e1.salary desc)
from samsung.employee e1;

select count(*) as count from (select e1.*,
ntile(3) over(order by e1.salary desc) as ntile_data
from samsung.employee e1) t where ntile_data=3;

-- sum average
-- write a sql query to find total salary of employee

with cte1
as(
select e1.*,
sum(e1.salary) over() as total_salary 
from samsung.employee e1
)

select cte1.*,
(cte1.salary/cte1.total_salary)*100 as salary_pct
from cte1;

-- write a sql query to find salary ratio of each employee with respeact their own department salary

select *,
sum(salary) over(partition by department_name) as total_salary
from samsung.employee;

with cte1 as (
select *,
sum(salary) over(partition by department_name) as total_salary
from samsung.employee
)

select cte1.*, (salary/total_salary) as salary_percentage
from cte1;

-- write a sql query to find running total of salary 
-- in company with respect to each employee get hired

select *,
sum(e1.salary) over(order by hire_date asc) as total_salary
from samsung.employee e1;

-- write a sql query to find running total of salary 
-- in each department of company with respect to each employee get hired
select *,
sum(e1.salary) over(partition by department_name order by hire_date asc) as total_salary
from samsung.employee e1;

-- write a sql query to find different between 
-- salary of each employee and avg salary 
-- of each department

with cte1 as (
select *,
avg(e1.salary) over(partition by department_name) as average_salary
from samsung.employee e1
)

select cte1.*,
(salary-average_salary) as difference_salary
from cte1;

-- Date Functions

select curdate();
select now();

-- dob oct 11,2002

select timestampdiff(year,'2002-10-11',curdate()) as age;

select timestampdiff(month,'2002-10-11',curdate()) as age;

-- dateadd
select date_add(curdate(), interval 75 year);

select date_add(curdate(), interval 75 month);

select date_add(curdate(), interval 5 day);

select date_add(curdate(), interval -50 year);


-- write a sql query to find total number of employees got hired in the last 6 month
select date_add(curdate(), interval -6 month);
select now();
select *
from samsung.employee e1
where e1.hire_date >= (select date_add(curdate(), interval -6 month)
);


select *
from samsung.employee; 

-- write a sql query to find all the employees who have more than 7 years of experience

select e1.*,timestampdiff(year,e1.hire_date,curdate()) as time_diff
from samsung.employee e1;

select timestampdiff(year,'2024-09-22',curdate());

-- answer 1
with ctel 
as(
select e1.*,timestampdiff(year,e1.hire_date,curdate()) as time_diff
from samsung.employee e1
)

select ctel.* 
from ctel
where ctel.time_diff>=7;

select count(*) as count from samsung.employee;

INSERT INTO employee(emp_id,emp_name,department_name,salary,hire_date)
 VALUES (151, 'Aarav', 'Admin', 4000, '2026-03-15'),
(152, 'Rajani', 'HR', 3000, '2026-05-20'),
(153, 'Aakash', 'IT', 4000, '2020-04-10'),
(154, 'Devika', 'Finance', 6500, '2025-12-05'),
(155, 'Roshan', 'HR', 3000, '2026-03-28');

select department_name, count(emp_id)  from samsung.employee group by department_name;


-- coaleasc

create database myers;

use myers;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50),
  phone VARCHAR(20),
  age INT
);

INSERT INTO customers (customer_id, name, email, phone, age)
VALUES
  (1, 'Liam Smith', 'liam.smith@gmail.com', '555-1234', 35),
  (2, 'Olivia Johnson', 'olivia.johnson@outlook.com', NULL, 27),
  (3, 'Noah Brown', 'noah.brown@gmail.com', '555-5678', NULL),
  (4, 'Emma Jones', 'emma.jones@outlook.com', '555-9999', 42),
  (5, 'William Garcia', 'william.garcia@gmail.com', '555-4321', 18);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  order_amount DECIMAL(10, 2),
  customer_id INT REFERENCES customers(customer_id),
  order_status VARCHAR(10)
);

INSERT INTO orders (order_id, order_date, order_amount, customer_id, order_status)
VALUES
  (1, '2022-01-01', 100.00, 1, 'shipped'),
  (2, '2022-02-01', 50.00, NULL, 'pending'),
  (3, '2022-03-01', 200.00, 2, 'shipped'),
  (4, NULL, 75.00, 3, 'pending'),
  (5, '2022-05-01', NULL, 1, 'pending'),
  (6, '2022-06-01', 150.00, 4, 'shipped'),
  (7, '2022-07-01', 125.00, 5, 'shipped'),
  (8, NULL, NULL, 2, 'pending');

select * 
from myers.customers;

select * 
from myers.orders;

-- 

select c1.customer_id,c1.email,c1.phone,
coalesce(c1.age,(select round(avg(age))
from myers.customers)) as age
from myers.customers c1;

select round(avg(age))
from myers.customers;

select floor(avg(age))
from myers.customers;

select ceiling(avg(age))
from myers.customers;

select o1.*,
coalesce(o1.order_amount,(select round(avg(order_amount))
from myers.orders)) as new_amount,
coalesce(o1.order_date,curdate()) as new_order_date
from myers.orders o1;

-- > 100 20%
-- >80 and <100 10%
-- 0%

with cte1 as (
select o1.order_id, o1.order_status,o1.customer_id,
coalesce(o1.order_amount,(select round(avg(order_amount))
from myers.orders)) as new_amount,
coalesce(o1.order_date,curdate()) as new_order_date
from myers.orders o1
),
cte2 as (

select cte1.* ,
 case
     when cte1.new_amount>100 then cte1.new_amount * 0.80
     when cte1.new_amount between 80 and 100 then cte1.new_amount*0.90
     else cte1.new_amount
 end as amount_after_discount
from cte1
)

select cte2.*,(cte2.new_amount-cte2.amount_after_discount) as discounted_amount
from cte2;


-- find total amount_after_discount for shipped order

with cte1 as(
select o1.order_id, o1.order_status,o1.customer_id,
coalesce(o1.order_amount,(select round(avg(order_amount))
from myers.orders)) as new_amount,
coalesce(o1.order_date,curdate()) as new_order_date
from myers.orders o1
)

select
sum(case
     when cte1.new_amount>100 then cte1.new_amount * 0.80
     when cte1.new_amount between 80 and 100 then cte1.new_amount*0.90
     else cte1.new_amount
	end ) as amount_after_discount
from cte1
where cte1.order_status="shipped";


-- union and union all

select *
from myers.customers;

CREATE TABLE customers2 (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50),
  phone VARCHAR(20),
  age INT
);

INSERT INTO customers2 (customer_id, name, email, phone, age)
VALUES
  (10, ' Smith', 'smith@gmail.com', '555-1234', 35),
  (20, 'Olivia Johnson', 'olivia.johnson@outlook.com', NULL, 27),
  (30, ' Brown', 'brown@gmail.com', '555-5678', NULL),
  (40, 'Marry Jones', 'emma.jones@outlook.com', '555-9999', 42),
  (50, 'William Garcia', 'william.garcia@gmail.com', '555-4321', 18);


(select *
from myers.customers c1
)
union all
(
select *
from myers.customers2 c2
);

CREATE TABLE customers3 (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50),
  phone VARCHAR(20),
  age INT
);

INSERT INTO customers3 (customer_id, name, email, phone, age)
VALUES
  (10, ' Smith', 'smith@gmail.com', '555-1234', 35),
  (20, 'Olivia Johnson', 'olivia.johnson@outlook.com', NULL, 27),
  (30, ' Brown', 'brown@gmail.com', '555-5678', NULL),
  (40, 'Marry Jones', 'emma.jones@outlook.com', '555-9999', 42),
  (500, 'William Garcia', 'william.garcia@gmail.com', '555-4321', 18);
  
  
  
(
select *
from myers.customers2 c2
)
union all
(
select *
from myers.customers3 c3
);

(
select *
from myers.customers2 c2
)
union
(
select *
from myers.customers3 c3
);

CREATE TABLE customers4 (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50),
  phone VARCHAR(20),
  age INT,
  income decimal(10,2)
  
);

INSERT INTO customers4 (customer_id, name, email, phone, age, income)
VALUES
  (10, ' Smith', 'smith@gmail.com', '555-1234', 35,100000),
  (20, 'Olivia Johnson', 'olivia.johnson@outlook.com', NULL, 27,200000),
  (30, ' Brown', 'brown@gmail.com', '555-5678', NULL,NULL),
  (40, 'Marry Jones', 'emma.jones@outlook.com', '555-9999', 42,NULL),
  (500, 'William Garcia', 'william.garcia@gmail.com', '555-4321', 18,600000);


(SELECT c2.*
from myers.customers2 c2
)
union
(
select c4.*
from myers.customers4 c4
);

-- VIEW
Create view vw_orders_detail as 
select *
from myers.orders o1;

Create view vw_orders_intern as 
select o1.order_id, o1.customer_id, o1.order_date
from myers.orders o1;

select * from vw_orders_intern;
select * from vw_orders_detail;

create view vw_avg_amount_per_customer as
select  c1.name, avg(o1.order_amount)as avg_amount
from myers.customers c1
left join myers.orders o1
on c1.customer_id = o1.customer_id
group by c1.name;

select * from vw_avg_amount_per_customer;

select avg(age)
from myers.customers;

-- materialise view
drop table  mt_avg_amount;
create table mt_avg_amount as
select  c1.name, avg(o1.order_amount)as avg_amount
from myers.customers c1
left join myers.orders o1
on c1.customer_id = o1.customer_id
group by c1.name;

select * from mt_avg_amount;

INSERT INTO orders (order_id, order_date, order_amount, customer_id, order_status)
VALUES
  (100, '2022-01-01', 1000.00, 1, 'shipped'),
  (200, '2022-02-01', 500.00, NULL, 'pending'),
  (300, '2022-03-01', 2000.00, 2, 'shipped'),
  (400, NULL, 75.00, 3, 'pending'),
  (500, '2022-05-01', NULL, 1, 'pending'),
  (600, '2022-06-01', 150.00, 4, 'shipped'),
  (700, '2022-07-01', 125.00, 5, 'shipped'),
  (800, NULL, NULL, 2, 'pending');

select *
from myers.orders;