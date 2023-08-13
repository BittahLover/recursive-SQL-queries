CREATE DATABASE lab6
USE lab6


--1
CREATE TABLE ParentOf (
	parent VARCHAR(40) NOT NULL,
	child VARCHAR(40) NOT NULL
);

INSERT INTO ParentOf VALUES ('Alice', 'Carol');
INSERT INTO ParentOf VALUES ('Bob', 'Carol');
INSERT INTO ParentOf VALUES ('Carol', 'Dave');
INSERT INTO ParentOf VALUES ('Carol', 'George');
INSERT INTO ParentOf VALUES ('Dave', 'Mary');
INSERT INTO ParentOf VALUES ('Eve', 'Mary');
INSERT INTO ParentOf VALUES ('Mary', 'Frank');

WITH MariesAncestors AS (
  SELECT parent, child FROM ParentOf WHERE child = 'Mary'
  UNION ALL
  SELECT p.parent, p.child FROM ParentOf p JOIN MariesAncestors ma
  ON ma.parent = p.child
)
SELECT parent FROM MariesAncestors;

WITH CarolsDescendants AS (
  SELECT parent, child FROM ParentOf WHERE parent = 'Carol'
  UNION ALL
  SELECT p.parent, p.child FROM ParentOf p JOIN CarolsDescendants cd
  ON cd.child = p.parent
)
SELECT child FROM CarolsDescendants;


--2
CREATE TABLE Employee(
	ID INT PRIMARY KEY, 
	salary INT NOT NULL
); 

CREATE TABLE Manager(
	mID INT NOT NULL,
	eID INT REFERENCES Employee (ID) NOT NULL
);

CREATE TABLE Project(
	name VARCHAR(40) NOT NULL, 
	mgrID INT NOT NULL
);

INSERT INTO Employee VALUES (123, 100);
INSERT INTO Employee VALUES (234, 90);
INSERT INTO Employee VALUES (345, 80);
INSERT INTO Employee VALUES (456, 70);
INSERT INTO Employee VALUES (567, 60);
INSERT INTO Manager VALUES (123, 234);
INSERT INTO Manager VALUES (234, 345);
INSERT INTO Manager VALUES (234, 456);
INSERT INTO Manager VALUES (345, 567);
INSERT INTO Project VALUES ('X', 123);

WITH SalarySum(ID) AS (
	SELECT mgrID AS ID 
	FROM Project 
	WHERE name = 'X'
    UNION ALL
    SELECT eID AS ID
    FROM Manager m, SalarySum ss
    WHERE m.mID = ss.ID
)
SELECT SUM(salary) AS SumSalary FROM Employee WHERE ID in (SELECT ID FROM SalarySum);


--3
WITH FIBONACHI AS (
	SELECT 
		1 Iteration, 
		0 SecondValue, 
		1 CurrentValue
	UNION ALL
	SELECT 
		Iteration + 1, 
		SecondValue = CurrentValue, 
		CurrentValue = SecondValue + CurrentValue 
	FROM FIBONACHI 
	WHERE Iteration < 10
)
SELECT CurrentValue FROM FIBONACHI;


