SELECT * FROM Emp;

-- CREATING A VIEW
CREATE VIEW custom_view AS SELECT fname, age FROM Emp;

-- VIEWING FROM VIEW
SELECT * FROM custom_view;

-- ALTERING THE VIEW
ALTER VIEW custom_view AS SELECT fname, lname, age FROM Emp;

-- DROPPING VIEW
DROP VIEW IF EXISTS custom_view;