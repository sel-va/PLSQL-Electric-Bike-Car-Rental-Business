/*-----------------------------------------------------------------------------------------------------
	FILE: SP_VIEWITEM.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------

--2--
CREATE OR REPLACE PROCEDURE viewItem_store(auxItemID IN VARCHAR2)
IS
  auxISBN VARCHAR2(4);
  auxTitle VARCHAR2(50);
  auxYear NUMBER;
  auxState VARCHAR2(10);
  auxDebyCost NUMBER(10,2);
  auxLostCost NUMBER(10,2);
  auxAddress VARCHAR2(50);
  auxAbala VARCHAR2(1);
  auxcar NUMBER;
  auxbike NUMBER;
BEGIN
  
  SELECT COUNT(*) INTO auxbike
  FROM bike
  WHERE bikeid LIKE auxItemID;
  
  SELECT COUNT(*) INTO auxcar
  FROM car
  WHERE carid LIKE auxItemID;
  
  IF auxbike > 0 THEN
    SELECT isbn, state, avalability, debycost, lostcost, address
    INTO auxISBN, auxState, auxAbala, auxDebyCost, auxLostCost, auxAddress
    FROM bike
    WHERE bikeid LIKE auxItemID;
  
    DBMS_OUTPUT.PUT_LINE('bike ' || auxItemID || ' INFO');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('ISBN: ' || auxISBN);
    DBMS_OUTPUT.PUT_LINE('STATE: ' || auxState);
    DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || auxAbala);
    DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || auxDebyCost);
    DBMS_OUTPUT.PUT_LINE('LOST COST: ' || auxLostCost);
    DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || auxAddress);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  ELSIF auxcar > 0 THEN
    SELECT title, year, state, avalability, debycost, lostcost, address
    INTO auxTitle, auxYear, auxState, auxAbala, auxDebyCost, auxLostCost, auxAddress
    FROM car
    WHERE carid LIKE auxItemID;
  
    DBMS_OUTPUT.PUT_LINE('car ' || auxItemID || ' INFO');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('TITLE: ' || auxTitle);
    DBMS_OUTPUT.PUT_LINE('YEAR: ' || auxYear);
    DBMS_OUTPUT.PUT_LINE('STATE: ' || auxState);
    DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || auxAbala);
    DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || auxDebyCost);
    DBMS_OUTPUT.PUT_LINE('LOST COST: ' || auxLostCost);
    DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || auxAddress);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  END IF;
END;

SET SERVEROUTPUT ON;
DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := &Item_ID;
  viewItem_store(auxItemID);
END;

