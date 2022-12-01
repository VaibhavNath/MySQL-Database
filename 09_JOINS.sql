USE University;

CREATE TABLE Project(
	id INT PRIMARY KEY,
    empID INT,
    name varchar(20),
    startdate DATE,
    clientID INT,
    FOREIGN KEY (empID)
		REFERENCES EMP(id),
	FOREIGN KEY (clientID)
		REFERENCES Client(id)
);

INSERT INTO Project (id, empID, name, startdate, clientID) VALUES
	(1,1,'A','21-04-21',3),
    (2,2,'B','12-03-21',1),
    (3,3,'C','16-01-21',5),
    (4,3,'D','27-04-21',2),
    (5,5,'E','01-05-21',4);
    
CREATE TABLE EMP(
	id INT PRIMARY KEY, 
    fname VARCHAR(20),
    lname VARCHAR(20),
    Age INT,
    emailID VARCHAR(50),
    Phone INT,
    City VARCHAR(15)
);

INSERT INTO EMP(id,fname,lname,Age,emailID, Phone,City)VALUES
		(1,'VAIBHAV','NATH',21,'VAIBHAV@GMAIL.COM',898,'DELHI'),
        (2,'VIRAT','NATH',20,'VIRAT@HOTMAIL.COM',222,'PALAM'),
        (3,'PRITHVI','NATH',15,'PRITHVI@GMAIL.COM',444,'KOLKATA'),
        (4,'TIMTIM','TARA',14,'TIMTIMTARA@YAHOO.COM',666,'RAIPUR'),
        (5,'ADI','NATH',30,'ADI@GAMIL.COM',555,'JAIPUR');
        
CREATE TABLE Client(
	id INT PRIMARY KEY,
    first_name VARCHAR(10),
    last_name VARCHAR(10),
    Age INT,
    emailID VARCHAR(30),
    phone INT,
    City VARCHAR(20),
    empID INT,
    FOREIGN KEY (empID)
		REFERENCES EMP(id)
);

INSERT INTO Client(id, first_name, last_name, Age, emailId, phone, City, empID) VALUES
		(1,'MAC','ROGERS',47,'MAC@GMAIL.COM',333,'Kolkata',3),
        (2,'MAX','PON',27,'MAX@YAHOO.COM',222,'KOLKATA',3),
        (3,'PETER','ENGLAND',24,'PETER@W.COM',111,'DELHI',1),
        (4,'SUSHANT','KUMAR',24,'S@GMAUL.COM',45454,'HYDERABAD',5),
        (5,'PRATAP','SINGH',36,'PRATAP@YHOO.COM',77767,'MUMBAI',2);
        
        
-- INNER JOIN
-- ENLIST ALL THE EMP ID'S, NAME ALONG WITH THE PROJECTS ALLOCATED TO THEM.
SELECT e.id, e.fname, e.lname, p.id, p.name FROM EMP as e INNER JOIN PROJECT as p on e.id = p.empID;
SELECT e.id, e.fname, e.lname, p.id, p.name FROM Emp as e, Project as p WHERE e.id = p.empID; -- joining w/o using join keyword


-- FETCH OUT ALL THE EMP ID AND THEIR CONTACT DETAILS WHO HAVE BEEN WORKING
-- FROM JAIPUR WITH THE CLIENT NAME WORKING IN HYDERABAD
SELECT e.id, e.emailID, e.phone, c.first_name, c.last_name FROM Emp as e INNER JOIN Client as c on e.id = c.empID 
WHERE e.City='Jaipur' and c.City='Hyderabad'; 


-- LEFT JOIN
-- FETCH OUT EACH PROJECT ALLOCATED TO EACH EMP
SELECT  * FROM Emp as e LEFT JOIN Project as p on e.id = p.empID;


-- RIGHT JOIN
-- LIST OUT ALL THE PROJECTS ALONG WITH THE EMP NAME AND EMAIL ID
SELECT p.id, p.name ,e.fname, e.lname, e.emailID FROM Emp as e RIGHT JOIN Project as p on e.id = p.empID;
SELECT p.id, p.name ,e.fname, e.lname, e.emailID FROM Project as p LEFT JOIN EmP as e on e.id = p.empID;  -- SAME QUERY BY LEFT JOIN


-- CROSS JOIN 
-- LIST OUT ALL THE COMBINATION POSSIBLE FROM EMP NAME AND PROJECTS THAT CAN EXIST.
SELECT e.fname, e.lname , p.id, p.name FROM Emp as e CROSS JOIN Project as p;