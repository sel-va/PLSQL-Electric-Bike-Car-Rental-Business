/*-----------------------------------------------------------------------------------------------------
	FILE: SP_UPDATE_INFO.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------


--6--
--CUSTOMER--
CREATE OR REPLACE PROCEDURE updateInfoCusto_store(auxCustomer IN customer.customerid%TYPE, pNumber NUMBER, address VARCHAR2, newPass VARCHAR2)
IS
BEGIN
  UPDATE customer
  SET phone = pNumber, customeraddress = address, password = newPass
  WHERE customerid = auxCustomer;
END;

SET SERVEROUTPUT ON;
DECLARE
  auxCustomer customer.customerid%TYPE;
  pNumber NUMBER;
  address VARCHAR2;
  newPass VARCHAR2;
BEGIN
  auxCustomer := &Customer_ID;
  pNumber := &Write_your_new_phone_number_or_the_old_one_if_you_do_not_want_to_change_it;
  address := &Write_your_new_address_or_the_old_one_if_you_do_not_want_to_change_it;
  newPass := &Write_your_new_password_or_the_old_one_if_you_do_not_want_to_change_it;
  updateInfo_store(auxCustomer,pNumber,address,newPass);
END;

--EMPLOYEE--
CREATE OR REPLACE PROCEDURE updateInfoEmp_store(auxEmployee IN employee.employeeid%TYPE, pNumber NUMBER, address VARCHAR2, newPass VARCHAR2, newPayCheck NUMBER,
newBranch VARCHAR2)
IS
BEGIN
  UPDATE employee
  SET phone = pNumber, customeraddress = address, password = newPass, paycheck = auxEmployee, branchname = newBranch
  WHERE employeeid = auxEmployee;
END;

SET SERVEROUTPUT ON;
DECLARE
  auxEmployee emplouee.employeeid%TYPE;
  pNumber NUMBER;
  address VARCHAR2;
  newPass VARCHAR2;
  newPayCheck NUMBER;
  newBranch VARCHAR2;
BEGIN
  auxCustomer := &Customer_ID;
  pNumber := &Write_your_new_phone_number_or_the_old_one_if_you_do_not_want_to_change_it;
  address := &Write_your_new_address_or_the_old_one_if_you_do_not_want_to_change_it;
  newPass := &Write_your_new_password_or_the_old_one_if_you_do_not_want_to_change_it;
  newPayCheck := &Write_your_new_paycheck_or_the_old_one_if_you_do_not_want_to_change_it;
  newBranch := &Write_your_new_branch_or_the_old_one_if_you_do_not_want_to_change_it;
  updateInfoEmployee_store(auxCustomer,pNumber,address,newPass,newPayCheck,newBranch);
END;

