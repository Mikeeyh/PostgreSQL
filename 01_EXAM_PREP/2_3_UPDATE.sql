SELECT id FROM owners WHERE name = 'Kaloqn Stoqnov';

UPDATE 
	animals
SET
	owner_id = 4
WHERE
	owner_id IS NULL
;
SELECT * FROM animals WHERE owner_id IS NULL

-- BETTER WAY

UPDATE 
    animals
SET
    owner_id = (SELECT id FROM owners WHERE name = 'Kaloqn Stoqnov')
WHERE
    owner_id IS NULL
;