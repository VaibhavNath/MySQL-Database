CREATE TABLE Dept1(
	empid INT PRIMARY KEY,
    name VARCHAR(20),
    role VARCHAR(10)
);

INSERT INTO Dept1 VALUES
		(1,'A','ENGINEER'),
        (2,'B','SALESMAN'),
        (3,'C','MANAGER'),
        (4,'D','SALESMAN'),
        (5,'E','ENGINEER');
        

CREATE TABLE Dept2(
	empid INT PRIMARY KEY,
    name VARCHAR(20),
    role VARCHAR(10)
);      

INSERT INTO Dept2 VALUES
		(3,'C','MANAGER'),
        (6,'F','MARKETING'),
        (7,'G','SAESMAN');
        
        
-- LIST OUT ALL THE EMP IN THE COMPANY
SELECT * FROM Dept1 UNION SELECT * FROM Dept2;

-- LIST OUT ALL THE EMP IN ALL THE DEPT WHO WORK AS SALESMAN
SELECT * FROM Dept1 WHERE role = 'SALESMAN' UNION SELECT * FROM Dept2 WHERE role = 'SAESMAN';

-- LIST OUT ALL THE EMP WHO WORK FOR BOTH THE DEPT (HERE WE USE JOIN FOR INTERSECT AS SQL HAS NO INTERSECT COMMAND)
SELECT Dept1.* FROM Dept1 INNER JOIN Dept2 using(empid);

-- LIST OUT ALL THE EMP WORKING IN DEPT1 BUT NOT IN DEPT2 ( MINUS SET OPERATION)
SELECT Dept1.* FROM Dept1 LEFT JOIN Dept2 using(empid) WHERE Dept2.empid IS NULL;