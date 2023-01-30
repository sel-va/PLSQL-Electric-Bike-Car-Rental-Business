/*-----------------------------------------------------------------------------------------------------
	FILE: SP_RENT_ITEM.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------


--4--
CREATE OR REPLACE PROCEDURE rentItem_store(auxCard IN NUMBER, auxItemID IN VARCHAR2, itemType IN VARCHAR2, auxDate IN DATE)
IS
  statusAux VARCHAR2(1);
  itemStatus VARCHAR2(1);
BEGIN
  
  SELECT status INTO statusAux
  FROM card
  WHERE cardid LIKE auxCard;
  
  IF statusAux LIKE 'A' THEN
    IF itemType LIKE 'bike' THEN
      SELECT avalability INTO itemStatus
      FROM bike
      WHERE bikeid LIKE auxItemID;
      
      IF itemStatus LIKE 'A' THEN
        UPDATE bike
        SET avalability = 'O'
        WHERE bikeid LIKE auxItemID;
        
        INSERT INTO rent
        VALUES (auxCard,auxItemID,sysdate,auxDate);
        DBMS_OUTPUT.PUT_LINE('Item ' || auxItemID || ' rented');
      ELSE
        DBMS_OUTPUT.PUT_LINE('The item is already rented')
      END IF;
      
    ELSIF itemType LIKE 'car' THEN
     
      SELECT avalability INTO itemStatus
      FROM car
      WHERE carid LIKE auxItemID;
      
      IF itemStatus LIKE 'A' THEN
        UPDATE car
        SET avalability = 'O'
        WHERE carid LIKE auxItemID;
        
        INSERT INTO rent
        VALUES (auxCard,auxItemID,sysdate,auxDate);
        DBMS_OUTPUT.PUT_LINE('Item ' || auxItemID || ' rented');
      ELSE
        DBMS_OUTPUT.PUT_LINE('The item is already rented')
      END IF;
    
  ELSE
    DBMS_OUTPUT.PUT_LINE('The user is blocked');
  END IF;    
END;

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

SELECT * FROM customer;
SELECT * FROM rent;
SELECT * FROM card;

