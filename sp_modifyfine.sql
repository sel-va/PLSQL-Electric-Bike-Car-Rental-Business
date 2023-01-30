/*-----------------------------------------------------------------------------------------------------
	FILE: SP_MODIFYFINE.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------


--11--
CREATE OR REPLACE TRIGGER modifyFines_store
AFTER DELETE
ON rent
FOR EACH ROW
DECLARE
  auxCardID NUMBER;
  auxItemID VARCHAR2(6);
  auxbike NUMBER;
  auxcar NUMBER;
  auxDeby NUMBER;
BEGIN  
  SELECT cardid, itemid INTO auxCardID, auxItemID
  FROM rent
  WHERE cardid LIKE :old.cardid;
  
  SELECT COUNT(*) INTO auxbike
  FROM bike
  WHERE bikeid LIKE auxItemID;
  
  SELECT COUNT(*) INTO auxcar
  FROM car
  WHERE carid LIKE auxItemID;
  
  IF sysdate > :old.returndate THEN
    IF auxcar > 0 THEN 
      SELECT debyCost INTO auxDeby
      FROM car
      WHERE carid LIKE auxItemID;
    ELSIF auxbike > 0 THEN
      SELECT debyCost INTO auxDeby
      FROM bike
      WHERE bikeid LIKE auxItemID;
    END IF;
    
    UPDATE card
    SET status = 'B', fines = (fines + auxDeby)
    WHERE cardid LIKE auxCardID;
  ELSE
    DBMS_OUTPUT.PUT_LINE('The item has been return before deadline');
  END IF;
END;
/

/*
--EXAMPLE--
INSERT INTO customer
VALUES (12,'ALEJANDRO','ZAIDIN',629629629,'alex123','al12',sysdate,112);

SELECT * FROM rent;

SET SERVEROUTPUT ON;
DECLARE
  auxCard NUMBER;
  auxItemID VARCHAR2(10);
  itemType VARCHAR2(20);
  auxDate DATE;
BEGIN
  auxCard := &Card_ID;
  itemType := &Item_Type_bike_or_car;  
  auxItemID := &ID_Item;  
  auxDate := &Return_date;
  rentItem_store(auxCard,auxItemID,itemType,auxDate);
END;

SELECT * FROM rent;

SET SERVEROUTPUT ON;
DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := &ItemID_to_return;
  handleReturns_store(auxItemID);
END;

DELETE FROM card WHERE cardid LIKE 112;
SELECT * FROM card;
*/