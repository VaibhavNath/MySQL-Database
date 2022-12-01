USE org;

SHOW TABLES;

-- QUERY TO FETCH FIRST_NAME FROM WORKER TABLE USING FROM ALIAS NAME AS <WORKER_NAME>
SELECT first_name AS WORKER_NAME FROM Worker;

-- QUERY TO FETCH FIRST_NAME FROM WORKER TABLE IN UPPER CASE
SELECT UPPER(first_name) FROM Worker; 

-- QUERY TO FETCH UNIQUE VALES OF DEPT FROM WORKER TABLE
SELECT Dept FROM Worker GROUP BY Dept;  -- OR
SELECT DISTINCT(Dept) FROM Worker;

-- SQL QUERY TO PRINT THE FIRST THREE CHARACTERS OF FIRST_NAME FROM WORKER TABLE
SELECT substring(first_name, 1, 3) FROM Worker;

-- QUERY TO FIND THE POSITION OF THE ALPHABET 'B' IN THE FIRST_NAME COLUMN 'VAIBHAV' FRM WORKER TABLE
SELECT INSTR(first_name, 'B') FROM Worker WHERE first_name = 'VAIBHAV';

-- QUERY TO PRINT THE FIRST_NAME FROM WORKER TABLE AFTER REMOVING WHITE SPACES FROM RIGHT SIDE
SELECT RTRIM(FIRST_NAME) FROM Worker;

-- QUERY TO PRINT THE FIRST_NAME FROM WORKER TABLE AFTER REMOVING WHITE SPACES FROM LEFT SIDE
SELECT LTRIM(FIRST_NAME) FROM Worker;

-- QUERY THAT FETCHES A UNIQUE VALUE OF DEPT FROM WORKER TABLE AND PRINTS ITS LENGTH
SELECT Dept, LENGTH(Dept) FROM Worker GROUP BY Dept;

-- QUERY TO PRINT FIRST_NAME FROM WORKER AFTER REPLACING 'a' WITH 'A'
SELECT REPLACE(first_name,'a','A') FROM Worker;

-- QUERY TO PRINT FIRST_NAME AND LAST_NAME FROM WORKER TABLE INTO A SINGLE COLUMN COMPLETE_NAME
SELECT CONCAT(first_name,' ',last_name) AS COMPLETE_NAME FROM Worker;

-- QUERY TO PRINT ALL WORKER DETAILS FROM WORKER TABLE ORDER BY FIRST_NAME ASCENDING.
SELECT * FROM Worker ORDER BY first_name;

-- QUERY TO PRINT ALL WORKER DETAILS FROM WORKER TABLE ORDER BY FIRST_NAME ASCENDING AND DEPT DESCENDING.
SELECT * FROM Worker ORDER BY first_name , Dept DESC;

-- QUERY TO PRINT DETAILS OF WORKER WITH F_NAME AS 'PRITHVI' AND 'ADI' FROM WORKER TABLE
SELECT * FROM Worker WHERE first_name IN ('PRITHVI', 'VIVEK');

-- QUERY TO PRINT DETAILS OF WORKER WITH F_NAME EXCLUDING 'PRITHVI' AND 'ADI' FROM WORKER TABLE
SELECT * FROM Worker WHERE first_name NOT IN ('PRITHVI', 'VIVEK');

-- QUERY TO PRINT DETAILS OF WORKERS WITH DEPT AS 'ADMIN'
SELECT * FROM Worker WHERE Dept = 'ADMIN'; -- OR
SELECT * FROM Worker WHERE Dept LIKE 'ADMIN%';

-- QUERY TO PRINT DETAILS OF PERSON WHOSE FIRST_NAME CONTAINS 'A'
SELECT * FROM Worker WHERE first_name LIKE '%A%';

-- QUERY TO PRINT DETAILS OF PERSON WHOSE FIRST_NAME ENDS WITH 'A'
SELECT * FROM Worker WHERE first_name LIKE '%A';

-- QUERY TO PRINT DETAILS OF PERSON WHOSE FIRST_NAME ENDS WITH 'A' AND CONTAIN SIX ALPHABETS.
SELECT * FROM Worker WHERE first_name LIKE '%A' AND LENGTH(first_name) = 6;  -- OR
SELECT * FROM Worker WHERE first_name LIKE '_____A';

