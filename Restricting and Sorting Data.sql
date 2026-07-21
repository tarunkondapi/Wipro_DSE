Restricting and Sorting Data

 -- 1.Display the Ename,Sal,Comm from Emp table who earn commission and sort the records  in descending order of Salary and Comm. Use column’s numeric position in the ORDER BY clause -- 

SQL> create table emp1(empno int primary key,ename varchar2(10),job varchar2(9),mgr int,hiredate date,sal int,comm int,deptno int);

Table created.

SQL> INSERT INTO EMP1 VALUES (7369,'sai','CLERK',7902,TO_DATE('17-DEC-80','DD-MON-RR'),800,NULL,20);

1 row created.

SQL> INSERT INTO EMP1 VALUES (7499,'hari','SALESMAN',7698,TO_DATE('20-FEB-81','DD-MON-RR'),1600,300,30);

1 row created.

SQL> INSERT INTO EMP1 VALUES (7566,'jeevan','MANAGER',7839,TO_DATE('02-APR-81','DD-MON-RR'),2975,NULL,20);

1 row created.

SQL> INSERT INTO EMP1 VALUES (7521,'kiran','SALESMAN',7698,TO_DATE('22-FEB-81','DD-MON-RR'),1250,500,30);

1 row created.

SQL> INSERT INTO EMP1 VALUES (7654,'priya','SALESMAN',7698,TO_DATE('28-SEP-81','DD-MON-RR'),1250,1400,30);

1 row created.

SQL> INSERT INTO EMP1 VALUES (7698,'tarun','MANAGER',7839,TO_DATE('01-MAY-81','DD-MON-RR'),2850,NULL,30);

1 row created.

SQL> INSERT INTO EMP1 VALUES (7782,'ram','MANAGER',7839,TO_DATE('09-JUN-81','DD-MON-RR'),2450,NULL,10);

1 row created.

SQL> INSERT INTO EMP1 VALUES (7839,'lakshmi','PRESIDENT',NULL,TO_DATE('17-NOV-81','DD-MON-RR'),5000,NULL,10);

1 row created.

SQL> INSERT INTO EMP1 VALUES (7844,'kumar','SALESMAN',7698,TO_DATE('08-SEP-81','DD-MON-RR'),1500,0,30);

1 row created.

SQL> INSERT INTO EMP1 VALUES (7876,'irfan','CLERK',7788,TO_DATE('23-MAY-87','DD-MON-RR'),1100,NULL,20);

1 row created.

SQL> INSERT INTO EMP1 VALUES (7900,'gopal','CLERK',7698,TO_DATE('03-DEC-81','DD-MON-RR'),950,NULL,30);

1 row created.

SQL> INSERT INTO EMP1 VALUES (7902,'nani','ANALYST',7566,TO_DATE('03-DEC-81','DD-MON-RR'),3000,NULL,20);

1 row created.

SQL> INSERT INTO EMP1 VALUES (7934,'giri','CLERK',7782,TO_DATE('23-JAN-82','DD-MON-RR'),1300,NULL,10);

1 row created.


SQL> select * from emp1;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7369 sai        CLERK           7902 17-DEC-80        800
        20

      7499 hari       SALESMAN        7698 20-FEB-81       1600        300
        30

      7566 jeevan     MANAGER         7839 02-APR-81       2975
        20


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7521 kiran      SALESMAN        7698 22-FEB-81       1250        500
        30

      7654 priya      SALESMAN        7698 28-SEP-81       1250       1400
        30

      7698 tarun      MANAGER         7839 01-MAY-81       2850
        30


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7782 ram        MANAGER         7839 09-JUN-81       2450
        10

      7839 lakshmi    PRESIDENT            17-NOV-81       5000
        10

      7844 kumar      SALESMAN        7698 08-SEP-81       1500          0
        30


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7876 irfan      CLERK           7788 23-MAY-87       1100
        20

      7900 gopal      CLERK           7698 03-DEC-81        950
        30

      7902 nani       ANALYST         7566 03-DEC-81       3000
        20


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7934 giri       CLERK           7782 23-JAN-82       1300
        10


13 rows selected.

SQL> select ename,sal,comm from emp1 where comm is not null order by 2 desc,3 desc;

ENAME             SAL       COMM
---------- ---------- ----------
hari             1600        300
kumar            1500          0
priya            1250       1400
kiran            1250        500

 -- 2. The HR department needs a query to display all unique job codes from the EMP table. -- 

