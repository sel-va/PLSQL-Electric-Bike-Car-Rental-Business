/*-----------------------------------------------------------------------------------------------------
	FILE: SP_ADD_BIKE_CAR.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------

--12--
--bike--
CREATE OR REPLACE PROCEDURE addbike_store(auxISBN IN VARCHAR2, auxbikeID IN VARCHAR2, auxState IN VARCHAR2, auxDebyCost IN NUMBER,
auxLostCost IN NUMBER, auxAddress IN VARCHAR2)
IS
BEGIN
  INSERT INTO bike
  VALUES(auxISBN,auxbikeID,auxState,'A',auxDebyCost,auxLostCost,auxAddress);
  DBMS_OUTPUT.PUT_LINE('bike inserted correctly');
END;

--car--
CREATE OR REPLACE PROCEDURE addcar_store(auxTitle IN VARCHAR2, auxYear IN INT, auxcarID IN VARCHAR2, auxState IN VARCHAR2, auxDebyCost IN NUMBER,
auxLostCost IN NUMBER, auxAddress IN VARCHAR2)
IS
BEGIN
  INSERT INTO car
  VALUES(auxTitle,auxYear,auxcarID,auxState,'A',auxDebyCost,auxLostCost,auxAddress);
  DBMS_OUTPUT.PUT_LINE('car inserted correctly');
END;

/*
--EXAMPLES--
SET SERVEROUTPUT ON;
DECLARE
  auxISBN VARCHAR2(4);
  auxItemID VARCHAR2(6);
  auxState VARCHAR2(10);
  auxDebyCost NUMBER(10,2);
  auxLostCost NUMBER(10,2);
  auxAddress VARCHAR2(50);
BEGIN
    auxISBN := &ISBN;
    auxItemID := &ItemID;
    auxState := &State;
    auxDebyCost := &Deby_Cost;
    auxLostCost := &Lost_Cost;
    auxAddress := &Location;
    addbike_store(auxISBN, auxItemID, auxState, auxDebyCost, auxLostCost, auxAddress);
END;

SELECT * FROM bike;

SET SERVEROUTPUT ON;
DECLARE
  auxTitle VARCHAR2(50);
  auxYear INT;
  auxItemID VARCHAR2(6);
  auxState VARCHAR2(10);
  auxDebyCost NUMBER(10,2);
  auxLostCost NUMBER(10,2);
  auxAddress VARCHAR2(50);
BEGIN
    auxTitle := &Title;
    auxYear := &Year;
    auxItemID := &ItemID;
    auxState := &State;
    auxDebyCost := &Deby_Cost;
    auxLostCost := &Lost_Cost;
    auxAddress := &Location;
    addcar_store(auxTitle, auxYear, auxItemID, auxState, auxDebyCost, auxLostCost, auxAddress);
END;

SELECT * FROM car;

*/