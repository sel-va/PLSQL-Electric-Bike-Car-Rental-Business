/*-----------------------------------------------------------------------------------------------------
	FILE: SP_RMV_ITEM.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------

--13--
CREATE OR REPLACE PROCEDURE removeItem_store(auxItemID IN VARCHAR2)
IS
  auxbike NUMBER;
  auxcar NUMBER;
BEGIN
  SELECT COUNT(*) INTO auxbike
  FROM bike
  WHERE bikeid LIKE auxItemID;
  
  SELECT COUNT(*) INTO auxcar
  FROM car
  WHERE carid LIKE auxItemID;
  
  IF auxbike > 0 THEN
    DELETE FROM bike
    WHERE bikeid LIKE auxItemID;
    DBMS_OUTPUT.PUT_LINE('bike removed correctly');
  ELSIF auxcar > 0 THEN
    DELETE FROM car
    WHERE carid LIKE auxItemID;
    DBMS_OUTPUT.PUT_LINE('car removed correctly');
  END IF;
END;

SET SERVEROUTPUT ON;
DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := &ItemID_to_remove;
  removeItem_store(auxItemID);
END;

