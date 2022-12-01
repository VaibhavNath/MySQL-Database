CREATE DATABASE org;
SHOW databases;
USE org;
SHOW TABLES;

CREATE TABLE Worker(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATE,
    DEPT CHAR(25)
);

INSERT INTO Worker
			(WORKER_ID , FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPT) VALUES
            (001, 'Vaibhav', 'Nath', 100000, '16-02-17', 'HR'), 
            (002, 'Virat', 'Nath', 200000, '03-02-20', 'IT'), 
            (003, 'Prithvi', 'Nath', 400000, '02-11-21', 'ADMIN'), 
            (004, 'Vivek', 'Kumar', 500000, '22-01-09', 'HR'), 
            (005, 'Pushkar', 'Kasaudhan', 1000000, '12-06-21', 'ADMIN'), 
            (006, 'Prabhakar', 'Kasaudhan', 600000, '27-02-20', 'ACCOUNT'), 
            (007, 'Ananya', 'Gupta', 75000, '25-10-20', 'HR'), 
            (008, 'Aditya', 'Nath', 420000, '25-11-21', 'IT');
            
SELECT * FROM Worker;

CREATE TABLE Bonus(
	WORKER_REF_ID INT,
    BONUS_AMT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus
			(WORKER_REF_ID, BONUS_AMT, BONUS_DATE) VALUES
            ('001', 5000 , '16-02-20'),
            ('002', 10000 , '26-06-21'),
            ('003', 8000 , '04-11-22'),
            ('002', 2000 , '16-02-22'),
            ('002', 10000 , '16-08-20');
            
SELECT * FROM Bonus;

CREATE TABLE Title(
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title
			(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
            ('001', 'Manager' , '16-02-20'),
            ('002', 'Executive' , '26-06-21'),
            ('008', 'Executive' , '04-11-22'),
            ('005', 'Manager' , '16-02-22'),
            ('004', 'Assis. Manager' , '16-08-20'),
            ('007', 'Executive' , '16-02-20'),
            ('006', 'Lead' , '26-06-21'),
            ('003', 'Lead' , '04-11-22');