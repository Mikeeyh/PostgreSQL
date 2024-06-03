CREATE TABLE mountains (
	id SERIAl PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE peaks (
	id SERIAl PRIMARY KEY,
	name VARCHAR(50),
	mountain_id INT
);

ALTER TABLE peaks
ADD CONSTRAINT fk_peaks_mountains
	FOREIGN KEY (mountain_id)
		REFERENCES mountains(id)

--  OR

CREATE TABLE mountains (
	id SERIAl PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE peaks (
	id SERIAl PRIMARY KEY,
	name VARCHAR(50),
	mountain_id INT REFERENCES mountains(id)
);

--  OR

CREATE TABLE mountains (
	id SERIAl PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE peaks (
	id SERIAl PRIMARY KEY,
	name VARCHAR(50),
	mountain_id INT,
	CONSTRAINT fk_peaks_mountains
		FOREIGN KEY(mountain_id)
			REFERENCES mountains(id)
);