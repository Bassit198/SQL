/*
Name: Bassit Ilahi
Panther-ID: x x x - 8318
Course: COP 4710
Assignment#: 2
Due: Mon, Feb 20, 2023
I hereby certify that this work is my own and none of it is the work of any other person.
Signature: Bassit Ilahi
*/

-- returns the lname and also counts the number of works assignments by departmant using project number 
SELECT LName, COUNT(works_on.pno) AS 'Projects'

-- will use these tables for navigation
FROM employee, department, project, works_on

/*First: check for project name as computerization
Then: selects the corresponding department for that project using department numbers from project table and department table
Then: selects the corresponding manager ssn from the department table and matches it to the superssn in the employees table
Then: compare the corresponding project number from the projects table to the project number from the works on table(this is the value that is counted in the select statement above)*/
WHERE project.pname = 'Computerization' AND project.dnum = department.dnumber AND department.mgrssn = employee.ssn AND project.pnumber = works_on.pno 

-- groups by the last name attribute
GROUP BY lname



-- Alternative method: Uncomment to view but comment above method
/*
-- will return the last name of the manager for the computerization project by using mgrssn from the below subquery and then count the number of projects with the project number of computerization projects which will be return from below subquery also
SELECT LName, (SELECT count(*) FROM works_on WHERE (pno = 
                                                                                                  
       
-- will return the project number of the computerization project                                             
(SELECT pnumber FROM project WHERE (pname = 'Computerization')))) as 'Projects'         
       
-- will return the manager ssn from the department table using the department number returned from the subquery below 
FROM employee WHERE (ssn = (SELECT mgrssn FROM department WHERE (dnumber = 
       
-- will return the department number for the project name of 'Computerization'
(SELECT dnum from project WHERE (pname = 'Computerization')))))

*/