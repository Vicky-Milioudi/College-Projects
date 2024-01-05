---------- SQL DATABASE ---------- Omada8

---------- CREATE DATABASE ----------

CREATE DATABASE omada
	CHARSET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

USE omada;

---------- CREATE TABLES ----------

---------- #1 create secretary table [ENTITY] ----------
CREATE TABLE secretary(
    id VARCHAR(50) NOT NULL UNIQUE,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    phone BIGINT NULL DEFAULT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    
    CONSTRAINT pk_secretary PRIMARY KEY(id)
);

---------- #2 create driver table [ENTITY] ----------
CREATE TABLE driver(
    id VARCHAR(50) NOT NULL UNIQUE,
    firstName VARCHAR(50) NOT NULL, 
    lastName VARCHAR(50) NOT NULL,
    phone BIGINT DEFAULT NULL,
    
    CONSTRAINT pk_driver_id PRIMARY KEY(id)
);

---------- #3 create truck table [ENTITY] ----------
CREATE TABLE truck(
    id VARCHAR(50) NOT NULL UNIQUE,
    manufacturer VARCHAR(50) DEFAULT NULL,
    capacity  VARCHAR(10) DEFAULT NULL,
    purchaseYear YEAR DEFAULT NULL,
    productionYear YEAR DEFAULT NULL,
    
    CONSTRAINT pk_truck_id PRIMARY KEY(id)
);

---------- #4 create client table [ENTITY] ----------
CREATE TABLE client(
    id VARCHAR(50) NOT NULL UNIQUE,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    
    CONSTRAINT pk_client_id PRIMARY KEY(id)
);

---------- #5 create clientPhone table [RELATIONSHIP] ----------
CREATE TABLE clientphone(
    clientID VARCHAR(50) NOT NULL,
    phone BIGINT NOT NULL UNIQUE,
    
    CONSTRAINT pk_clientPhone PRIMARY KEY(clientID),
    CONSTRAINT fk_clientPhone_clientId FOREIGN KEY(clientId) REFERENCES client(id) ON DELETE CASCADE ON UPDATE CASCADE
);

---------- #6 create orders table [ENTITY] ----------
CREATE TABLE orders(
    id VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL(5, 2) NOT NULL,
    status ENUM('Received', 'Done', 'Cancel') NOT NULL DEFAULT 'Received',
    
    secretaryID VARCHAR(50) NOT NULL,
    clientID VARCHAR(50) NOT NULL,
    
    CONSTRAINT pk_orders PRIMARY KEY(id),
    CONSTRAINT fk_orders_secretaryID FOREIGN KEY(secretaryID)  REFERENCES secretary(id) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_orders_clientID FOREIGN KEY(clientID)  REFERENCES client(id) ON DELETE CASCADE ON UPDATE CASCADE
);


---------- #7 create payment table [ENTITY] ----------
CREATE TABLE payment(
    id VARCHAR(50) NOT NULL UNIQUE,
    amount DECIMAL(5, 2) NOT NULL,
    method ENUM('Cash', 'Card') NOT NULL DEFAULT 'Cash',
    date DATE NOT NULL,
    
    clientID VARCHAR(50) NOT NULL,
    orderID VARCHAR(50) NOT NULL UNIQUE,
     
    CONSTRAINT pk_payment PRIMARY KEY(id),
    CONSTRAINT fk_payment_clientID FOREIGN KEY(clientID) REFERENCES client(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    CONSTRAINT fk_payment_orderID FOREIGN KEY(orderID) REFERENCES orders(id) ON DELETE CASCADE ON UPDATE CASCADE
);

---------- #8 create delivery table [ENTITY] ----------
CREATE TABLE delivery(
    id VARCHAR(50) NOT NULL UNIQUE,
    date DATE NOT NULL,
    pCity VARCHAR(50) NOT NULL,
    pStreet VARCHAR(50) NOT NULL,
    pNumber BIGINT NOT NULL,
    pPostalCode BIGINT NULL DEFAULT NULL,
    dCity VARCHAR(50) NOT NULL,
    dStreet VARCHAR(50) NOT NULL,
    dNumber BIGINT NOT NULL,
    dPostalCode BIGINT NULL DEFAULT NULL,

    ordersID VARCHAR(50) NOT NULL UNIQUE,
    driverID VARCHAR(50) NOT NULL,
    truckID VARCHAR(50) NOT NULL,
    
    CONSTRAINT pk_delivery PRIMARY KEY(id, ordersID),
    CONSTRAINT fk_delivery_ordersID FOREIGN KEY(ordersID) REFERENCES orders(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_delivery_driverID FOREIGN KEY(driverID) REFERENCES driver(id) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_delivery_truckID FOREIGN KEY(truckID) REFERENCES truck(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

---------- #9 create manages table [RELATIONSHIP] ----------
CREATE TABLE manages(
    secretaryID VARCHAR(50) NOT NULL,
    driverID VARCHAR(50) NOT NULL,
    
    CONSTRAINT pk_manages PRIMARY KEY (secretaryID, driverID),
    CONSTRAINT fk_manages_secretaryId FOREIGN KEY(secretaryID) REFERENCES secretary(id),
    CONSTRAINT fk_manages_driverId FOREIGN KEY(driverID) REFERENCES driver(id)
);

---------- #10 create records table [RELATIONSHIP] ----------
CREATE TABLE records(
    secretaryID VARCHAR(50) NOT NULL,
    ordersID VARCHAR(50) NOT NULL,
    
    CONSTRAINT pk_records PRIMARY KEY (secretaryID, ordersID),
    CONSTRAINT fk_records_secretary FOREIGN KEY(secretaryID) REFERENCES secretary(id),
    CONSTRAINT fk_records_ordersId FOREIGN KEY(ordersID) REFERENCES orders(id)
);
