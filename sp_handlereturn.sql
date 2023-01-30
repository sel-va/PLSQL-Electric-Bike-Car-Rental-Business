/*-----------------------------------------------------------------------------------------------------
	FILE: SP_HANDLERETURN.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------


--10--
CREATE OR REPLACE PROCEDURE handleReturns_store(auxItemID IN VARCHAR2)
IS
  auxRented NUMBER;
  auxbike NUMBER;
  auxcar NUMBER;
BEGIN
  SELECT COUNT(*) INTO auxRented
  FROM rent
  WHERE itemid LIKE auxItemID;
  
  SELECT COUNT(*) INTO auxbike
  FROM bike
  WHERE bikeid LIKE auxItemID;
  
  SELECT COUNT(*) INTO auxcar
  FROM car
  WHERE carid LIKE auxItemID;
  
  IF auxRented > 0 THEN
    DELETE FROM rent
    WHERE itemid = auxItemID;
    IF auxbike > 0 THEN
      UPDATE bike
      SET avalability = 'A'
      WHERE bikeid LIKE auxItemID;
      DBMS_OUTPUT.PUT_LINE('The bike ' || auxItemID || ' is now avaible.');
    ELSIF auxcar > 0 THEN
      UPDATE car
      SET avalability = 'A'
      WHERE carid LIKE auxItemID;
      DBMS_OUTPUT.PUT_LINE('The car ' || auxItemID || ' is now avaible.');
    END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('This item is not rented at the moment');
  END IF;
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('Item ID incorrect');    
END;

SET SERVEROUTPUT ON;
DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := &ItemID_to_return;
  handleReturns_store(auxItemID);
END;

SELECT * FROM rent;
SELECT * FROM bike;

