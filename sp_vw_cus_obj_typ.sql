/*-----------------------------------------------------------------------------------------------------
	FILE: SP_VW_CUS_OBJ_TYP.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------

--14--
--The statement indicates the creation of another function, but we have made function five meet both needs--

CREATE OR REPLACE PROCEDURE viewCustomer_store(auxCustomerID IN NUMBER)
IS
  custoName VARCHAR2(40);
  custoAdd VARCHAR2(50);
  custoPhone NUMBER(9);
  userNaM VARCHAR2(10);
  custoDate DATE;
  custoCard NUMBER;
BEGIN
  SELECT name,customeraddress,phone,username,datesignup,cardnumber
  INTO custoName, custoAdd, custoPhone, userNaM, custoDate, custoCard
  FROM customer
  WHERE customerid LIKE auxCustomerID;
  
  DBMS_OUTPUT.PUT_LINE('CUSTOMER ' || auxCustomerID || ' INFO');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('NAME: ' || custoName);
  DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || custoAdd);
  DBMS_OUTPUT.PUT_LINE('PHONE: ' || custoPhone);
  DBMS_OUTPUT.PUT_LINE('USER NAME: ' || userNaM);
  DBMS_OUTPUT.PUT_LINE('DATE OF SIGN UP: ' || custoDate);
  DBMS_OUTPUT.PUT_LINE('CARD NUMBER: ' || custoCard);
  DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  
END;

SET SERVEROUTPUT ON;
DECLARE
  auxCustoID VARCHAR2(10);
BEGIN
  auxCustoID := &CustomerID;
  viewCustomer_store(auxCustoID);
END;



--OBJECT--
CREATE OR REPLACE TYPE director_store AS OBJECT(
employeeid NUMBER,
name VARCHAR2(40),
address VARCHAR2(50),
phone INT(9),
paycheck NUMBER(10,2),
extrapaycheck NUMBER(10,2)
);

SET SERVEROUTPUT ON;
DECLARE 
   director director_store; 
BEGIN 
   director := director_store('212', 'CHANDLER', 'OUR HEARTHS', 688688688,1150.5,500); 
   dbms_output.put_line('DIRECTOR ID: '|| director.employeeid); 
   dbms_output.put_line('--------------------------------------------' ); 
   dbms_output.put_line('NAME: '|| director.name); 
   dbms_output.put_line('ADDRESS: '|| director.address); 
   dbms_output.put_line('PHONE: '|| director.phone); 
   dbms_output.put_line('PAYCHECK: '|| director.paycheck); 
   dbms_output.put_line('EXTRA: '|| director.extrapaycheck);
   dbms_output.put_line('--------------------------------------------' ); 
END;