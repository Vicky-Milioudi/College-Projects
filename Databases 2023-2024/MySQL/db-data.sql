---------- INSERT MOCK DATA INTO TABLES (in the order we were created) ----------

USE omada;

---------- #1 insert into secretary values ----------
INSERT INTO secretary (id, firstName, lastName, phone, 
username, password)
VALUES 
(1, 'Vasiliki', 'Miliou', 6950236484, 
'Penelope12', 'hgjhdghj'),
(2, 'Eirini', 'Fyssa', 6978543242, 
'NICK23', 'hewurhw' ),
(3, 'Panagiota', 'Papadopoulou', 6945426754, 
'CHASEKLOM', 'JIIEJhiuh'),
(4, 'Nefeli', 'Papadaki',6932401905, 
'12JENNIFER', 'bhuhdw'),
(5, 'Thanasis', 'Athanasiou', 6924164371, 
'J1OHthhr2NY', 'gwd2328'),
(6, 'Kostas', 'Dimitriou', 6947548910, 
'BETTEsc', '121ewdewFHHF2'),
(7, 'Giannis', 'Kontou', 6995847463, 
'MOSasxTEL', 'BCHDxsbsb2335'),
(8, 'Andreas', 'Panagiotou', 6954874263, 
'MATTHss12EW','123sajdh26'),
(9, 'Eleni', 'Tsironi', 6926154487, 
'JOEdwe','cdjc216emkm'),
(10, 'Philippos', 'Michailidis', 6978514263, 
'CHRISgvrgve1TIAN','GABLEjcjje');

---------- #2 insert into driver values ----------
INSERT INTO driver(id, firstName, lastName, phone)
VALUES
(1, 'Pyrrhos', 'Aggelidis','6971234567'),
(2, 'Epameinondas', 'Zafeiropoulos','6949274527'),
(3, 'Kassandra', 'Kyriakidi','6970013686'),
(4, 'Katerina', 'Dimitriou','6980536831'),
(5, 'Giannis', 'Karabatos','6949435810'),
(6, 'Petros', 'Kontos','6975542021'),
(7, 'Petros', 'Kontos','6975542021');

---------- #3 insert into truck values ----------
INSERT INTO truck(id, manufacturer, capacity, 
productionYear, purchaseYear)
VALUES
('ZFK-5678', 'Mercedes', '10 tons', '1999', '2009'),
('YKD-8899', 'Scania', '8 tons', '2008', '2010'),
('VRI-8753', 'Scania', '10 tons', '1999', '2010'),
('VRI-7753', 'Scania', '10 tons', '1999', '2010'),
('KOR-9981', 'Volvo', '10 tons', '1998', '2013'),
('KOR-9991', 'Volvo', '10 tons', '1998', '2013'),
('PLO-2266', 'Scania', '12 tons', '2001', '2015'),
('KEO-7185', 'Volvo', '8 tons', '2005', '2012');

---------- #4 insert into client values ----------
INSERT INTO client(id, firstName, lastName)
VALUES
(1, 'Giorgos', 'Kontogiannis'),
(2, 'Eleni', 'Markopoulou'),
(3, 'Nikos', 'Dimitrakopoulos'),
(4, 'Anastasia', 'Georgiou'),
(5, 'Dimitris', 'Karabasis'),
(6, 'Aikaterini', 'Michailidou'),
(7, 'Pavlos', 'Katsoulis'),
(8, 'Sofia', 'Liberopoulou'),
(9, 'Kostas', 'Papanikolaou'),
(10, 'Maria', 'Panagiotou'),
(11, 'Maria', 'Panagiotou'),
(12, 'Maria', 'Panagiotou');

---------- #5 insert into client phones values ----------
INSERT INTO clientPhone(clientId, phone)
VALUES
(1, 6810203041),
(1, 6452013687),
(2, 6958525654),
(3, 6958524565),
(4, 6945452564),
(4, 6845210395),
(5, 6898653212),
(6, 6484858689),
(7, 6959842364),
(8, 6465615253),
(8, 6987452034),
(8, 6954203956),
(9, 6845124793),
(10, 6456751520);

---------- #6 insert into orders values ----------
INSERT INTO orders(id, price, status, secretaryID, clientID)
VALUES
(1, 200, 'Received', 1, 1),
(2, 450, 'Received', 1, 1),
(3, 200, 'Done', 2, 3),
(4, 300, 'Done', 3, 4),
(5, 350, 'Done', 4, 5),
(6, 400, 'Received', 5, 6),
(7, 300, 'Received', 6, 7),
(8, 250, 'Received', 7, 8),
(9, 200, 'Done', 8, 9),
(10, 500, 'Received', 9, 10),
(11, 200, 'Done', 9, 5),
(12, 350, 'Done', 10, 5);

