PBl app:

Select statement:
 
-- 1:Determine the Structure of DEPT Table and its Contents. -- 

SQL> create table dept(deptid int,deptname varchar2(20));

Table created.

SQL>  insert into dept (dept id,deptname) values (1,'Aiml'),(2,'Eee'),(3,'Aids);
ERROR:
ORA-01756: quoted string not properly terminated


SQL> insert into dept (deptid,deptname) values (1,'Aiml');

1 row created.

SQL>  insert into dept (deptid,deptname) values (2,'Aids');

1 row created.

SQL> insert into dept (deptid,deptname) values (3,'Civil');

1 row created.

SQL>  select * from dept;

    DEPTID DEPTNAME
---------- --------------------
         1 Aiml
         2 Aids
         3 Civil


 -- 2. Determine the Structure of EMP Table and its Contents. --

SQL> create table employee(empid int,empname varchar2(20),salary int,deptid int);

Table created.

SQL> insert into employee (empid,empname,salary,deptid) values (7786,'Tarun',10000,1);

1 row created.

SQL> insert into employee (empid,empname,salary,deptid) values (7787,'Ravi',20000,2);

1 row created.

SQL> insert into employee (empid,empname,salary,deptid) values (7788,'Irfan',30000,3);

1 row created.

SQL> select * from employee;

     EMPID EMPNAME                  SALARY     DEPTID
---------- -------------------- ---------- ----------
      7786 Tarun                    10000          1
      7787 Ravi                      20000          2
      7788 Irfan                     30000          3

 -- 3. Display the Ename and Deptno from Emp table whose Empno is 7788. -- 

SQL> select empname,deptid from employee where empid=7788;

EMPNAME                  DEPTID
-------------------- ----------
Irfan                        3
