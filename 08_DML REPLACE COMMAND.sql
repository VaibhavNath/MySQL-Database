SELECT * FROM Customer;
INSERT INTO Customer VALUES(002, 'VAIBHAV', 'AVAS VIKAS', 'M', 'GONDA', 271002);

-- REPLACE
REPLACE INTO Customer (id, City) VALUES(1211, 'PUNE'); -- ACT AS INSERT
REPLACE INTO Customer (id, City) VALUES(1, 'PUNE');  -- ACT AS REPLACE
REPLACE INTO Customer SET id = 3, cname ='Virat', City = 'BOMBAY';  -- ANOTHER WAY TO REPLACE OR ADD ROW
REPLACE INTO Customer SET id = 6, cname ='Virat', City = 'BOMBAY';  -- ANOTHER WAY TO REPLACE OR ADD ROW
REPLACE INTO Customer (id, cname, city)
	SELECT id, cname, city
    FROM Customer WHERE id = 2;