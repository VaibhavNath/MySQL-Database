USE University;

SELECT * FROM Student;

SHOW TABLES;

DESC student;

CREATE TABLE COURSE(
	C_ID INT PRIMARY KEY,
    NAME VARCHAR(20),
    C_DATE INT,
    FOREIGN KEY(C_DATE)REFERENCES Student(id)

);

CREATE TABLE Account(
	id INT PRIMARY KEY,
    name VARCHAR(20) UNIQUE,
    balance INT NOT NULL DEFAULT 0,
    CONSTRAINT acc_balance_chk CHECK(balance>1000)
);

DESC Account_details;

INSERT INTO account(id, name, balance) VALUES
				('001', 'Vaibhav', 5000),
                ('002', 'Virat', 2000),
                ('003', 'Prithvi', 30000);
                
SELECT * FROM Account;

INSERT INTO account(id, name, balance) VALUES
				('005', 'Vabhav', 1000);
                
DROP TABLE Account;