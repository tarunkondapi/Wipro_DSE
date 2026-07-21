Single-Row Functions to Customize The Output: 


SQL> CREATE TABLE EMP (
  2      EMPNO NUMBER(4) PRIMARY KEY,
  3      ENAME VARCHAR2(10),
  4      JOB VARCHAR2(9),
  5      MGR NUMBER(4),
  6      HIREDATE DATE,
  7      SAL NUMBER(7,2),
  8      COMM NUMBER(7,2),
  9      DEPTNO NUMBER(2)
 10  );

Table created.

SQL> INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,TO_DATE('17-12-1980','DD-MM-YYYY'),800,NULL,20);

1 row created.

SQL> INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('20-02-1981','DD-MM-YYYY'),1600,300,30);

1 row created.

SQL> INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('22-02-1981','DD-MM-YYYY'),1250,500,30);

1 row created.


SQL> INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,TO_DATE('02-04-1981','DD-MM-YYYY'),2975,NULL,20);

1 row created.

SQL> INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,TO_DATE('28-09-1981','DD-MM-YYYY'),1250,1400,30);

1 row created.

SQL> INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,TO_DATE('01-05-1981','DD-MM-YYYY'),2850,NULL,30);

1 row created.

SQL> INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,TO_DATE('09-06-1981','DD-MM-YYYY'),2450,NULL,10);

1 row created.

SQL> INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,TO_DATE('09-12-1982','DD-MM-YYYY'),3000,NULL,20);

1 row created.

SQL> INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,TO_DATE('17-11-1981','DD-MM-YYYY'),5000,NULL,10);

1 row created.

SQL> INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,TO_DATE('08-09-1981','DD-MM-YYYY'),1500,0,30);

1 row created.

SQL> INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,TO_DATE('12-01-1983','DD-MM-YYYY'),1100,NULL,20);

1 row created.

SQL> INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,TO_DATE('03-12-1981','DD-MM-YYYY'),950,NULL,30);

1 row created.

SQL> INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,TO_DATE('03-12-1981','DD-MM-YYYY'),3000,NULL,20);

1 row created.

SQL> INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,TO_DATE('23-01-1982','DD-MM-YYYY'),1300,NULL,10);

1 row created.

SQL> COMMIT;

Commit complete.


 -- 1. Write a query to display the current date. Label the column Date. --

SQL> SELECT SYSDATE AS "DATE"
  2  FROM DUAL;

DATE
---------
19-JUL-26


-- 2. The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee.         Label the column New Salary. --


SQL> SELECT EMPNO,
  2         ENAME,
  3         SAL,
  4         ROUND(SAL * 1.155) AS "NEW SALARY"
  5  FROM EMP;

     EMPNO ENAME             SAL NEW SALARY
---------- ---------- ---------- ----------
      7369 SMITH             800        924
      7499 ALLEN            1600       1848
      7521 WARD             1250       1444
      7566 JONES            2975       3436
      7654 MARTIN           1250       1444
      7698 BLAKE            2850       3292
      7782 CLARK            2450       2830
      7788 SCOTT            3000       3465
      7839 KING             5000       5775
      7844 TURNER           1500       1733
      7876 ADAMS            1100       1271

     EMPNO ENAME             SAL NEW SALARY
---------- ---------- ---------- ----------
      7900 JAMES             950       1097
      7902 FORD             3000       3465
      7934 MILLER           1300       1502

14 rows selected.

-- 3. Modify the previous query to add a column alias that subtracts the old salary from the new salary. Label the column Increase. --

SQL> SELECT EMPNO,
  2         ENAME,
  3         SAL,
  4         ROUND(SAL * 1.155) AS "NEW SALARY",
  5         ROUND(SAL * 1.155) - SAL AS "INCREASE"
  6  FROM EMP;

     EMPNO ENAME             SAL NEW SALARY   INCREASE
---------- ---------- ---------- ---------- ----------
      7369 SMITH             800        924        124
      7499 ALLEN            1600       1848        248
      7521 WARD             1250       1444        194
      7566 JONES            2975       3436        461
      7654 MARTIN           1250       1444        194
      7698 BLAKE            2850       3292        442
      7782 CLARK            2450       2830        380
      7788 SCOTT            3000       3465        465
      7839 KING             5000       5775        775
      7844 TURNER           1500       1733        233
      7876 ADAMS            1100       1271        171

     EMPNO ENAME             SAL NEW SALARY   INCREASE
