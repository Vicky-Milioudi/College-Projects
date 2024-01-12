---------- Trigger ----------
USE omada;

DELIMITER //
CREATE TRIGGER updateOrderPrice
AFTER INSERT ON payment
FOR EACH ROW
BEGIN
    UPDATE orders
    SET price = price + NEW.amount
    WHERE id = NEW.orderId;
END//
DELIMITER ;

-- verify tables are accurate
INSERT INTO orders (id, secretaryID, clientID)
VALUES (18, 9, 4);

INSERT INTO payment (id, amount, date, clientID, orderID)
VALUES (18, 50.00, '2023-01-12', 2, 18);

SELECT * FROM orders WHERE id = 18;