-- QUERY TO PRINT DETAILS OF PERSON WHOSE SALARY LIES BETWEEN 100000 AND 500000.
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 500000;

-- QUERY TO PRINT DETAILS OF PERSON WHO HAVE JOINED IN FEB-2027.
SELECT * FROM Worker WHERE YEAR(joining_date) = 2027 AND MONTH(joining_date) = 02;

-- QUERY TO FETCH COUNT OF EMP WORKING IN DEPT 'ADMIN'
SELECT Dept, COUNT(Dept) FROM Worker WHERE Dept = 'Admin';

-- QUERY TO FETCH FULLNAME OF EMP WITH SALARY == 100000 AND SALARY == 400000
SELECT CONCAT(first_name,' ', last_name) FROM Worker WHERE SALARY BETWEEN 100000 AND 400000;

-- QUERY TO FETCH THE NO. OF WORKERS FOR EACH DEPT. IN ASCENDING ORDER
SELECT Dept, COUNT(worker_id) AS no_of_workers FROM Worker GROUP BY Dept ORDER BY Dept ASC;

-- QUERY TO PRINT DETAILS OF EMP WHO ARE ALSO MANAGER
SELECT w.* FROM Worker as w INNER JOIN Title as t on w.worker_id = t.worker_ref_id WHERE t.worker_title = 'MANAGER'; 

-- QUERY TO FETCH NO.(MORE THAN 1) OF SAME TITLE IN AN ORGANIZATION OF DIFFERENT TYPES
SELECT Worker_title, COUNT(Worker_title) FROM Title GROUP BY Worker_title HAVING COUNT(Worker_title)>1;

-- QUERY TO SHOW ONY ODD ROWS FROM A TABLE
SELECT * FROM Worker WHERE MOD(Worker_ID, 2);  -- OR
SELECT * FROM Worker WHERE MOD(Worker_ID, 2) <> 0;

-- QUERY TO SHOW ONY EVEN ROWS FROM A TABLE
SELECT * FROM Worker WHERE MOD(Worker_ID, 2) = 0;

-- QUERY TO CLONE A NEW TABLE FROM ANOTHER TABLE
CREATE TABLE worker_clone LIKE Worker;  -- IT JUST CREATE SAME SCHEMA WITH NO DATA
INSERT INTO worker_clone SELECT * FROM Worker;  -- COPY ALL DATE FROM WORKER TABLE
SELECT * FROM WORKER_CLONE;

-- QUERY TO FETCH INTERSCETING RECORDS OF TWO TABLE
SELECT worker.* FROM Worker INNER JOIN Worker_clone USING(worker_id);

-- QUERY TO SHOW RECORDS FROM ONE TABLE THAT ANOTHER TABLE DON'T HAVE.
SELECT worker.* FROM Worker LEFT JOIN Worker_clone USING(Worker_id) WHERE Worker_clone.worker_id IS NULL;

-- QUERY TO SHOW CURRENT DATE AND TIME
SELECT NOW();
SELECT CURDATE(); -- FOR ONLY DATE

-- QUERY TO SHOW THE TOP N(SAY 5) RECORDS FROM TABLE IN DESCENDING ORDER
SELECT * FROM Worker ORDER BY SALARY DESC LIMIT 5;

-- QUERY TO DETERMINE THE NTH HIGHEST SALARY FROM TABLE
SELECT MAX(Salary) FROM Worker WHERE Salary <> (SELECT MAX(Salary) FROM Worker);  -- 2nd HIGHEST
SELECT Salary FROM Worker AS w1 WHERE 4 = (SELECT COUNT(DISTINCT Salary) FROM Worker AS w2 WHERE w2.Salary > w1.Salary);  -- 4TH HIGHEST
SELECT * FROM Worker ORDER BY Salary DESC LIMIT 4,1;  -- 4TH HIGHEST i.e. [(N-1),1]

-- QUERY TO FETCH THE LIST OF EMP WITH SAME SALARY
SELECT * FROM Worker W1, Worker W2 WHERE W1.Salary = W2.Salary AND W1.worker_id <> W2.worker_id;

-- QUERY TO SHOW A ROW TWICE IN RESULT TABLE
SELECT * FROM Worker
UNION ALL
SELECT * FROM Worker ORDER BY worker_id;

SELECT * FROM Worker;