/*-----------------------------------------------------------------------------------------------------
	FILE: SP_CUS_EMP_ACC.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------


--3--
--CUSTOMER--
CREATE OR REPLACE PROCEDURE customerAccount_store(custoID IN customer.customerid%TYPE)
IS
  auxCard NUMBER;
  auxFines NUMBER;
  auxItem VARCHAR(6);
  rented number := 0;
BEGIN
  SELECT cardnumber INTO auxCard
  FROM customer
  WHERE customerid LIKE custoID;
  
  SELECT COUNT(*) INTO rented
  FROM rent
  WHERE rent.cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);  
  IF (rented > 0) THEN
    SELECT rent.itemid INTO auxItem
    FROM rent,card
    WHERE card.cardid = rent.cardid
    AND card.cardid LIKE auxCard;    
    
    DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no rents'); 
  END IF;
  
  SELECT fines INTO auxFines
  FROM card
  WHERE cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;

SET SERVEROUTPUT ON;
DECLARE
  custoID customer.customerid%TYPE;
BEGIN
  custoID := &Customer_ID;
  customerAcount_store(custoID);
END;


--EMPLOYEE--
CREATE OR REPLACE PROCEDURE employeeAccount_store(emploID IN employee.employeeid%TYPE)
IS
  auxCard NUMBER;
  auxFines NUMBER;
  auxItem VARCHAR(6);
  rented number := 0;
BEGIN
  SELECT cardnumber INTO auxCard
  FROM employee
  WHERE employeeid LIKE emploID;
  
  SELECT COUNT(*) INTO rented
  FROM rent
  WHERE rent.cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);  
  IF (rented > 0) THEN
    SELECT rent.itemid INTO auxItem
    FROM rent,card
    WHERE card.cardid = rent.cardid
    AND card.cardid LIKE auxCard;    
    
    DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no rents'); 
  END IF;
  
  SELECT fines INTO auxFines
  FROM card
  WHERE cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;

SET SERVEROUTPUT ON;
DECLARE
  emploID employee.employeeid%TYPE;
BEGIN
  emploID := &Employee_ID;
  employeeAcount_store(emploID);
END;

