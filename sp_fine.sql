/*-----------------------------------------------------------------------------------------------------
	FILE: SP_FINE.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------


--5--
CREATE OR REPLACE PROCEDURE payFines_store(auxCard IN card.cardid%TYPE, money IN NUMBER)
IS
  finesAmount NUMBER;
  total NUMBER;
BEGIN
  SELECT fines INTO finesAmount
  FROM card
  WHERE cardid LIKE auxCard;
  
  IF finesAmount < money THEN
    total := money - finesAmount;
    DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES AND YOU HAVE ' || total || ' MONEY BACK');
    
    UPDATE card
    SET status = 'A', fines = 0
    WHERE cardid = auxCard;
    
  ELSIF finesAmount = money THEN
    total := money - finesAmount;
    DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES');
    
    UPDATE card
    SET status = 'A', fines = 0
    WHERE cardid = auxCard;
  
  ELSE
    total := finesAmount - money;
    DBMS_OUTPUT.PUT_LINE('YOU WILL NEED TO PAY ' || total || ' MORE DOLLARS TO UNLOCK YOUR CARD');
    
    UPDATE card
    SET fines = total
    WHERE cardid = auxCard;
  END IF;
END;

SET SERVEROUTPUT ON;
DECLARE
  auxCard card.cardid%TYPE;
  money NUMBER;
BEGIN
  auxCard := &Card_ID;
  money := &Money_To_Pay;
  payFines_store(custoID);
END;

