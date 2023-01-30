/*-----------------------------------------------------------------------------------------------------
	FILE: ADD_CUS_CARD.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------

--7--
CREATE OR REPLACE PROCEDURE addCustomer_store(auxCustomerId IN NUMBER, auxName IN VARCHAR2, auxCustomerAddress IN VARCHAR2, auxPhone IN NUMBER,
auxPass IN VARCHAR2, auxUserName IN VARCHAR2, auxCardNumber IN NUMBER)
IS
BEGIN
  INSERT INTO customer
  VALUES (auxCustomerId,auxName,auxCustomerAddress,auxPhone,auxPass,auxUserName,sysdate,auxCardNumber);
END;

SET SERVEROUTPUT ON;
DECLARE
  auxCustomerId NUMBER;
  auxName VARCHAR2(20);
  auxCustomerAddress VARCHAR2(20);
  auxPhone NUMBER;
  auxPass VARCHAR2(20);
  auxUserName VARCHAR2(20);
  auxCardNumber NUMBER;
BEGIN
  auxCustomerId := &Customer_ID;
  auxName := &Name;
  auxCustomerAddress := &Address;
  auxPhone := &Phone;
  auxPass := &Password;
  auxUserName := &User_Name;
  auxCardNumber := &Card_Numeber;
  addCustomer_store(auxCustomerId,auxName,auxCustomerAddress,auxPhone,auxPass,auxUserName,auxCardNumber);
END;



--8--
--CUSTOMER--
CREATE OR REPLACE TRIGGER addCardCusto_store
AFTER INSERT
ON customer
FOR EACH ROW
DECLARE
BEGIN
  INSERT INTO card
  VALUES (:new.cardnumber,'A',0);
  
  DBMS_OUTPUT.PUT_LINE('Card created');
END;

--EMPLOYEE--
CREATE OR REPLACE TRIGGER addCardEmp_store
AFTER INSERT
ON employee
FOR EACH ROW
DECLARE
BEGIN
  INSERT INTO card
  VALUES (:new.cardnumber,'A',0);
  
  DBMS_OUTPUT.PUT_LINE('Card created');
END;

--EXAMPLE--
INSERT INTO customer
VALUES (11,'MARI CARMEN','CORDOBA',645892456,'maricarmen123','ma11',sysdate,111);

