---------- Transaction ----------

DROP PROCEDURE IF EXISTS test;

DELIMITER $$
CREATE PROCEDURE test() 
BEGIN
	DECLARE err TINYINT DEFAULT 0; 
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET err = 1;
    
	START TRANSACTION;
    
	INSERT INTO orders
		(id, price, status, secretaryID, clientID)
	VALUES
		(41, 300, 'Received', 6, 7);

	SAVEPOINT point1; 

	INSERT INTO delivery
		(id, pCity, pStreet, pNumber, pPostalCode, dCity, dStreet, dNumber, dPostalCode, date, ordersID, driverID, truckID)
	VALUES
		(20,'Komotini', 'Agios Dimitriou Street', 28, 69100, 
		'Alexandroupoli', 'Old Patras Street', 75, 69131, 
		'2023-06-21', 41, 1,'ZFK-5678');
    
	IF err = 1 THEN
		ROLLBACK TO SAVEPOINT point1;
		SELECT 'An error occurred' AS message;
	ELSE
		COMMIT;
		SELECT 'OK' AS message;
	END IF; 
    
END$$
DELIMITER ;

CALL test(); 

------------------------------------------------------------------
#verify tables are accurate
SELECT * FROM delivery WHERE id=20;

#verify tables are accurate
SELECT * FROM orders WHERE id=41;
