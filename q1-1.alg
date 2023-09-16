% Name: Bassit Ilahi
% Panther-ID: x x x - 8318
% Course: COP 4710
% Assignment#: 1
% Due: Wed, Feb 8, 2023
% I hereby certify that this work is my own and none of it is the work of any other person.
% Signature: Bassit Ilahi


% this function locates the ProductY and also display the associated pnumber

  productY_location := 
	project pname, pnumber(select (pname='ProductY') (projects));



% this function uses the pnumber of ProductY to select all the employees from the "works_on" table. This function will select all the employees from "works_on" that has a pnumber of ProductY(2).

  productY_employees :=
	select(pno=2) (works_on);



% this function joins the employee table and the resulting table from above(table with productY employees). Furthermore, this function will project the fname, lname, ssn and, essn after joining the tables using njoin. 

  productY_employee_join_employee := 
	project fname, lname, ssn, essn (productY_employees njoin employee);



% this function then projects the fname and lname of the joint table from above given that the condition is met where ssn and essn are equal. Ssn originates from the employee tabel while essn is from the works_on tbale.
% this is why the tabels needed to be joint, so as to output the name of the employees that worked on ProductY.

  q1 := 
	project fname, lname (select(ssn=essn)(productY_employee_join_employee));