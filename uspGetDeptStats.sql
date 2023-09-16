/*
Name: Bassit Ilahi
Panther-ID: x x x - 8318
Course: COP 4710
Assignment#: 3
Due: Wed, March 15, 2023
I hereby certify that this work is my own and none of it is the work of any other person.
Signature: Bassit Ilahi
*/


-- checks if the procedure already exists and if it does then remove the existing procedure
DROP PROCEDURE IF EXISTS `uspGetDeptStats`;

-- begin stored procedure
DELIMITER $$

-- create procedure to accept one parameter as input called departmentName
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetDeptStats` (IN departmentName VARCHAR(15))
BEGIN

-- local variables declaration
DECLARE firstName VARCHAR(25);
DECLARE lastName VARCHAR(25);
DECLARE numberOfEmployees INT;
DECLARE salaryTotal INT;
DECLARE dependentTotal INT;
DECLARE hoursTotal DECIMAL(5,1);
DECLARE deptNumber INT;

-- get department manager name assigning it to firstName and lastName
SELECT fname, lname
INTO firstName, lastName
FROM employee, department
WHERE department.dname = departmentName AND department.mgrssn = employee.ssn;

-- get number of employees for department and assigning it to numberOfEmployees
SELECT COUNT(ssn) 
INTO numberOfEmployees
FROM employee, department
WHERE department.dname = departmentName AND department.dnumber = employee.dno;

-- get total salary for these employees and assigning it to salaryTotal
SELECT SUM(salary) 
INTO salaryTotal
FROM employee, department
WHERE department.dname = departmentName AND department.dnumber = employee.dno;

-- get number of dependents amd assigning it to dependentTotal
SELECT count(*) 
INTO dependentTotal
FROM employee, department, dependent
WHERE department.dname = departmentName AND department.dnumber = employee.dno AND employee.ssn = dependent.essn;

-- get total weekly hours and assigning it to hoursTotal
SELECT SUM(HOURS)
INTO hoursTotal
FROM works_on workInstance
JOIN project projectInstance ON projectInstance.pnumber = workInstance.pno
JOIN employee employeeInstance ON employeeInstance.ssn = workInstance.essn
WHERE dno = (SELECT dnumber FROM department WHERE dname = departmentName) AND dnum = (SELECT dnumber FROM department WHERE dname = departmentName);

-- get department number which is used to test if the department exists
SELECT dnumber INTO deptNumber FROM department WHERE dname = departmentName;


-- test if the department exists based on department number 
IF (deptNumber IS NULL) THEN
	SELECT concat('No department exists with the name "', departmentName, '"') AS '';
ELSE

	-- print output of the statistics for the department
	SELECT concat('Statistics of the department "', departmentName, '"') AS '';
	SELECT concat('Manager: ', firstName, ' ' , lastName) AS '';
    SELECT concat('Number of employees: ', cast(numberOfEmployees as char(5))) AS '';
    SELECT concat('Total salary of these employees: ', cast(salaryTotal as DECIMAL(10,2))) AS '';
    SELECT concat('Number of dependents: ', cast(dependentTotal as char(5))) AS '';
    SELECT concat('Total weekly hours of these employees: ', cast(hoursTotal as DECIMAL(10,2))) AS ''; 
    
END IF;

END$$
DELIMITER $$
