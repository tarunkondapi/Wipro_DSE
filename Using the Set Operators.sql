Using the Set Operators:

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


 -- 1. Create a matrix query to display the job, the salary for that job based on department number, and the total salary for that job, for departments 10, 20, and 30, giving each column an appropriate heading. -- 

SQL> SELECT JOB,
  2         SUM(DECODE(DEPTNO,10,SAL,0)) AS DEPT10,
  3         SUM(DECODE(DEPTNO,20,SAL,0)) AS DEPT20,
  4         SUM(DECODE(DEPTNO,30,SAL,0)) AS DEPT30,
  5         SUM(SAL) AS TOTAL
  6  FROM EMP
  7  GROUP BY JOB
  8  ORDER BY JOB;

JOB           DEPT10     DEPT20     DEPT30      TOTAL
--------- ---------- ---------- ---------- ----------
ANALYST            0       6000          0       6000
CLERK           1300       1900        950       4150
MANAGER         2450       2975       2850       8275
PRESIDENT       5000          0          0       5000
SALESMAN           0          0       5600       5600

 -- 2. Using set operator display the DEPTNO,SUM(SAL) for each dept,  JOB,SUM(SAL) for each Job and Total Salary. -- 

SQL> SELECT DEPTNO,
  2         SUM(SAL) AS TOTAL_SALARY
  3  FROM EMP
  4  GROUP BY DEPTNO;

    DEPTNO TOTAL_SALARY
---------- ------------
        20        10875
        30         9400
        10         8750

SQL> SELECT JOB,
  2         SUM(SAL) AS TOTAL_SALARY
  3  FROM EMP
  4  GROUP BY JOB;

JOB       TOTAL_SALARY
--------- ------------
CLERK             4150
SALESMAN          5600
MANAGER           8275
ANALYST           6000
PRESIDENT         5000

SQL> SELECT SUM(SAL) AS TOTAL_SALARY
  2  FROM EMP;

TOTAL_SALARY
------------
       29025

 -- 3. Using Set Operator display the JOB and Deptno  in employees working in deptno 20,10,30 in that order. --

SQL> SELECT JOB, DEPTNO
  2  FROM EMP
  3  WHERE DEPTNO = 20;

JOB           DEPTNO
--------- ----------
CLERK             20
MANAGER           20
ANALYST           20
CLERK             20
ANALYST           20

SQL> SELECT JOB, DEPTNO
  2  FROM EMP
  3  WHERE DEPTNO = 10;

JOB           DEPTNO
--------- ----------
MANAGER           10
PRESIDENT         10
CLERK             10

SQL> SELECT JOB, DEPTNO
  2  FROM EMP
  3  WHERE DEPTNO = 30;

JOB           DEPTNO
--------- ----------
SALESMAN          30
SALESMAN          30
SALESMAN          30
MANAGER           30
SALESMAN          30
CLERK             30

6 rows selected.

