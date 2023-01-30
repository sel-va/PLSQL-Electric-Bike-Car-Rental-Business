/*-----------------------------------------------------------------------------------------------------
	FILE: CREATE-TABLE.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN DATA
	AUTHOR: SELVA
	DATE CREATED: 06/01/2022
*/-----------------------------------------------------------------------------------------------------


--INSERTS--
INSERT INTO Card VALUES (101,'A',0);
INSERT INTO Card VALUES (102,'A',0);
INSERT INTO Card VALUES (103,'A',0);
INSERT INTO Card VALUES (104,'A',0);
INSERT INTO Card VALUES (105,'A',0);
INSERT INTO Card VALUES (106,'A',0);
INSERT INTO Card VALUES (107,'B',50);
INSERT INTO Card VALUES (108,'B',10);
INSERT INTO Card VALUES (109,'B',25.5);
INSERT INTO Card VALUES (110,'B',15.25);
INSERT INTO Card VALUES (151,'A',0);
INSERT INTO Card VALUES (152,'A',0);
INSERT INTO Card VALUES (153,'A',0);
INSERT INTO Card VALUES (154,'A',0);
INSERT INTO Card VALUES (155,'A',0);

INSERT INTO Branch VALUES ('BIKE', 'BIKE ROAD', 645645645);
INSERT INTO Branch VALUES ('CAR', 'CAR ROAD', 622622622);
INSERT INTO Branch VALUES ('SERVICE', 'SERVICE ROAD', 644644644);
INSERT INTO Branch VALUES ('SALES', 'SALES ROAD', 666666666);

INSERT INTO Customer VALUES (1, 'ALFRED', 'BACON STREET', 623623623, 'alfred123', 'al1', '12-05-2022', 101);
INSERT INTO Customer VALUES (2, 'JAMES', 'DOWNTOWN ABBEY', 659659659, 'james123', 'ja2', '10-05-2022', 102);
INSERT INTO Customer VALUES (3, 'GEORGE', 'DETROIT CITY', 654654654, 'george123', 'ge3', '21-06-2017', 103);
INSERT INTO Customer VALUES (4, 'TOM', 'WASHINGTON DC.', 658658658, 'tom123', 'tom4', '05-12-2016', 104);
INSERT INTO Customer VALUES (5, 'PETER', 'CASTERLY ROCK', 652652652, 'peter123', 'pe5', '09-08-2016', 105);
INSERT INTO Customer VALUES (6, 'JENNY', 'TERRAKOTA', 651651651, 'jenny123', 'je6', '30-04-2017', 106);
INSERT INTO Customer VALUES (7, 'ROSE', 'SWEET HOME ALABAMA', 657657657, 'rose123', 'ro7', '28-02-2022', 107);
INSERT INTO Customer VALUES (8, 'MONICA', 'FAKE STREET 123', 639639639, 'monica123', 'mo8', '15-01-2016', 108);
INSERT INTO Customer VALUES (9, 'PHOEBE', 'CENTRAL PERK', 678678678, 'phoebe123', 'pho9', '25-03-2016', 109);
INSERT INTO Customer VALUES (10, 'RACHEL', 'WHEREVER', 687687687, 'rachel123', 'ra10', '01-09-2017', 110);

INSERT INTO Employee VALUES (211, 'ROSS', 'HIS HOUSE', 671671671, 'ross123', 'ro11', 1200, 'BIKE', 551);
INSERT INTO Employee VALUES (212, 'CHANDLER', 'OUR HEARTHS', 688688688, 'chandler123', 'chand12', 1150.50, 'BIKE', 552);
INSERT INTO Employee VALUES (213, 'JOEY', 'LITTLE ITAYLY', 628628628, 'joey123', 'jo13', 975.75, 'BIKE', 553);
INSERT INTO Employee VALUES (214, 'VICTOR', 'SANTA FE', 654321987, 'victor123', 'vic14', 2200, 'SERVICE', 554);
INSERT INTO Employee VALUES (215, 'JAIRO', 'ARMILLA', 698754321, 'jairo123', 'ja15', 2200.50, 'CAR', 555);

INSERT INTO Location VALUES ('BIKE ROAD');
INSERT INTO Location VALUES ('CAR ROAD');
INSERT INTO Location VALUES ('SERVICE ROAD');
INSERT INTO Location VALUES ('SALES ROAD');

INSERT INTO bike VALUES ('A123', 'B1A123', 'GOOD', 'A', 5, 20, 'BIKE ROAD');
INSERT INTO bike VALUES ('A123', 'B2A123', 'NEW', 'O', 6, 30, 'BIKE ROAD');
INSERT INTO bike VALUES ('B234', 'B1B234', 'NEW', 'A', 2, 15, 'CAR ROAD');
INSERT INTO bike VALUES ('C321', 'B1C321', 'BAD', 'A', 1, 10, 'SALES ROAD');
INSERT INTO bike VALUES ('H123', 'B1H123', 'GOOD', 'A', 3, 15, 'CAR ROAD');
INSERT INTO bike VALUES ('Z123', 'B1Z123', 'GOOD', 'O', 4, 20, 'SERVICE ROAD');
INSERT INTO bike VALUES ('L321', 'B1L321', 'NEW', 'O', 4, 20, 'SERVICE ROAD');
INSERT INTO bike VALUES ('P321', 'B1P321', 'USED', 'A', 2, 12, 'CAR ROAD');

INSERT INTO car VALUES ('CAR FOR DUMMIES', 2016, 'V1CH16', 'NEW', 'O', 10, 50, 'CAR ROAD');
INSERT INTO car VALUES ('CAR FOR DUMMIES', 2016, 'V2CH16', 'BAD', 'A', 5, 20, 'CAR ROAD');
INSERT INTO car VALUES ('SERVICE MANAGER', 2014, 'V1CO14', 'GOOD', 'A', 4, 20, 'SERVICE ROAD');
INSERT INTO car VALUES ('JAVA LANGUAGE', 2015, 'V1JA15', 'USED', 'O', 4, 20, 'SERVICE ROAD');
INSERT INTO car VALUES ('DINOSAURS', 2000, 'V1DI00', 'GOOD', 'O', 5, 25, 'BIKE ROAD');
INSERT INTO car VALUES ('T-REX, DEADLY KING', 1992, 'V1TR92', 'USED', 'A', 10, 50, 'BIKE ROAD');
INSERT INTO car VALUES ('ANCESTORS OF THE HUMANITY', 1998, 'V1AN98', 'BAD', 'A', 3, 15, 'BIKE ROAD');
INSERT INTO car VALUES ('SALES, MOST BORING SH*T', 2022, 'V1PH18', 'NEW', 'A', 1, 5, 'SALES ROAD');

INSERT INTO Rent VALUES (101, 'B2A123', '10-05-2022', '20-05-2022');
INSERT INTO Rent VALUES (102, 'B1Z123', '10-05-2022', '25-05-2022');
INSERT INTO Rent VALUES (104, 'V1JA15', '01-05-2022', '21-05-2022');
INSERT INTO Rent VALUES (105, 'V1DI00', '02-05-2022', '25-05-2022');
INSERT INTO Rent VALUES (154, 'B1L321', '04-05-2022', '26-05-2022');
INSERT INTO Rent VALUES (155, 'V1CH16', '29-04-2022', '29-05-2022');

