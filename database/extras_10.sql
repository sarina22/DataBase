--@D:\GP(Database)\db_group_10\extras_10.sql
--extra scripts

/*-----------------------------------------------------------
-----creating package named 'c_package' which adds , deletes and lists the data of festival_natures table
-----------------------------------------**/
CREATE OR REPLACE PACKAGE c_package AS 
   -- Adds a customer 
   PROCEDURE proc_add_fn(in_id  festival_natures.festival_nature_id%type, in_name festival_natures.nature_name%type); 
   
   -- Removes a customer 
   PROCEDURE proc_del_fn(in_id  festival_natures.festival_nature_id%type); 
   --Lists all festival_natures 
   PROCEDURE proc_list_fn; 
  
END c_package; 
/
--created


CREATE OR REPLACE PACKAGE BODY c_package AS 
   PROCEDURE proc_add_fn(in_id  festival_natures.festival_nature_id%type, in_name festival_natures.nature_name%type) IS 
   BEGIN 
      INSERT INTO festival_natures (festival_nature_id, nature_name) 
         VALUES(in_id, in_name); 
   END proc_add_fn; 
   
   PROCEDURE proc_del_fn(in_id  festival_natures.festival_nature_id%type) IS 
   BEGIN 
      DELETE FROM festival_natures 
      WHERE festival_nature_id = in_id; 
   END proc_del_fn;  
   
  
   PROCEDURE proc_list_fn IS 
   CURSOR c_festival_natures is 
      SELECT  nature_name FROM festival_natures; 
   TYPE c_list is TABLE OF festival_natures.nature_name%type; 
   name_list c_list := c_list(); 
   counter integer :=0; 
   BEGIN 
      FOR n IN c_festival_natures LOOP 
      counter := counter +1; 
      name_list.extend; 
      name_list(counter) := n.nature_name; 
      dbms_output.put_line('FESTIVAL NATURE(' ||counter|| '): '||name_list(counter)); 
      END LOOP; 
	 END proc_list_fn;
	  
END c_package; 
/
SHOW ERRORS
--created without errors


--executing the package to add to festival_natures
DECLARE 
	id festival_natures.festival_nature_id%type:=8;
BEGIN
	c_package.proc_add_fn(100,'TEST');
END;
/


--executing the package to delete from festival_natures
DECLARE 
	id festival_natures.festival_nature_id%type:=8;
BEGIN
	c_package.proc_del_fn(99);
END;
/


--executing the package to list  festival_natures
DECLARE 
	id festival_natures.festival_nature_id%type:=8;
BEGIN
	c_package.proc_list_fn;
END;
/




--USING BULK BIND
/*-----------------------------------------------------------
-----creating unnamed block which updates salary of the staff table as given if
-----------------------------------------**/
--testing before executing
SELECT staff_id, salary FROM staff;

--block to increase salary
DECLARE
   TYPE NumList IS TABLE OF staff.staff_id%TYPE;
   depts NumList := NumList(1,2,3);
BEGIN
   FORALL i IN depts.FIRST..depts.LAST
      UPDATE staff SET salary = salary + 500 WHERE staff_id = depts(i);
   IF SQL%BULK_ROWCOUNT(3) = 0 THEN
   DBMS_OUTPUT.PUT_LINE('Its 3!!!');
   END IF;
END;
/     
      

--testing before executing
SELECT staff_id, salary FROM staff;
--testing if the changes are made
SELECT staff_id, salary FROM staff;