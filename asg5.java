/*
Declaration:

Name: Bassit Ilahi
Panther-ID: x x x - 8318
Course: COP 4710
Assignment#: 5
Due: Wed, Apr 12, 2023
I hereby certify that this work is my own and none of it is the work of any other person.
Signature: Bassit Ilahi

I hereby certify that this work is my own and none of it is the work of any other person.
I, Bassit Ilahi, certify that the submitted documents belongs to me and is the work of no other individual or sources. 
I certify that this work is my own and was not plagiarised or replicated by any means. 
I certify that I wrote these queries myself without any help from any other people or sources from the internet.
I affirm that this work does not fall into the into the category of plagiarism as per abiding to FIU's guidelines and 
policies relating to plagiarism.
*/

//imported libraries
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class asg5 {

    //JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String URL = "jdbc:mysql://localhost:3306/";
    

    //database credentials
    static final String DBASE = "company";
    static final String USER = "root";
    static final String PASS = "";
	
	
	//main method where code is executed
	public static void main(String[] args) {
		
		//variables definition 
		Connection conn = null;
        PreparedStatement stmt = null, stmt2 = null, stmt3 = null, stmt4 = null;
        double averageAssignment = 0.0;
        double count = 0.0;
        
        //try block since SQL exception may be thrown and must be handled
        try {
            //register JDBC driver
            Class.forName(JDBC_DRIVER);

            //establish a connection with defined URL and database
            conn = DriverManager.getConnection(URL + DBASE, USER, PASS);
            
            //checks if the connection is established and proceeds if active
            if (conn != null) {
            	
            	//message to let user know connection was successful
                System.out.println();
                System.out.println("Successfully connected to DB: " + DBASE + "\n");
                
                
                //ask user to enter input filename and initiate reader file so we can process file inputed 
        		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        		System.out.print("Enter input filename: ");
        		String filename = reader.readLine();
        		BufferedReader fileReader = new BufferedReader(new FileReader(filename));
        		
        		//definition of SQL queries that will be used to retrieve the necessary data
        		String projectNameQuery = "SELECT PNAME FROM PROJECT WHERE PNUMBER = ?";
        		String departmentQuery = "SELECT DNAME FROM department, project WHERE project.dnum = department.dnumber AND project.pnumber = ?";
        		String managerQuery = "SELECT FNAME, LNAME FROM employee WHERE employee.ssn = (SELECT MGRSSN FROM department, project WHERE project.dnum = department.dnumber AND project.pnumber = ?)";
        		String assignmentsQuery = "SELECT COUNT(*) FROM works_on, project WHERE works_on.pno = project.pnumber AND project.pnumber = ?";
        		
        		//prints the heading for the output
        		System.out.printf("Proj#\t ProjName\t\tDepartment\t\tManager\t\t\t# of assignments"
        				        + "\n------ \t --------------- \t---------------\t\t------------------ \t----------------\n");
        		
        		//runs a loop until there is no more elements in the file read above, iterating line by line and assigning each 
        		//element in a line to projectNumber
        		String projectNumber;
        		while((projectNumber = fileReader.readLine()) != null) {
        			
        			//preparing the projectNameQuery to be executed and also replacing the first occurrence of a ? with the 
        			//project number from the input file 
        			stmt = conn.prepareStatement(projectNameQuery);
        			stmt.clearParameters();
                    stmt.setString(1, projectNumber);
                    
                    //preparing the departmentQuery to be executed and also replacing the first occurrence of a ? with the 
                    //project number from the input file 
                    stmt2 = conn.prepareStatement(departmentQuery);
                    stmt2.clearParameters();
                    stmt2.setString(1, projectNumber);
                    
                    //preparing the managerQuery to be executed and also replacing the first occurrence of a ? with the project 
                    //number from the input file 
                    stmt3 = conn.prepareStatement(managerQuery);
                    stmt3.clearParameters();
                    stmt3.setString(1, projectNumber);
                    
                    //preparing the assignmentsQuery to be executed and also replacing the first occurrence of a ? with the 
                    //project number from the input file 
                    stmt4 = conn.prepareStatement(assignmentsQuery);
                    stmt4.clearParameters();
                    stmt4.setString(1, projectNumber);
                    
                    //executing the queries prepared above and storing the results as a set of values
                    ResultSet pnameResults = stmt.executeQuery();
                    ResultSet dnameResult = stmt2.executeQuery();
                    ResultSet managerResult = stmt3.executeQuery();
                    ResultSet assignmentResult = stmt4.executeQuery();
                    
                    //while loop that will iterate the set of project name results from the query and print it accordingly
                    while(pnameResults.next()) {
                    	String pname = pnameResults.getString(1);
                    	System.out.printf("%s \t %-20s", projectNumber, pname);
                    }//end project while loop 
                    
                    //while loop that will iterate the set of department name results from the query and print it accordingly
                    while(dnameResult.next()) {
                    	String dname = dnameResult.getString(1);
                    	System.out.printf("\t%-20s\t", dname);
                    }//end department while loop 
                    
                    //while loop that will iterate the set of manager name results from the query and print it accordingly
                    while(managerResult.next()) {
                    	String name = managerResult.getString(1);
                    	String lastName = managerResult.getString(2);
                    	
                    	//concatenating the first name and last name with a space in between for easier outputting 
                    	name = name + " " + lastName;
                    	System.out.printf("%-20s", name);
                    }//end manager while loop 
                    
                    //while loop that will iterate the set of work assignments results from the query and print it accordingly
                    while(assignmentResult.next()) {
                    	int assignment = assignmentResult.getInt(1);
                    	
                    	//checks if there is valid assignments and prints the number of assignments accordingly, also adds the 
                    	//number of valid assignments and counts how many valid assignment are present
                    	if(assignment != 0) {
                    		System.out.printf("\t\t%s\n", assignment);
                    		averageAssignment += assignment;
                    		count++;
                    		
                    	}else {
                    		//error message if no valid assignments are present is printed 
                    		System.out.println("Invalid input project number: " + projectNumber);
                    		
                    	}//end if else
                    	
                    }//end assignment while loop 

        		}//end fileReader while loop
        		
        		//Calculates the average of valid assignments by dividing the total of valid projects by the number of projects
        		//(both calculated in the assignment while loop above) then prints the result
        		System.out.println("\nThe average number of work assignments per valid project is: " + (averageAssignment/count));
        		System.out.println("\nBye!");
 
        		//close fileReader and connection streams
        		fileReader.close();
        		conn.close(); 
        		
            }else {
            	//error message if no connection can be established 
            	System.out.println("Unable to establish connection");
            }
          
        //catch phrase to handle SQL exception errors    
        } catch (SQLException se) {
        	//Handle errors for JDBC
        	System.out.println("SQL error. Please revise Queries");
            se.printStackTrace();
            
        //catch phrase to handle forName errors
        } catch (Exception e) {
            //Handle errors for Class.forName
        	System.out.println("Error with class.forName. Please resolve");
            e.printStackTrace();
        }//end try catch
        
	}//end main
}//end class
