SELECT 
	MIN(deposit_charge)
FROM wizard_deposits

-- OR

SELECT 
	deposit_charge AS minimum_deposit_charge
FROM wizard_deposits
ORDER BY deposit_charge
LIMIT 1