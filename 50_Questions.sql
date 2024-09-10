-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT First_Name AS Worker_name FROM Worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(First_Name) AS upper_case_name FROM Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT Department FROM Worker
GROUP BY Department;

SELECT distinct Department FROM Worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT substring(First_Name, 1, 3) FROM Worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT instr(First_Name, 'b') FROM Worker WHERE First_Name = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT rtrim(First_Name) FROM Worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT ltrim(First_Name) FROM Worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT distinct Department, length(Department) FROM Worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT replace(First_Name, 'a', 'A') FROM Worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT concat(First_Name," " ,Last_Name) as Complete_Name from Worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM Worker ORDER BY First_Name asc;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM Worker ORDER BY First_Name asc, Department desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker WHERE First_Name = "Vipul" or First_Name = "Satish";

SELECT * FROM Worker WHERE First_Name IN ("Vipul", "Satish");

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker WHERE First_Name NOT IN ("Vipul", "Satish");

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM Worker WHERE Department LIKE "Admin%";

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM Worker WHERE First_Name LIKE "%a%";

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM Worker WHERE First_Name LIKE "%a";

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM Worker WHERE First_Name LIKE "_____h";

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM Worker WHERE Salary BETWEEN 100000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM Worker WHERE Joining_Date LIKE "2014-02%";

SELECT * FROM Worker WHERE YEAR(joining_date) = 2014 AND MONTH(joining_date) = 02;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT Department, COUNT(*) FROM Worker WHERE Department = "Admin";

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT concat(first_Name," ", Last_Name) AS full_name FROM Worker WHERE Salary >= 50000 and Salary <= 100000;

SELECT concat(first_Name," ", Last_Name) AS full_name FROM Worker WHERE Salary BETWEEN 50000 and 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT Department, COUNT(Worker_Id) FROM Worker 
GROUP BY Department
ORDER BY COUNT(Worker_Id) desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT w.* FROM Worker as w INNER JOIN Title as t on w.Worker_Id = t.WORKER_REF_ID WHERE t.WORKER_TITLE = "Manager";

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT 	WORKER_TITLE, COUNT(*) AS count_title FROM Title
GROUP BY WORKER_TITLE HAVING count_title > 1;

-- Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Worker WHERE MOD (Worker_Id, 2) != 0;
SELECT * FROM Worker WHERE MOD (Worker_Id, 2) <> 0;

-- Q-27. Write an SQL query to show only even rows from a table. 
SELECT * FROM Worker WHERE MOD (Worker_Id, 2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE Worker_clone LIKE Worker; -- clone the schema of Worker 
INSERT INTO Worker_clone SELECT * FROM Worker; -- copy the data from Worker table to Worker_clone
SELECT * FROM Worker_clone;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT Worker.* FROM Worker INNER JOIN Worker_clone USING(Worker_Id);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
SELECT Worker.* FROM Worker LEFT JOIN Worker_clone USING(Worker_Id) WHERE Worker_clone.Worker_Id = NULL;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
SELECT curDate();
SELECT now();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
SELECT * FROM Worker ORDER BY Salary desc LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM Worker ORDER BY Salary desc LIMIT 4,1;  -- 4 is offset and after that is first, (4th hata ke next wala 1)

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword. (# IMP)
SELECT * FROM Worker w1
WHERE 4 = (
	SELECT COUNT(distinct (w2.salary))
    FROM Worker w2
    WHERE w2.Salary >= w1.Salary
);

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT w1.* FROM Worker w1, Worker w2 WHERE w1.Salary = w2.Salary AND w1.Worker_Id != w2.Worker_Id;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
SELECT max(Salary) FROM Worker
WHERE Salary NOT IN (SELECT max(Salary) FROM Worker);

SELECT * FROM Worker w1
WHERE 2 = (
	SELECT COUNT(distinct (w2.salary))
    FROM Worker w2
    WHERE w2.Salary >= w1.Salary
); 

-- Q-37. Write an SQL query to show one row twice in results from a table.
SELECT * FROM Worker
UNION ALL
SELECT * FROM Worker ORDER BY Worker_ID;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
SELECT Worker_Id FROM Worker WHERE Worker_Id NOT IN (SELECT Worker_ref_Id FROM Bonus);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM Worker WHERE Worker_Id <= (SELECT COUNT(Worker_Id)/2 FROM Worker);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT Department, COUNT(Department) as count_dep FROM Worker GROUP BY Department HAVING count_dep < 4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT Department, COUNT(Department) as count_dep FROM Worker GROUP BY Department;

-- Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM Worker WHERE Worker_Id = (SELECT max(Worker_Id) FROM Worker);

-- Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM Worker WHERE Worker_Id = (SELECT min(Worker_Id) FROM Worker);

-- Q-44. Write an SQL query to fetch the last five records from a table.
(SELECT * FROM Worker ORDER BY Worker_Id desc LIMIT 5) ORDER BY Worker_Id;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.  (# IMP)
SELECT w.First_Name, w.Last_Name, w.Salary, w.Department FROM 
(SELECT MAX(Salary) AS max_Salary, Department FROM Worker GROUP BY Department) AS temp
INNER JOIN Worker w ON temp.department = w.department and temp.max_Salary = w.Salary;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
SELECT distinct Salary FROM Worker w1
WHERE 3 >= (SELECT COUNT(distinct Salary) FROM Worker w2 WHERE w1.Salary <= w2.Salary) ORDER BY w1.Salary desc;

SELECT distinct Salary FROM Worker ORDER BY Salary desc LIMIT 3;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
SELECT distinct Salary FROM Worker w1
WHERE 3 >= (SELECT COUNT(distinct Salary) FROM Worker w2 WHERE w1.Salary >= w2.Salary) ORDER BY w1.Salary desc;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT distinct Salary FROM Worker w1
WHERE n >= (SELECT COUNT(distinct Salary) FROM Worker w2 WHERE w1.Salary <= w2.Salary) ORDER BY w1.Salary desc;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT Department, MAX(Salary) AS max_salary FROM Worker GROUP BY Department ORDER BY max_salary desc; 

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT First_Name, Last_Name, Salary FROM Worker WHERE Salary = (SELECT max(Salary) FROM Worker);

-- Q-51. Write an SQL query to fetch the names of workers who earn the highest salary with Alphabetical Order.
SELECT First_Name, Last_Name, Salary
FROM Worker
WHERE Salary = (SELECT MAX(Salary) FROM Worker)
ORDER BY First_Name ASC, Last_Name ASC LIMIT 1;

