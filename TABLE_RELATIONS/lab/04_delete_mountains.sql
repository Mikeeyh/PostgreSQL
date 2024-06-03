CREATE TABLE mountains(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE peaks(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50),
	mountain_id INT,
	CONSTRAINT fk_mountain_id FOREIGN KEY(mountain_id)
		REFERENCES mountains(id)
			ON DELETE CASCADE
				-- ON UPDATE CASCADE
);

-- Adding FOREING KEY to 'mountain_id'
-- Setting ON DELETE CASCADE so if we delete the mountain, this will auto-delete all peaks

-- OR (if we do not have a particular name of the constraint):

CREATE TABLE mountains(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE peaks(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50),
	mountain_id INT REFERENCES mountains(id) ON DELETE CASCADE

);
