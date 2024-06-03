-- a)
-- Set custom PK generation using START WITH

CREATE TABLE passports(
	id INT GENERATED ALWAYS AS IDENTITY (START WITH 100 INCREMENT BY 1) PRIMARY KEY,
	nationality VARCHAR(50)
);

INSERT INTO 
	passports (nationality)
VALUES
	('N34FG21B'),
	('K65LO4R7'),
	('ZE657QP2');

SELECT
*
FROM passports;

-- b)
-- Adding new table with FOREIGN KEY to passport ID

CREATE TABLE people(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	salary DECIMAL(10, 2),
	passport_id INT REFERENCES passports(id)
);

INSERT INTO 
	people (first_name, salary, passport_id)
VALUES
	('Roberto', 43300, 101),
	('Tom', 56100, 102),
	('Yana', 60200, 100);

SELECT
*
FROM people

-- b)
-- 2nd way

CREATE TABLE people(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	salary DECIMAL(10, 2),
	passport_id INT,

	CONSTRAINT fk_people_passports
	FOREIGN KEY(passport_id)
	REFERENCES passports(id)
);

INSERT INTO 
	people (first_name, salary, passport_id)
VALUES
	('Roberto', 43300, 101),
	('Tom', 56100, 102),
	('Yana', 60200, 100);

SELECT
*
FROM people

-- TO SEE JOINED 2 TABLES:

SELECT
	*
FROM 
	passports as pass
JOIN 
	people AS peop 
ON 
	peop.passport_id = pass.id;