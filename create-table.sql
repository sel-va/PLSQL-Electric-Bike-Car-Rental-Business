/*-----------------------------------------------------------------------------------------------------
	FILE: CREATE-TABLE.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN TABLE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------


--CREATE TABLES--
CREATE TABLE Card(
  cardID NUMBER,
  status VARCHAR2(1) CHECK ((status = 'A') OR (status = 'B')),
  fines NUMBER,
  CONSTRAINT Card_PK PRIMARY KEY (cardID));

CREATE TABLE Customer(
  customerID NUMBER,
  name VARCHAR2(40),
  customerAddress VARCHAR2(50),
  phone NUMBER(9),
  password VARCHAR2(20),
  userName VARCHAR2(10),
  dateSignUp DATE,
  cardNumber NUMBER,
  CONSTRAINT Customer_PK PRIMARY KEY (customerID));

CREATE TABLE Employee(
  employeeID NUMBER,
  name VARCHAR2(40),
  employeeAddress VARCHAR2(50),
  phone NUMBER(9),
  password VARCHAR2(20),
  userName VARCHAR2(10),
  paycheck NUMBER (8, 2),
  branchName VARCHAR2(40),
  cardNumber NUMBER,
  CONSTRAINT Employee_PK PRIMARY KEY (employeeID));

CREATE TABLE Branch(
  name VARCHAR2(40),
  address VARCHAR2(50),
  phone NUMBER(9),
  CONSTRAINT Branch_PK PRIMARY KEY (name));
  
CREATE TABLE Location(
  address VARCHAR2(50),
  CONSTRAINT Location_PK PRIMARY KEY (address));
  
CREATE TABLE Rent(
  cardID NUMBER,
  itemID VARCHAR2(6),
  apporpriationDate DATE,
  returnDate DATE,
  CONSTRAINT Rent_PK PRIMARY KEY (cardID,itemID));
 
CREATE TABLE bike(
  ISBN VARCHAR2(4),
  bikeID VARCHAR2(6),
  state VARCHAR2(10),
  avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')),
  debyCost NUMBER(10,2),
  lostCost NUMBER(10,2),
  address VARCHAR2(50),
  CONSTRAINT bike_PK PRIMARY KEY (ISBN,bikeID));

CREATE TABLE car(
  title VARCHAR2(50),
  year INT,
  carID VARCHAR2(6),
  state VARCHAR2(10),
  avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')),
  debyCost NUMBER(10,2),
  lostCost NUMBER(10,2),
  address VARCHAR(50),
  CONSTRAINT car_PK PRIMARY KEY (title,year,carID));



/*
SELECT * FROM Card;
SELECT * FROM Customer;
SELECT * FROM Employee;
SELECT * FROM Branch;
SELECT * FROM Location;
SELECT * FROM bike;
SELECT * FROM car;
SELECT * FROM Rent;


--DROP TABLES--
DROP TABLE Card;
DROP TABLE Customer;
DROP TABLE Employee;
DROP TABLE Branch;
DROP TABLE Location;
DROP TABLE bike;
DROP TABLE car;
DROP TABLE Rent;
*/




--FOREIGN KEYS--
ALTER TABLE Customer
ADD CONSTRAINT Customer_FK
FOREIGN KEY (cardNumber)
REFERENCES Card(cardID);

ALTER TABLE Employee
ADD CONSTRAINT Employee_FK_Card
FOREIGN KEY (cardNumber)
REFERENCES Card(cardID);

ALTER TABLE Employee
ADD CONSTRAINT Employee_FK_Branch
FOREIGN KEY (branchName)
REFERENCES Branch(name);

ALTER TABLE Branch
ADD CONSTRAINT Branch_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE bike
ADD CONSTRAINT bike_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE car
ADD CONSTRAINT car_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE Rent
ADD CONSTRAINT Rent_FK_Card
FOREIGN KEY (cardID)
REFERENCES Card(cardID);

ALTER TABLE Rent
ADD CONSTRAINT Rent_FK_bike
FOREIGN KEY (itemID)
REFERENCES bike(bikeID);

ALTER TABLE Rent
ADD CONSTRAINT Rent_FK_car
FOREIGN KEY (itemID)
REFERENCES car(carID);