---------- #7 insert into payment values ----------
INSERT INTO payment(id, amount, method, date, clientID, orderID)
VALUES
(1, '250','Cash', '2023-05-21', 1, 1),
(2, '250','Cash', '2019-05-21', 1, 3),
(3, '250','Cash', '2019-05-21', 2, 2), 
(4, '250','Cash', '2019-05-21', 3, 12),
(5,'350','Card', '2023-02-07', 3, 4),
(6, '350','Card', '2023-11-30', 4, 5),
(7, '200','Card', '2023-09-03', 5, 6),
(8, '300','Cash', '2023-12-19', 6, 7),
(10, '400','Cash', '2023-09-17', 8, 8),
(11, '400','Cash', '2023-09-17', 9, 10),
(12, '400','Cash', '2023-09-17', 8, 11);

---------- #8 insert into delivery values ----------
INSERT INTO delivery(id, pCity, pStreet, pNumber, pPostalCode, 
dCity, dStreet, dNumber, dPostalCode, 
date, ordersID, driverID, truckID)
VALUES
(1,'Komotini', 'Agios Dimitriou Street', 28, 69100, 
'Alexandroupoli', 'Old Patras Street', 75, 69131, 
'2023-06-21', 1, 1,'ZFK-5678'),
(2,'Thessaloniki', 'Egnatias Street', 56, 54625, 
'Patra', 'Agios Nikolaos Street', 120, 26444, 
'2023-04-12', 2, 1, 'YKD-8899'),
(3,'Larisa', 'Ethnikis Antistasis Street', 9, 41222, 
'Xanthi', 'Dimitrakopoulou Street', 8, 67100, 
'2023-02-28', 3, 2, 'ZFK-5678'),
(4, 'Thessaloniki', 'Egnatias Street', 56, 54625, 
'Patra', 'Agios Nikolaos Street', 120, 26444, 
'2023-04-12', 4, 2, 'YKD-8899'),
(5, 'Tripoli', 'Leonidou Street', 45, 22131, 
'Thessaloniki', 'Demokratias Street', 42, 54631, 
'2023-01-26', 5, 7, 'PLO-2266'),
(6, 'Kalamata', 'Papaflessa Street', 20, 24100, 
'Larisa', 'Achilleos Street', 52, 41335, 
'2023-06-16', 6, 7, 'KEO-7185'),
(7, 'Kastoria', 'Megalous Alexandrou Street', 5, 52100, 
'Kozani', 'Papanastasiou Street', 10, 50123, 
'2023-02-22', 7, 1, 'ZFK-5678'),
(8, 'Serres', 'Aristotelous Street', 6, 62122, 
'Arta', 'Ioanni Karydi Street', 28, 47100, 
'2023-03-14', 8, 2, 'ZFK-5678'),
(9, 'Corinth', 'Ismenis Street', 18, 20100, 
'Lamia', 'Mesologgiou Street', 23, 35122, 
'2023-04-19', 9, 3, 'ZFK-5678'),
(10, 'Argos', 'Kapodistriou Street', 12, 21200, 
'Nafplio', 'Ioanninon Street', 40, 21100, 
'2023-02-10', 10, 3, 'ZFK-5678'),
(11, 'Corinth', 'Ismenis Street', 18, 20100, 
'Lamia', 'Mesologgiou Street', 23, 35122, 
'2023-04-19', 11, 4, 'ZFK-5678'),
(12, 'Corinth', 'Ismenis Street', 18, 20100, 
'Lamia', 'Mesologgiou Street', 23, 35122, 
'2023-04-19', 12, 2, 'ZFK-5678');

---------- #9 insert into manages values ----------
INSERT INTO manages(secretaryId, driverId)
VALUES
(2, 4),
(2, 5),
(2, 2),
(3, 3),
(4, 4),
(1, 1),
(6, 3),
(5, 5),
(3, 1);

---------- #10 insert into records values ----------
INSERT INTO records(secretaryId, ordersId)
VALUES
(1, 1),
(1, 7),
(1, 4),
(2, 2),
(2, 1),
(2, 7),
(2, 9),
(3, 3),
(3, 7),
(4, 4),
(4, 2),
(5, 4),
(5, 6),
(5, 5),
(6, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(9, 10);

COMMIT;

---------- verify tables are accurate ----------
SELECT count(*) FROM secretary; 
SELECT * FROM secretary;

SELECT count(*) FROM driver;
SELECT * FROM driver;

SELECT count(*) FROM truck;
SELECT * FROM truck;

SELECT count(*) FROM client;
SELECT * FROM client;

SELECT count(*) FROM clientPhone;
SELECT * FROM clientPhone;

SELECT count(*) FROM orders;
SELECT * FROM orders;

SELECT count(*) FROM payment;
SELECT * FROM payment;

SELECT count(*) FROM delivery;
SELECT * FROM delivery;

SELECT count(*) FROM manages;
SELECT * FROM manages;

SELECT count(*) FROM records;
SELECT * FROM records;
