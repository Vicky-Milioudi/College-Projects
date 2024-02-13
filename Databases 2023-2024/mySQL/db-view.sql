----------# Views ----------
USE omada;

---------- #1 create orders table with order by order id ----------
CREATE OR REPLACE VIEW orders_table_view AS
SELECT orders.id AS "Order ID", delivery.id AS "Delivery ID", CONCAT(client.firstName, ' ', client.lastName) AS "Client Full Name",
concat(pCity, ", ", pStreet, ", ", pNumber) AS "Pick-Up Destination",
concat(dCity, ", ", dStreet, ", ", dNumber) AS "Delivery Destination",
CONCAT(driver.firstName, ' ', driver.lastName) AS "Driver Full Name", truck.id AS "Truck ID"
FROM delivery
	INNER JOIN orders ON delivery.ordersId = orders.id
	INNER JOIN driver ON delivery.driverId = driver.id
	INNER JOIN truck ON delivery.truckID = truck.id
	INNER JOIN client ON orders.clientID = client.id
ORDER BY  CAST(orders.id AS SIGNED) ASC;

-- To show the results of the view
SELECT * FROM orders_table_view;

-----------------------------------------------------------------

---------- #2 create recent deliveries table order by date ----------
CREATE or REPLACE VIEW recent_deliveries_table_view AS
SELECT delivery.id AS 'Recent Deliveries', date
FROM delivery
WHERE date BETWEEN NOW() - INTERVAL 12 MONTH AND NOW()
ORDER BY delivery.date DESC;

-- To show the results of the view
SELECT * FROM recent_deliveries_table_view;
