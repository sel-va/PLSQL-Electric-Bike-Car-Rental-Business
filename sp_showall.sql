/*-----------------------------------------------------------------------------------------------------
	FILE: SP_SHOWALL.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN PROCEDURE
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------

--9--
CREATE OR REPLACE PROCEDURE allMedia_store(mediaType VARCHAR2)
IS
  CURSOR cbikes
  IS
    SELECT *
    FROM bike;
  
  CURSOR ccars
  IS
    SELECT *
    FROM car;
  
  xbikes cbikes%ROWTYPE;
  xcars ccars%ROWTYPE;
BEGIN
  IF mediaType LIKE 'bikes' THEN
    OPEN cbikes;
    
    DBMS_OUTPUT.PUT_LINE('ISBN     ID     STATE     AVALABILITY     DEBY_COST     LOST_COST    LOCATION');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------');
    
    LOOP
      FETCH cbikes
      INTO xbikes;
      EXIT WHEN cbikes%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE(xbikes.isbn || '     ' || xbikes.bikeid || '     ' || xbikes.state || '     ' || xbikes.avalability || '     ' || xbikes.debycost || '     ' ||
      xbikes.lostcost || '     ' || xbikes.address);
    END LOOP;
  ELSIF mediaType LIKE 'cars' THEN
    OPEN ccars;
    DBMS_OUTPUT.PUT_LINE('TITLE     YEAR     ID     STATE     AVALABILITY     DEBY_COST     LOST_COST    LOCATION');
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------');
    LOOP
      FETCH ccars
      INTO xcars;
      EXIT WHEN ccars%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE(xcars.title || '     ' || xcars.year || '     ' || xcars.carid || '     ' || xcars.state || '     ' || xcars.avalability || '     ' || xcars.debycost || '     ' ||
      xcars.lostcost || '     ' || xcars.address);
    END LOOP;
  ELSE
    DBMS_OUTPUT.PUT_LINE('TYPE INCORRECT, you must choose between bikes or cars');
  END IF;
END;

SET SERVEROUTPUT ON;
DECLARE
  typeItem VARCHAR2(10);
BEGIN
  typeItem := &Select_between_bikes_or_cars;
  allMedia_store(typeItem);
END;

