--creating userspace 
create user grp10 identified by 22;
grant create session to grp10;
grant create table to grp10;
grant create view to grp10;
grant create sequence to grp10;
grant create synonym to grp10;
grant create procedure to grp10;
grant create trigger to grp10;
grant create cluster to grp10;
grant create type to grp10;
grant unlimited tablespace to grp10;
GRANT ALL PRIVILEGES TO grp10;
alter user grp10 quota unlimited on system;
