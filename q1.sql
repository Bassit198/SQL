/*
Name: Bassit Ilahi
Panther-ID: x x x - 8318
Course: COP 4710
Assignment#: 2
Due: Mon, Feb 20, 2023
I hereby certify that this work is my own and none of it is the work of any other person.
Signature: Bassit Ilahi
*/

-- returns the department location
SELECT DLocation

-- will uses these tables listed to navigate
FROM dept_locations, dependent, employee

/*will first check the dependent table to find Michael.
Then check the employee table to find the ssn of the employee that corresonds to the ssn of the employee associated with michael
Then check the department number of that employee and the corresponding dept location*/
WHERE dependent.dependent_name = 'Michael' AND dependent.essn = employee.ssn AND employee.dno = dept_locations.dnumber

-- will group the results by attribute of dept location
GROUP BY dlocation






-- Alternative method: Uncomment to view but comment above method
/*
-- will return the location of the of the department, with the name of 'DLocation', that the employee is working on using the deparment number retunerd from the below subquery
SELECT plocation as 'DLocation'from project where (dnum = 
       
-- will return the department number of the employee using the employee ssn returned from below subquery 
(SELECT dno from employee where (ssn = 
       
-- will return the employee ssn whose dependent is 'Michael'
(SELECT essn from dependent where dependent_name = 'Michael'))))
*/