SQL> select distinct job from emp1;

JOB
---------
CLERK
SALESMAN
MANAGER
PRESIDENT
ANALYST

 -- 3.The HR department wants more descriptive column headings for its report on employees. Name the column headings Emp #, Employee, Job, and Hire Date, respectively by giving Column Alias. -- 

SQL> select empno as "emp #" ,ename as "employee",job as "job",hiredate as "hire date" from emp1;

     emp # employee   job       hire date
---------- ---------- --------- ---------
      7369 sai        CLERK     17-DEC-80
      7499 hari       SALESMAN  20-FEB-81
      7566 jeevan     MANAGER   02-APR-81
      7521 kiran      SALESMAN  22-FEB-81
      7654 priya      SALESMAN  28-SEP-81
      7698 tarun      MANAGER   01-MAY-81
      7782 ram        MANAGER   09-JUN-81
      7839 lakshmi    PRESIDENT 17-NOV-81
      7844 kumar      SALESMAN  08-SEP-81
      7876 irfan      CLERK     23-MAY-87
      7900 gopal      CLERK     03-DEC-81

     emp # employee   job       hire date
---------- ---------- --------- ---------
      7902 nani       ANALYST   03-DEC-81
      7934 giri       CLERK     23-JAN-82

13 rows selected.

 -- 4. The HR department has requested a report of all employees and their job IDs. Display the last name concatenated with the job ID (separated by a comma and space) and name the column Employee and Title by giving Column Alias. -- 

SQL> select ename ||' , '|| job as "employee and title" from emp1;

employee and title
----------------------
sai , CLERK
hari , SALESMAN
jeevan , MANAGER
kiran , SALESMAN
priya , SALESMAN
tarun , MANAGER
ram , MANAGER
lakshmi , PRESIDENT
kumar , SALESMAN
irfan , CLERK
gopal , CLERK

employee and title
----------------------
nani , ANALYST
giri , CLERK

13 rows selected.

 -- 5. To familiarize yourself with the data in the EMP table, create a query to display all the data from that table. Separate each column output by a comma. ENAME,JOB,HIREDATE,MGR.Name the column title THE_OUTPUT. --

SQL> select empno||' , '||ename||' , '||job||' , '||hiredate||' , '||mgr as the_output from emp1;

THE_OUTPUT
--------------------------------------------------------------------------------
7369 , sai , CLERK , 17-DEC-80 , 7902
7499 , hari , SALESMAN , 20-FEB-81 , 7698
7566 , jeevan , MANAGER , 02-APR-81 , 7839
7521 , kiran , SALESMAN , 22-FEB-81 , 7698
7654 , priya , SALESMAN , 28-SEP-81 , 7698
7698 , tarun , MANAGER , 01-MAY-81 , 7839
7782 , ram , MANAGER , 09-JUN-81 , 7839
7839 , lakshmi , PRESIDENT , 17-NOV-81 ,
7844 , kumar , SALESMAN , 08-SEP-81 , 7698
7876 , irfan , CLERK , 23-MAY-87 , 7788
7900 , gopal , CLERK , 03-DEC-81 , 7698

THE_OUTPUT
--------------------------------------------------------------------------------
7902 , nani , ANALYST , 03-DEC-81 , 7566
7934 , giri , CLERK , 23-JAN-82 , 7782

13 rows selected.

 -- 6.Create a report to display the ename, job , and Hiredate  for the employees name is SCOTT or TURNER. Order the query in ascending order by hiredate. -- 

SQL> select ename,job,hiredate from emp1 where ename in ('scott','turner') order by hiredate asc;

no rows selected


 -- 7. Display the ename and department number of all employees in departments 20 or 30 in ascending alphabetical order by ename. -- 

SQL> SELECT ENAME, DEPTNO
  2  FROM EMP1
  3  WHERE DEPTNO IN (20,30)
  4  ORDER BY ENAME;

ENAME          DEPTNO
---------- ----------
gopal              30
hari               30
irfan              20
jeevan             20
kiran              30
kumar              30
nani               20
priya              30
sai                20
tarun              30

10 rows selected.

 -- 8.Modify the previous query  to display the last name and salary of employees who earn between 2000 and 3000 and are in department 20 or 30. Label the columns Employee and Monthly Salary, respectively giving Column Alias. -- 

