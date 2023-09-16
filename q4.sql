/*
Name: Bassit Ilahi
Panther-ID: x x x - 8318
Course: COP 4710
Assignment#: 2
Due: Mon, Feb 20, 2023
I hereby certify that this work is my own and none of it is the work of any other person.
Signature: Bassit Ilahi
*/

-- will display the last name of the selected employee and count the subordinates using the result returned from the subquery
SELECT employeeInstance1.LName, COUNT(subordinates.superssn) AS 'Subordinates'

-- will use the department table and two instances of the employee table (one to find the employee and the other to find the subordinates)
FROM department, employee employeeInstance1, employee subordinates

/*Condition used to check:
First: return the mgrssn from the department table where the department name is 'Headquarters
Then: return the employee ssn where the department mgrssn is the same as the superssn in the employee table
The: return the subordinates ssn using the employee ssn return from the above query'*/
WHERE department.dname = 'Headquarters' AND department.mgrssn = employeeInstance1.superssn AND subordinates.superssn = employeeInstance1.ssn

-- group the results by the employee ssn to display uniform results 
GROUP BY employeeInstance1.ssn
