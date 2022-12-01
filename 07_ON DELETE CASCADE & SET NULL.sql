USE university;
CREATE TABLE Customer(
id INT PRIMARY KEY,
cname VARCHAR(30),
Address VARCHAR(50),
Gender VARCHAR(10),
City VARCHAR(20),
Pincode INT
);

INSERT INTO Customer VALUES(001, 'VAIBHAV', 'AVAS VIKAS', 'M', 'GONDA', 271002);

SELECT * FROM Customer;


CREATE TABLE Order_details(
order_id INT PRIMARY KEY,
delivery_date DATE,
cust_id INT,
FOREIGN KEY(cust_id)REFERENCES Customer(id) ON DELETE SET NULL / CASCADE -- DELETE THE ROW FROM CHILD TABLE AS WELL
);

INSERT INTO Order_details VALUES(3, '19-11-22', 1);
INSERT INTO Order_details VALUES(4, '09-11-22', 1);

SELECT * FROM Order_details;

DELETE FROM CUstomer WHERE ID = 1;