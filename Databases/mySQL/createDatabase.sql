---------- SQL DATABASE ----- Omada8

---------- CREATE DATABASE ----------

CREATE DATABASE omada8
	CHARSET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

USE omada8;

---------- CREATE TABLES ----------

---------- create secretary table ----------
CREATE TABLE secretary(
	id VARCHAR(10) NOT NULL UNIQUE,
    	firstName VARCHAR(30) NOT NULL,
    	lastName VARCHAR(50) NOT NULL,
    	phone BIGINT NULL DEFAULT NULL,
    	username VARCHAR(20) NOT NULL,
    	password VARCHAR(50) NOT NULL,
    
    	CONSTRAINT pk_secretary PRIMARY KEY(id)
);

CREATE INDEX secretary_Name_idx 
ON secretary(firstName, lastName);

CREATE INDEX secretary_phone_idx 
ON secretary(phone);

---------- create client table ----------
CREATE TABLE client(
	id VARCHAR(10) NOT NULL UNIQUE,
    	firstName VARCHAR(30) NOT NULL,
    	lastName VARCHAR(50) NOT NULL,
    
    	CONSTRAINT pk_client_id PRIMARY KEY(id)
);

CREATE INDEX client_Name_idx
ON client(firstName, lastName);

CREATE TABLE clientPhone(
	clientId VARCHAR(10) NOT NULL,
	phone BIGINT NOT NULL,
    
    	CONSTRAINT pk_clientPhone PRIMARY KEY(clientId, phone),
    
    	CONSTRAINT fk_clientPhone_clientId FOREIGN KEY(clientId) REFERENCES client(id) ON DELETE CASCADE
);

CREATE INDEX clientPhone_phone_idx
ON clientPhone(phone);

---------- create driver table ----------
CREATE TABLE driver(
	id VARCHAR(10) NOT NULL UNIQUE,
    	firstName VARCHAR(30) NOT NULL, 
    	lastName VARCHAR(50) NOT NULL,
    	phone BIGINT DEFAULT NULL,
    
    	CONSTRAINT pk_driver_id PRIMARY KEY(id)
);

CREATE INDEX driver_Name_idx 
ON driver(firstName, lastName);

CREATE INDEX driver_phone_idx 
ON driver(phone);

---------- create truck table ----------
CREATE TABLE truck(
	id VARCHAR(30) NOT NULL UNIQUE,
    	manufacturer VARCHAR(30) DEFAULT NULL,
    	capacity  VARCHAR(10) DEFAULT NULL,
    	purchaseYear YEAR DEFAULT NULL,
    	productionYear YEAR DEFAULT NULL,
    
    	driverId VARCHAR(10) NOT NULL,
    
    	CONSTRAINT pk_truck_id PRIMARY KEY(id),
    	CONSTRAINT fk_truck_dirverId FOREIGN KEY(driverId) REFERENCES driver(id)
);

---------- create manages table ----------
CREATE TABLE manages(
	secretaryId VARCHAR(10) NOT NULL,
    
    	driverId VARCHAR(10) NOT NULL,
    
    	CONSTRAINT pk_manages PRIMARY KEY (secretaryId, driverId),
    
    	CONSTRAINT fk_manages_secretaryId FOREIGN KEY(secretaryId) REFERENCES secretary(id),
    	CONSTRAINT fk_manages_driverId FOREIGN KEY(driverId) REFERENCES driver(id)
);

---------- create orders table ----------
CREATE TABLE orders(
	id VARCHAR(10) NOT NULL UNIQUE,
    	price DECIMAL(5, 2) NOT NULL,
    	status ENUM('Received', 'Done') NOT NULL DEFAULT 'Received',
    
    	clientId VARCHAR(10) NOT NULL,
    
    	CONSTRAINT pk_orders_id PRIMARY KEY(id),
    
    	CONSTRAINT fk_orders_clientID FOREIGN KEY(clientId)  REFERENCES client(id) ON DELETE CASCADE
);

---------- create records table ----------
CREATE TABLE records(
	secretaryId VARCHAR(10) NOT NULL,
    
    	ordersId VARCHAR(10) NOT NULL,
    
    	CONSTRAINT pk_records PRIMARY KEY (secretaryId, ordersId),
    
    	CONSTRAINT fk_records_secretary FOREIGN KEY(secretaryId) REFERENCES secretary(id),
    	CONSTRAINT fk_records_ordersId FOREIGN KEY(ordersId) REFERENCES orders(id)
);

---------- create delivery table ----------
CREATE TABLE delivery(
	id VARCHAR(10) NOT NULL UNIQUE,
    	date DATE NOT NULL,
    	pCity VARCHAR(30) NOT NULL,
    	pStreet VARCHAR(30) NOT NULL,
    	pNumber INT NOT NULL,
    	pPostalCode INT NOT NULL,
    	dCity VARCHAR(30) NOT NULL,
    	dStreet VARCHAR(30) NOT NULL,
    	dNumber INT NOT NULL,
    	dPostalCode INT NOT NULL,
    
    	ordersId VARCHAR(10) NOT NULL,
    
    	driverId VARCHAR(10) NOT NULL,
    
    	CONSTRAINT pk_delivery PRIMARY KEY(ordersId, id),
    	CONSTRAINT fk_delivery_ordersId FOREIGN KEY(ordersId) REFERENCES orders(id) ON DELETE CASCADE,
    
    	CONSTRAINT fk_delivery_driverId FOREIGN KEY(driverId) REFERENCES driver(id)
);

---------- create payment table ----------
CREATE TABLE payment(
	id INT NOT NULL UNIQUE AUTO_INCREMENT,
    	amount DECIMAL(5, 2) NOT NULL,
    	method ENUM('Cash', 'Card') NOT NULL DEFAULT 'Cash',
    	date DATE NOT NULL,
    
    	clientId VARCHAR(10) NOT NULL,
    
    	CONSTRAINT pk_payment_id PRIMARY KEY(id, clientId),
    
    	CONSTRAINT fk_payment_clientId FOREIGN KEY(clientId) REFERENCES client(id) ON DELETE CASCADE
);
