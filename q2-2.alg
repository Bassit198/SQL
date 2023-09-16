% Name: Bassit Ilahi
% Panther-ID: x x x - 8318
% Course: COP 4710
% Assignment#: 1
% Due: Wed, Feb 8, 2023
% I hereby certify that this work is my own and none of it is the work of any other person.
% Signature: Bassit Ilahi


% shows a table with the employee salary only

  employeeSalaryList := 
	project salary (employee);



% makes a copy of the table of the employee salary

  employeeSalaryListCopy (salaryCopy) :=
	employeeSalaryList;



% determines the smallest value in the employee 

  removeMinSalary := 
	project salary (select salary > salaryCopy(employeeSalaryList product employeeSalaryListCopy));


% uses the smallest value from above and subtracts the employeeSalary list thus resulting in the minimum salary

  minimumSalary :=
	employeeSalaryList difference removeMinSalary;



% returns the fname and lname of the employees with the minimum salary after joining the two tables (employee and minimum salary)

  q2 := 
	project fname, lname (employee njoin minimumSalary);