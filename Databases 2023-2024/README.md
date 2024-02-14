# <h1 style="text-align: center"> Database Project - Moving Company Management System
---
---
## ☰ Contents
  [**_1. Project Description_**](#1-project-description)
  
  [**_2. Project Overview_**](#2-project-overview)
 
  [**_3. Basic Structure_**](#3-basic-structure)
  
  - [**_Entity Relation Diagram_**](#31-entity-relation-diagram)

  [**_4. Tools Used_**](#4-tools-used)
  
## 1. Project Description 
📄 As a part of our university curriculum, we made this project for "Databases (DB)". This project combines theory with practical **_SQL_** implementation. In this project, I collaborated with my team (**Nefeli & Thanasis 🫂**) to develop a <i>real-world</i> 📦🚛 Moving Company Management System for a small business

## 2. Project Overview
🎯We started by designing the  `Entity-Relationship Diagram [ERD]`, then created the `Relational Model [RM]`, and finally implemented the project. The project involved the creation of multiple tables and meticulous data management in MySQL. The project included making *tables*, *views*, *indexes*, *transactions*, *cursors*, *triggers*, and *stored procedures* in MySQL. We also developed a `dynamic website`.

## 3. Basic Structure
<details>
<summary>
🔎 Click here to see the basic structure of the project! 🖱️
</summary>

#### **Identification of Entities:**
⇾ **Secretary**
 <br>
<ins>Attributes: id, firstName, lastName, username, password, phone</ins>
<br>
⇾ **Client** <br>
<ins>Attributes: id, firstName, lastName, phone</ins>
<br>
⇾ **Driver** <br>
<ins>Attributes: id, firstName, lastName, phone</ins>
<br>
⇾ **Orders** <br>
<ins>Attributes: id, price, status</ins>
<br>
⇾ **Delivery**<br>
<ins>Attributes: id, date, pCity, pStreet, pNumber, pPostalCode, dCity, dStreet, dNumber, dPostalCode</ins>
<br>
⇾ **Truck** <br>
<ins>Attributes: id, manufacturer, capacity, purchaseYear, productionYear</ins>
<br>
⇾ **Payment** <br>
<ins>Attributes: id, amount, method, date</ins>
</details>

### Entity Relation Diagram
![ERD](images/ER.png)

## 4. Tools Used
<p align="left">   

<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="50" height="50"/>
<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/php/php-original.svg" alt="php" width="50" height="50"/>  
<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/html5/html5-original-wordmark.svg" alt="html5" width="50" height="50"/>
<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/css3/css3-original-wordmark.svg" alt="css3" width="50" height="50"/>
<img src="https://upload.vectorlogo.zone/logos/visualstudio_code/images/a4381320-f83c-4a29-9db3-b241c1d096b1.svg" alt="figma" width="45" height="45"/> 
<img src="https://www.vectorlogo.zone/logos/figma/figma-icon.svg" alt="figma" width="40" height="40"/> 
</p>
