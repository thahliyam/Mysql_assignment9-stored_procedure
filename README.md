# Mysql_assignment9-stored_procedure
This task involves working with a Worker table and using stored procedures to perform various operations. The Worker table includes fields like Worker_Id, FirstName, LastName, Salary, JoiningDate, and Department. Through the use of stored procedures, we can efficiently manage and interact with the data in this table.

First, there’s a stored procedure for adding a new record to the table. It takes all the necessary details as input parameters, such as the worker’s ID, name, salary, joining date, and department. By calling this procedure with the required information, we can easily insert a new worker into the table.

Next, there’s a procedure designed to retrieve a worker’s salary based on their ID. It takes the worker’s ID as input and returns the corresponding salary as an output parameter. After calling the procedure, we can view the salary by selecting the value stored in the output variable.

For updating data, there’s a procedure to change a worker’s department. It takes the worker’s ID and the new department as input parameters, updates the department in the table, and reflects the changes instantly.

Additionally, a procedure is created to count the number of workers in a specific department. This procedure takes the department name as input and returns the count of workers in that department. It’s especially useful for quickly analyzing team sizes.

Finally, there’s a procedure to calculate the average salary of workers in a given department. By passing the department name as input, the procedure computes and returns the average salary, allowing us to assess salary trends within a department.

Each of these stored procedures simplifies database interactions, making it easier to perform common tasks like adding, retrieving, updating, and analyzing data efficiently. They demonstrate the power and versatility of stored procedures in managing and manipulating relational data.
