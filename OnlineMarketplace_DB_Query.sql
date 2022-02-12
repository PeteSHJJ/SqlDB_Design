-- Basic queries    
-- 1
-- Select all employees
Select fname as firstname, lname as lastname,emp_id,position,dept_id
From employee;
-- 2
-- Select employee that works in IT department
Select concat(fname," ",lname) as Name,dept_id,position
From employee
where dept_id = 10;
-- 3
-- Select only female employee
Select fname as firstname,lname as lastname
From employee
where gender = 'F'
order by fname;
-- 4
-- Select full-time employee
SELECT fname,lname,dept_id
FROM employee
WHERE emp_type = "full-time"
ORDER BY dept_id ASC;
-- 5
-- Select manager
SELECT fname,lname,dept_id
FROM employee
WHERE emp_type = "Manager"
ORDER BY dept_id ASC;
-- 6
-- Select invoice_d and emp_id 
Select invoice_id, emp_id
From invoice;
-- 7 
-- Select all in transaction
Select transaction_id,Datetime as date , trans_type
From `Transaction`
Where trans_type = "bank_transfer";

-- 8
-- Select Records that not have a desciption
Select record_id,date,description
From Record
Where `description` IS NULL;

-- 9
-- Select Records that have a desciption
Select record_id,date,description
From Record
Where `description` IS NOT NULL;

-- 10
-- Select employee that got salary deduction.
Select record_id,penalty,emp_id
From violation_rec
Where Penalty = 'salary deduction';
-- 11
-- Select employee who has annual leave form
Select record_id,date_start,date_end,emp_id
From Leave_form
Where type = 'Annual leave';
-- 12
-- Select record id that rec_type is violation_rec
Select Record_id,rec_type
From Record
Where Rec_type = "violation_rec";
-- 13
-- list timestamp and emp_id order by timestamp in ascending order.
Select Timestamp,emp_id
From timecard
order by timestamp asc;
-- 14
-- Selct employee that has check in to the office more than 50 times order in descending order.
Select timestamp, emp_id, break_hrs 
From timecard
Where break_hrs = 1;
-- 15
-- Select employee id who has break_hrs = 2
Select timestamp, emp_id, break_hrs 
From timecard
Where break_hrs = 2;
-- 16
-- show list of employees and what department that they have worked.
Select CONCAT(fname," ",lname) AS Name,d.name as Department
From employee e JOIN Department d on e.dept_id = d.dept_id;
-- 17
-- list invoice_id and other informations then show the name of employee
Select invoice_id,peroid_type,date,e.emp_id,concat(e.fname," ",lname) as name
FROM invoice i
INNER JOIN employee e on i.emp_id = e.emp_id;
-- 18
-- list the employee from the highest timestamp credits and what is his/her department.
Select e.emp_id,concat(e.fname," ",lname) as name,t.timestamp,d.name as Department, Count(t.emp_id) as Attendance
From employee e
JOIN timecard t on t.emp_id = e.emp_id
JOIN department d on d.dept_id = e.dept_id
group by t.emp_id
order by Attendance desc
Limit 1;

-- 19
-- Count the gender of employee
SELECT SUM(CASE WHEN UPPER(Gender) = 'M' THEN 1 ELSE 0 END) AS Male,
SUM(CASE WHEN UPPER(Gender) = 'F' THEN 1 ELSE 0 END) AS Female,
COUNT(emp_id) AS 'Total Employee'  FROM employee;
-- 20 
Select t.transaction_id,b.bank_account
From transaction t
JOIN bank_transfer b on t.transaction_id = b.transaction_id; 

-- 21
-- show list of employees who has a leave form 
SELECT r.record_id,rec_type,emp_id,date_start,date_end
FROM Record r
JOIN leave_form l on l.record_id = r.record_id;

-- 22
SELECT r.record_id,concat(e.fname," ",lname) as name,rec_type,v.emp_id,Penalty
FROM Record r
JOIN violation_rec v on v.record_id = r.record_id
JOIN employee e on e.emp_id = v.emp_id;
-- 23
SELECT femp_id,concat(e.fname," ",lname)as name,invoice_id,peroid_type
From `full-time` f
JOIN employee e on e.emp_id = f.femp_id
JOIN invoice i on i.emp_id = f.femp_id;
-- 24
Select e.emp_id,concat(e.fname," ",lname) as name,t.timestamp,d.name as Department, Count(t.emp_id) as Attendance
From employee e
JOIN timecard t on t.emp_id = e.emp_id
JOIN department d on d.dept_id = e.dept_id
group by t.emp_id
order by Attendance desc;
-- 25
-- show list of employees that not has been suspension
SELECT concat(e.fname," ",e.lname)as name,e.emp_id
FROM employee e
WHERE e.emp_id NOT IN (
	SELECT v.emp_id
    FROM violation_rec v 
    WHERE v.penalty = "suspension"
);
-- 26
Select m.memp_id, concat(e.fname," ",e.lname)as name,d.dept_id,name as department
From manager m JOIN employee e on e.emp_id = m.memp_id
JOIN department d on e.dept_id = d.dept_id;
-- 27 
SELECT d.dept_id,d.name as department,COUNT(*) as `Number of employees`
FROM employee e
JOIN department d on e.dept_id = d.dept_id
GROUP BY d.dept_id;
-- 28
-- show employess who has a highest number of violation.
    SELECT concat(e.fname,' ',e.lname) as `Bad employee`,COUNT(v.emp_id) as `Number of violation`
    FROM violation_rec v
    JOIN employee e on e.emp_id = v.emp_id
    group by v.emp_id
    order by COUNT(v.emp_id) desc
    Limit 1;
    
-- 29
-- employee id that has a number of violation ordering in descending order.
SELECT DISTINCT emp_id,count(*) As `Number of violation`
FROM violation_rec
WHERE emp_id IN 
(
	SELECT emp_id
    FROM Employee
)
GROUP by emp_id
ORDER BY emp_id, `Number of violation` desc;
-- 30
SELECT DISTINCT emp_id,count(*) As Amount
FROM leave_form
WHERE emp_id IN 
(
	SELECT emp_id
    FROM Employee
)
GROUP by emp_id
ORDER BY Amount desc;