ALTER TABLE minions_info
ADD COLUMN email varchar(20),
ADD COLUMN equipped BOOLEAN NOT NULL DEFAULT FALSE;

ALTER TABLE minions_info
ADD COLUMN email varchar(20),
ADD COLUMN equipped BOOLEAN NOT NULL;