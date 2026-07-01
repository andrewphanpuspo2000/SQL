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