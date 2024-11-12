
-- Consider the Worker table with following fields:
-- Worker_Id INT FirstName CHAR(25), LastName CHAR(25), 
-- Salary INT(15), JoiningDate DATETIME, Department CHAR(25)) 
create table worker( Worker_Id INT primary key,FirstName CHAR(25) not null, 
LastName CHAR(25), Salary INT, JoiningDate DATETIME,
 Department CHAR(25));
 
 INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES
(1, 'John', 'Doe', 50000, '2023-01-15', 'HR'),
(2, 'Jane', 'Smith', 60000, '2022-11-20', 'Finance'),
(3, 'Sam', 'Wilson', 55000, '2021-06-10', 'IT'),
(4, 'Anna', 'Taylor', 62000, '2020-03-05', 'HR'),
(5, 'Mike', 'Brown', 48000, '2023-08-01', 'Finance');
desc worker;
select * from worker;


-- 1. Create a stored procedure that takes in IN parameters for 
-- all the columns in the Worker table and adds a new record to
-- the table and then invokes the procedure call. 
delimiter $$
create procedure new_record( IN Worker_Id INT,
    IN FirstName CHAR(25),IN LastName CHAR(25),
    IN Salary INT,IN JoiningDate DATETIME,
    IN Department CHAR(25))
BEGIN
    INSERT INTO Worker(Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (6,'Robert','Brown',50000,'2024-07-11','IT'),
	(7,'NIck','John',50000,'2023-07-11','HR');
END$$
DELIMITER ;
call new_record(7,'NIck','John',50000,'2023-07-11','HR');

select * from worker;

 -- 2. Write stored procedure takes in an IN parameter for 
-- WORKER_ID and an OUT parameter for SALARY. 
-- It should retrieve the salary of the worker with the
-- given ID and returns it in the p_salary parameter. 
-- Then make the procedure call.

Delimiter $$
CREATE procedure worker_salary(in p_id int,Out p_salary varchar(50))
BEGIN
  select Salary into p_salary from worker where Worker_id=p_id;
  END $$
DELIMITER ;

call worker_salary(1,@p_salary);
select @p_salary as salary;


-- 3. Create a stored procedure that takes in IN parameters
-- for WORKER_ID and DEPARTMENT. It should update the department 
-- of the worker with the given ID. Then make a procedure call.
DELIMITER $$

CREATE PROCEDURE Update_Worker_Department
 (IN workers_code INT,IN workers_department CHAR(25))
BEGIN
UPDATE Worker SET department = workers_department 
 WHERE worker_id = workers_code;
END $$
DELIMITER ;

CALL Update_Worker_Department (1,'Marketing');
SELECT * FROM Worker WHERE Worker_Id = 1;

-- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an 
-- OUT parameter for p_workerCount. It should retrieve the number of workers in the given 
-- department and returns it in the p_workerCount parameter.  Make procedure call. 

Delimiter $$
CREATE procedure worker_count(in p_department varchar(20) ,out p_workercount varchar(50))
BEGIN

  select count(*) into p_workercount from worker where Department=p_department;
  END $$
delimiter ;

call worker_count('HR',@p_workercount);
select @p_workercount as Department;


-- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT
-- parameter for p_avgSalary.It should retrieve the average salary of all workers in the given 
-- department and returns it in the p_avgSalary parameter and call the procedure.

DELIMITER $$
CREATE PROCEDURE AverageSalaryByDept(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Worker
    WHERE Department = p_Department;
END$$
DELIMITER ;

CALL AverageSalaryByDept('Finance', @avgSalary);
SELECT @avgSalary AS AverageSalary; 