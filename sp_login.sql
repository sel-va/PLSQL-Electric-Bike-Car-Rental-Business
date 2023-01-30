/*-----------------------------------------------------------------------------------------------------
	FILE: SP_LOGIN.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------


--CUSTOMER--
CREATE OR REPLACE PROCEDURE loginCustomer_store(user IN VARCHAR2, pass IN VARCHAR2)
IS
  passAux customer.password%TYPE;
  incorrect_password EXCEPTION;
BEGIN
      
  SELECT password INTO passAux
  FROM customer
  WHERE username LIKE user;
  
  IF passAux LIKE pass THEN
    DBMS_OUTPUT.PUT_LINE('User ' || user || ' loging succesfull');
  ELSE
    RAISE incorrect_password;
  END IF;
  
  EXCEPTION
  WHEN no_data_found OR incorrect_password THEN 
       DBMS_OUTPUT.PUT_LINE('Incorrect username or password');
                                   
END;

SET SERVEROUTPUT ON;
DECLARE
  user customer.username%TYPE;
  pass customer.password%TYPE;
BEGIN
  user := &Username;
  pass := &Password;
  login_store(user,pass);
END;



--EMPLOYEE-
CREATE OR REPLACE PROCEDURE loginEmployee_store(user IN VARCHAR2, pass IN VARCHAR2)
IS
  passAux employee.password%TYPE;
  incorrect_password EXCEPTION;
BEGIN
  SELECT password INTO passAux
  FROM employee
  WHERE username LIKE user;
  
  IF passAux LIKE pass THEN
    DBMS_OUTPUT.PUT_LINE('User ' || user || ' loging succesfull');
  ELSE
    RAISE incorrect_password;
  END IF;
  
  EXCEPTION
  WHEN no_data_found OR incorrect_password THEN 
       DBMS_OUTPUT.PUT_LINE('Incorrect username or password');
END;

SET SERVEROUTPUT ON;
DECLARE
  user employee.username%TYPE;
  pass employee.password%TYPE;
BEGIN
  user := &Username;
  pass := &Password;
  login_employee_store(user,pass);
END;

