/*
Name: Bassit Ilahi
Panther-ID: x x x - 8318
Course: COP 4710
Assignment#: 2
Due: Mon, Feb 20, 2023
I hereby certify that this work is my own and none of it is the work of any other person.
Signature: Bassit Ilahi
*/

-- returns product name and the sum of the hours worked on that product
SELECT PName , SUM(works_on.hours) AS 'TotalHours'

-- uses these tables to navigate
FROM department, project, works_on

/* First: Checks for the department name being research
Then: checks for the department number in the department table and finds the corresponding department number in the project table
Then: checks for the corresponding project number for that department number from above and finds the corresponding project number in the works on table (this is what is used above to calculate the Sum since we will be returning the project numbers for the corresponding project)*/
WHERE department.dname = 'Research' AND department.dnumber = project.dnum AND project.pnumber = works_on.pno

-- groups by the attribute of project name
GROUP BY project.pname
