/*-----------------------------------------------------------------------------------------------------
	FILE: BCR_MASTER_SCRIPT.SQL
	DESCRIPTION: THIS SCRIPT CONTAIN MASTER SCRIPT TO RUN ALL FILES (ORDER WISE)
	AUTHOR: SELVA
	DATE CREATED: 05/01/2022 - 30-01-2022
*/-----------------------------------------------------------------------------------------------------


-- Master script to deploy the code

-- Start the spooling process
SPOOL C:\Bike_Rent\Master_LOG.txt

-- sql files to be executed which stored in C:\Bike_Rent\

--BCR_Master_script.sql  
@C:\Bike_Rent\create-table.sql       
PROMPT FILE_1 EXECUTED

@C:\Bike_Rent\insert_data.sql        
PROMPT FILE_1_1 EXECUTED

@C:\Bike_Rent\sp_login.sql         
PROMPT FILE_2 EXECUTED

@C:\Bike_Rent\sp_viewitem.sql
PROMPT FILE_2_1 EXECUTED

@C:\Bike_Rent\sp_cus_emp_acc.sql   
PROMPT FILE_3 CREATED

@C:\Bike_Rent\sp_rent_item.sql
PROMPT FILE_4 EXECUTED

@C:\Bike_Rent\sp_fine.sql          
PROMPT FILE_5 EXECUTED

@sp_update_info.sql
PROMPT FILE_6 EXECUTED

@C:\Bike_Rent\add_cus_card.sql       
PROMPT FILE_7_8 EXECUTED

@C:\Bike_Rent\sp_showall.sql
PROMPT FILE_9 EXECUTED

@C:\Bike_Rent\sp_handlereturn.sql  
PROMPT FILE_10 EXECUTED

@C:\Bike_Rent\sp_modifyfine.sql    
PROMPT FILE_11 EXECUTED

@C:\Bike_Rent\sp_add_bike_car.sql    
PROMPT FILE_12 EXECUTED

@C:\Bike_Rent\sp_rmv_item.sql
PROMPT FILE_13 EXECUTED

@C:\Bike_Rent\sp_vw_cus_obj_typ.sql
PROMPT FILE_14 EXECUTED


-- Stop the spooling process
SPOOL OFF

-- PROMPT - Display message indicating that the query has been executed and the output has been written to the log file
PROMPT Query executed and results written to query_log.txt
