-- select command

SELECT * FROM Worker;
SELECT FIRST_NAME , SALARY FROM Worker;
SELECT 44+8;
SELECT NOW(); -- to view the current date time 
SELECT LCASE('VAIBHAV');
SELECT UCASE('vaibhav');

-- where 
SELECT * FROM Worker WHERE SALARY > 100000;
SELECT * FROM Worker WHERE SALARY > 100000 && LAST_NAME = 'Nath' ;

-- betweeen 
SELECT * FROM Worker WHERE SALARY BETWEEN 80000 AND 500000;

-- reduce OR statements -- use of IN 
SELECT * FROM Worker WHERE DEPT = "HR" OR DEPT = "ADMIN";
SELECT * FROM Worker WHERE DEPT IN ('HR', 'ADMIN');

-- use of NOT
SELECT * FROM Worker WHERE DEPT NOT IN ('HR', 'ADMIN');

-- use of Is NULL 
SELECT * FROM Worker WHERE DEPT Is NULL;

-- use of LIKE
SELECT * FROM Worker WHERE First_name LIKE '%i%';
SELECT * FROM Worker WHERE First_name LIKE '_i%';

-- sort values
SELECT * FROM Worker ORDER BY Salary; # for ascending order
SELECT * FROM Worker ORDER BY Salary DESC; #for descending order

-- use of distinct
SELECT DISTINCT Dept FROM Worker;

-- GROUP BY, AGGREGATE FUNCTION
SELECT Dept, COUNT(Dept) FROM Worker GROUP BY Dept;
SELECT Dept, AVG(Salary) FROM Worker GROUP BY Dept;
SELECT Dept, MIN(Salary) FROM Worker GROUP BY Dept;
SELECT Dept, MAX(Salary) FROM Worker GROUP BY Dept;
SELECT Dept,SUM(Salary) FROM Worker GROUP BY Dept;

-- GROUP BY WITH HAVING
SELECT Dept, COUNT(Dept) FROM Worker GROUP BY Dept HAVING COUNT(Dept)>1;