SQL> select ename as "employee",sal as "monthly salary" from emp1 where sal between 2000 and 3000 and deptno in (20,30);

employee   monthly salary
---------- --------------
jeevan               2975
tarun                2850
nani                 3000


 -- 9. The HR department needs a report that displays the last name and hire date for all employees who were hired in 1981. --

SQL> SELECT ENAME, HIREDATE
  2  FROM EMP1
  3  WHERE HIREDATE BETWEEN
  4  TO_DATE('01-JAN-1981','DD-MON-YYYY')
  5  AND TO_DATE('31-DEC-1981','DD-MON-YYYY');

ENAME      HIREDATE
---------- ---------
hari       20-FEB-81
jeevan     02-APR-81
kiran      22-FEB-81
priya      28-SEP-81
tarun      01-MAY-81
ram        09-JUN-81
lakshmi    17-NOV-81
kumar      08-SEP-81
gopal      03-DEC-81
nani       03-DEC-81

10 rows selected.


 -- 10. Display the Ename, Sal of employees who earn more than an amount the user specifies after a Prompt. -- 


SQL> select ename,sal from emp1 where sal>&sal;
Enter value for sal: 4000
old   1: select ename,sal from emp1 where sal>&sal
new   1: select ename,sal from emp1 where sal>4000

ENAME             SAL
---------- ----------
lakshmi          5000


 -- 11. Create a report to display the last name and job title of all employees who do not have a manager. -- 


SQL> select ename,job from emp1 where mgr is null;

ENAME      JOB
---------- ---------
lakshmi    PRESIDENT

SQL> select empno,ename,sal,deptno from emp1 where mgr=&mid order by &col;
Enter value for mid: 7698
Enter value for col: ename
old   1: select empno,ename,sal,deptno from emp1 where mgr=&mid order by &col
new   1: select empno,ename,sal,deptno from emp1 where mgr=7698 order by ename

     EMPNO ENAME             SAL     DEPTNO
---------- ---------- ---------- ----------
      7900 gopal             950         30
      7499 hari             1600         30
      7521 kiran            1250         30
      7844 kumar            1500         30
      7654 priya            1250         30

 -- 12. Create a query that prompts the user for Manager ID  and generate EMPNO,ENAME, SAL,DEPTNO. The user should have the ability to sort the records on a selected Column. -- 

SQL> select empno,ename,sal,deptno from emp1 where mgr=&mid order by &col;
Enter value for mid: 7698
Enter value for col: ename
old   1: select empno,ename,sal,deptno from emp1 where mgr=&mid order by &col
new   1: select empno,ename,sal,deptno from emp1 where mgr=7698 order by ename

     EMPNO ENAME             SAL     DEPTNO
---------- ---------- ---------- ----------
      7900 gopal             950         30
      7499 hari             1600         30
      7521 kiran            1250         30
      7844 kumar            1500         30
      7654 priya            1250         30

 -- 13. The HR department wants to run reports based on a manager. Create a query that prompts the user for a MGR and generates the empno, ename, salary, and department for that manager’s employees. The HR department wants the ability to sort the report on a selected column. -- 

SQL> select empno,ename,sal,deptno from emp1 where mgr=&mgrno order by &sortcol;
Enter value for mgrno: 7698
Enter value for sortcol: sal
old   1: select empno,ename,sal,deptno from emp1 where mgr=&mgrno order by &sortcol
new   1: select empno,ename,sal,deptno from emp1 where mgr=7698 order by sal

     EMPNO ENAME             SAL     DEPTNO
---------- ---------- ---------- ----------
      7900 gopal             950         30
      7521 kiran            1250         30
      7654 priya            1250         30
      7844 kumar            1500         30
      7499 hari             1600         30

 -- 14. Display all employee last names in which the third letter of the name is A --

SQL> select ename from emp1 where ename like '__a%';
no rows selected 

 -- 15. Display the last name of all employees who have both an A and an S in their  ename --
SQL> select ename from emp1 where upper(ename) like '%a%' and upper(ename) like '%s%';

no rows selected

 -- 16. Display the Ename, Job, Sal for all employees whose jobs are CLERK and whose salary is in 800 or 950 or 1300. -- 
SQL> select ename,job,sal from emp1 where job='clerk' and sal in(800,950,1300);

no rows selected