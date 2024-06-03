--  CREATING TABLES

CREATE TABLE men(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(20)
);

CREATE TABLE women(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(20)
);

CREATE TABLE men_women(
	men_id INT REFERENCES men(id),
	women_id INT REFERENCES women(id),
	CONSTRAINT pk_men_women
		PRIMARY KEY(men_id, women_id)
);

-- INSERT DATA

INSERT INTO men(name)
VALUES
	('Mitko'),
	('Pitko'),
	('Ditko'),
	('Kitko')

INSERT INTO women(name)
VALUES
	('Veli'),
	('Meli'),
	('Keli'),
	('Neli'),

-- INSERT DATA

INSERT INTO men_women(men_id, women_id))
VALUES
	(1, 1),
	(1, 2),
	(2, 1),
    (2, 3),
    (2, 4),
    (3, 2),
    (3, 3),
    (4, 1),
    (4, 4)

-- How to take data to see how with how is married:

SELECT
    *
FROM men as m 
    JOIN men_women as mw ON 
        m.id = mw.men_id
            JOIN women as w 
                w.id = mw.women_id