---------- ---------- ---------- ---------- ----------
      7900 JAMES             950       1097        147
      7902 FORD             3000       3465        465
      7934 MILLER           1300       1502        202

14 rows selected.

 -- 4. Write a query that displays the ename (with the first letter uppercase and all other letters lowercase) and the length of the  ename for all employees whose name starts with the letters J, A, or M. Give each column an appropriate label. Sort the results by the employees’ enames. -- 

SQL> SELECT INITCAP(LOWER(ENAME)) AS "EMPLOYEE NAME",
  2         LENGTH(ENAME) AS "NAME LENGTH"
  3  FROM EMP
  4  WHERE ENAME LIKE 'J%'
  5     OR ENAME LIKE 'A%'
  6     OR ENAME LIKE 'M%'
  7  ORDER BY ENAME;

EMPLOYEE N NAME LENGTH
---------- -----------
Adams                5
Allen                5
James                5
Jones                5
Martin               6
Miller               6

6 rows selected.

 -- 5. Rewrite the query so that the user is prompted to enter a letter that starts the last name. For example, if the user enters H when prompted for a letter, then the output should show all employees whose last name starts with the letter H. -- 

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE ENAME LIKE UPPER('&LETTER') || '%';
Enter value for letter: H
old   3: WHERE ENAME LIKE UPPER('&LETTER') || '%'
new   3: WHERE ENAME LIKE UPPER('H') || '%'

no rows selected

 -- 6. The HR department wants to find the length of employment for each employee. For each employee, display the ename and calculate the number of months between today and     the date on which the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed. Round the number of months up to the  closest whole number. -- 

