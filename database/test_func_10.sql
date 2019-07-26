--@D:\GP(Database)\db_group_10\test_func_10.sql
--test script of all the functions and related procedures

--testing functions.sql

--to see the output on screen
SET SERVEROUTPUT ON

---------------------------------------------------
---------for procedures 'proc_count_staff'---------
---------------------------------------------------
--checking the staffs 
DESC staff;

--executing 'proc_count_staff'
EXECUTE proc_count_staff;
--Result: THERE ARE 6 STAFF RECORDS

SELECT * FROM staff;
--6 rows returned

---------------------------------------------------
---------for procedure 'proc_generate_age_staff'---
---------------------------------------------------
DESC staff;

--executing by putting the date value in parameter
EXECUTE proc_generate_age_staff(2);
--Result: AGE OF SCOTT IS 30 YEARS OLD

---------------------------------------------------
---------for 'proc_duration_of_festival'-----------
---------------------------------------------------
DESC festivals

--executing by putting the festival name in parameter to calculate the duration of festival
EXEC proc_duration_of_festival('DEVFARE');
--Result: THE DURATION OF FESTIVAL IS 4 DAYS.

---------------------------------------------------
---------for 'proc_update_username_password'-------
---------------------------------------------------
COLUMN firstname FORMAT A10
COLUMN lastname FORMAT A10
COLUMN username FORMAT A10
COLUMN password FORMAT A20

SELECT firstname, lastname, username, password FROM staff
WHERE staff_id = 1;
-- Result: username and password is empty

--executing the procedure by putting the staff_id to generate both username and password of that user
EXEC proc_update_username_password(1);
--PL/SQL procedure successfully completed

--checking if the username and password is updated in the staff table
SELECT staff_id, firstname, lastname, username, password FROM staff
WHERE staff_id = 2;
--Result: username and password updated