SQL> SELECT ENAME,
  2         CEIL(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS_WORKED
  3  FROM EMP
  4  ORDER BY MONTHS_WORKED;

ENAME      MONTHS_WORKED
---------- -------------
ADAMS                523
SCOTT                524
MILLER               534
FORD                 536
JAMES                536
KING                 537
MARTIN               538
TURNER               539
CLARK                542
BLAKE                543
JONES                544

ENAME      MONTHS_WORKED
---------- -------------
WARD                 545
ALLEN                545
SMITH                548

14 rows selected.

 -- 7. Create a report that produces the following for each employee:   earns  monthly but wants <3 times salary>. Label the column Dream Salaries. -- 

SQL> SELECT ENAME || ' earns ' || SAL ||
  2         ' monthly but wants ' || (SAL * 3)
  3         AS "DREAM SALARIES"
  4  FROM EMP;

DREAM SALARIES
--------------------------------------------------------------------------------
SMITH earns 800 monthly but wants 2400
ALLEN earns 1600 monthly but wants 4800
WARD earns 1250 monthly but wants 3750
JONES earns 2975 monthly but wants 8925
MARTIN earns 1250 monthly but wants 3750
BLAKE earns 2850 monthly but wants 8550
CLARK earns 2450 monthly but wants 7350
SCOTT earns 3000 monthly but wants 9000
KING earns 5000 monthly but wants 15000
TURNER earns 1500 monthly but wants 4500
ADAMS earns 1100 monthly but wants 3300

DREAM SALARIES
--------------------------------------------------------------------------------
JAMES earns 950 monthly but wants 2850
FORD earns 3000 monthly but wants 9000
MILLER earns 1300 monthly but wants 3900

14 rows selected.

 -- 8. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with the $ symbol. Label the column SALARY. -- 

SQL> SELECT ENAME,
  2         LPAD(SAL,15,'$') AS SALARY
  3  FROM EMP;

ENAME      SALARY
---------- ------------------------------------------------------------
SMITH      $$$$$$$$$$$$800
ALLEN      $$$$$$$$$$$1600
WARD       $$$$$$$$$$$1250
JONES      $$$$$$$$$$$2975
MARTIN     $$$$$$$$$$$1250
BLAKE      $$$$$$$$$$$2850
CLARK      $$$$$$$$$$$2450
SCOTT      $$$$$$$$$$$3000
KING       $$$$$$$$$$$5000
TURNER     $$$$$$$$$$$1500
ADAMS      $$$$$$$$$$$1100

ENAME      SALARY
---------- ------------------------------------------------------------
JAMES      $$$$$$$$$$$$950
FORD       $$$$$$$$$$$3000
MILLER     $$$$$$$$$$$1300

14 rows selected.

  -- 9. Display each employee’s last name, hire date, and salary review date, which is the first Monday after six months of service. Label the column REVIEW. Format the dates to appear in the format similar to “Monday, the Thirty-First of July, 2000.” -- 

SQL> SELECT ENAME,
  2         HIREDATE,
  3         TO_CHAR(
  4             NEXT_DAY(ADD_MONTHS(HIREDATE,6),'MONDAY'),
  5             'Day, "the" DDSP "of" Month, YYYY'
  6         ) AS REVIEW
  7  FROM EMP;

ENAME      HIREDATE
---------- ---------
REVIEW
--------------------------------------------------------------------------------
SMITH      17-DEC-80
Monday   , the TWENTY-TWO of June     , 1981

ALLEN      20-FEB-81
Monday   , the TWENTY-FOUR of August   , 1981

WARD       22-FEB-81
Monday   , the TWENTY-FOUR of August   , 1981


ENAME      HIREDATE
---------- ---------
REVIEW
--------------------------------------------------------------------------------
JONES      02-APR-81
Monday   , the FIVE of October  , 1981

MARTIN     28-SEP-81
Monday   , the TWENTY-NINE of March    , 1982

BLAKE      01-MAY-81
Monday   , the TWO of November , 1981


ENAME      HIREDATE
---------- ---------
REVIEW
--------------------------------------------------------------------------------
CLARK      09-JUN-81
Monday   , the FOURTEEN of December , 1981

SCOTT      09-DEC-82
Monday   , the THIRTEEN of June     , 1983

KING       17-NOV-81
Monday   , the TWENTY-FOUR of May      , 1982


ENAME      HIREDATE
---------- ---------
REVIEW
--------------------------------------------------------------------------------
TURNER     08-SEP-81
Monday   , the FIFTEEN of March    , 1982

ADAMS      12-JAN-83
Monday   , the EIGHTEEN of July     , 1983

JAMES      03-DEC-81
Monday   , the SEVEN of June     , 1982


ENAME      HIREDATE
---------- ---------
REVIEW
--------------------------------------------------------------------------------
FORD       03-DEC-81
Monday   , the SEVEN of June     , 1982

MILLER     23-JAN-82
Monday   , the TWENTY-SIX of July     , 1982


14 rows selected.

 -- 10. Display the last name, hire date, and day of the week on which the employee started. Label the column DAY. Order the results by the day of the week, starting with Monday. -- 

SQL> SELECT ENAME,
  2         HIREDATE,
  3         TO_CHAR(HIREDATE,'DAY') AS DAY
  4  FROM EMP
  5  ORDER BY TO_CHAR(HIREDATE,'D');

ENAME      HIREDATE  DAY
---------- --------- ------------------------------------
WARD       22-FEB-81 SUNDAY
MARTIN     28-SEP-81 MONDAY
CLARK      09-JUN-81 TUESDAY
TURNER     08-SEP-81 TUESDAY
KING       17-NOV-81 TUESDAY
ADAMS      12-JAN-83 WEDNESDAY
SMITH      17-DEC-80 WEDNESDAY
JAMES      03-DEC-81 THURSDAY
SCOTT      09-DEC-82 THURSDAY
FORD       03-DEC-81 THURSDAY
JONES      02-APR-81 THURSDAY

ENAME      HIREDATE  DAY
---------- --------- ------------------------------------
BLAKE      01-MAY-81 FRIDAY
ALLEN      20-FEB-81 FRIDAY
MILLER     23-JAN-82 SATURDAY

14 rows selected.

 -- 11. Create a query that displays the employees’ last names and commission amounts. If an employee does not earn commission, show “No Commission.” Label the column COMM. -- 

SQL> SELECT ENAME,
  2         NVL(TO_CHAR(COMM),'No Commission') AS COMM
  3  FROM EMP;

ENAME      COMM
---------- ----------------------------------------
SMITH      No Commission
ALLEN      300
WARD       500
JONES      No Commission
MARTIN     1400
BLAKE      No Commission
CLARK      No Commission
SCOTT      No Commission
KING       No Commission
TURNER     0
ADAMS      No Commission

ENAME      COMM
---------- ----------------------------------------
JAMES      No Commission
FORD       No Commission
MILLER     No Commission

14 rows selected.


 -- 12.Create a query that displays the first eight characters of the employees’ last names and indicates the amounts of their salaries with asterisks. Each asterisk signifies a thousand dollars. Sort the data in descending order of salary. Label the column EMPLOYEES_AND_THEIR_SALARIES. -- 

SQL> SELECT SUBSTR(ENAME,1,8) AS ENAME,
  2         RPAD('*', TRUNC(SAL/1000), '*')
  3         AS EMPLOYEES_AND_THEIR_SALARIES
  4  FROM EMP
  5  ORDER BY SAL DESC;

ENAME
--------------------------------
EMPLOYEES_AND_THEIR_SALARIES
--------------------------------------------------------------------------------
KING
*****

FORD
***

SCOTT
***


ENAME
--------------------------------
EMPLOYEES_AND_THEIR_SALARIES
--------------------------------------------------------------------------------
JONES
**

BLAKE
**

CLARK
**


ENAME
--------------------------------
EMPLOYEES_AND_THEIR_SALARIES
--------------------------------------------------------------------------------
ALLEN
*

TURNER
*

MILLER
*


ENAME
--------------------------------
EMPLOYEES_AND_THEIR_SALARIES
--------------------------------------------------------------------------------
WARD
*

MARTIN
*

ADAMS
*


ENAME
--------------------------------
EMPLOYEES_AND_THEIR_SALARIES
--------------------------------------------------------------------------------
JAMES


SMITH



14 rows selected.

 -- 13. Using the DECODE function, write a query that displays the grade of all employees based on the value of the column JOB_ID, using the following data: PRESIDENT-A,MANAGER-B,SALESMAN-C,CLERK-D. -- 

SQL> SELECT ENAME,
  2         JOB,
  3         DECODE(JOB,
  4                'PRESIDENT','A',
  5                'MANAGER','B',
  6                'SALESMAN','C',
  7                'CLERK','D',
  8                'NOT ASSIGNED') AS GRADE
  9  FROM EMP;

ENAME      JOB       GRADE
---------- --------- ------------
SMITH      CLERK     D
ALLEN      SALESMAN  C
WARD       SALESMAN  C
JONES      MANAGER   B
MARTIN     SALESMAN  C
BLAKE      MANAGER   B
CLARK      MANAGER   B
SCOTT      ANALYST   NOT ASSIGNED
KING       PRESIDENT A
TURNER     SALESMAN  C
ADAMS      CLERK     D

ENAME      JOB       GRADE
---------- --------- ------------
JAMES      CLERK     D
FORD       ANALYST   NOT ASSIGNED
MILLER     CLERK     D

14 rows selected.

 -- 14.  Rewrite the statement in the preceding exercise using the CASE syntax. -- 

SQL> SELECT ENAME,
  2         JOB,
  3         CASE
  4             WHEN JOB='PRESIDENT' THEN 'A'
  5             WHEN JOB='MANAGER' THEN 'B'
  6             WHEN JOB='SALESMAN' THEN 'C'
  7             WHEN JOB='CLERK' THEN 'D'
  8             ELSE 'NOT ASSIGNED'
  9         END AS GRADE
 10  FROM EMP;

ENAME      JOB       GRADE
---------- --------- ------------
SMITH      CLERK     D
ALLEN      SALESMAN  C
WARD       SALESMAN  C
JONES      MANAGER   B
MARTIN     SALESMAN  C
BLAKE      MANAGER   B
CLARK      MANAGER   B
SCOTT      ANALYST   NOT ASSIGNED
KING       PRESIDENT A
TURNER     SALESMAN  C
ADAMS      CLERK     D

ENAME      JOB       GRADE
---------- --------- ------------
JAMES      CLERK     D
FORD       ANALYST   NOT ASSIGNED
MILLER     CLERK     D

14 rows selected.