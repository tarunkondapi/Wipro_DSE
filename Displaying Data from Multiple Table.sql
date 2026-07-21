Displaying Data from Multiple Tables Using Joins:


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



SQL>    CREATE TABLE DEPT (
  2      DEPTNO NUMBER(2) PRIMARY KEY,
  3      DNAME VARCHAR2(14),
  4      LOC VARCHAR2(13)
  5  );

Table created.

SQL> INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');

1 row created.

SQL> INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');

1 row created.

SQL> INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');

1 row created.

SQL> INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

1 row created.

SQL>
SQL> COMMIT;

Commit complete.



SQL> CREATE TABLE SALGRADE (
  2      GRADE NUMBER,
  3      LOSAL NUMBER,
  4      HISAL NUMBER
  5  );

Table created.

SQL> INSERT INTO SALGRADE VALUES (1,700,1200);

1 row created.

SQL> INSERT INTO SALGRADE VALUES (2,1201,1400);

1 row created.

SQL> INSERT INTO SALGRADE VALUES (3,1401,2000);

1 row created.

SQL> INSERT INTO SALGRADE VALUES (4,2001,3000);

1 row created.

SQL> INSERT INTO SALGRADE VALUES (5,3001,9999);

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

 -- 1. Write a query for the HR department to produce the addresses of all the departments. Use the EMP and DEPT tables. Show the EMPNO, ENAME,SAL, DNAME and LOC in the output. Use a NATURAL JOIN to produce the results. -- 

SQL> SELECT EMPNO,
  2         ENAME,
  3         SAL,
  4         DNAME,
  5         LOC
  6  FROM EMP
  7  NATURAL JOIN DEPT;

     EMPNO ENAME             SAL DNAME          LOC
---------- ---------- ---------- -------------- -------------
      7369 SMITH             800 RESEARCH       DALLAS
      7499 ALLEN            1600 SALES          CHICAGO
      7521 WARD             1250 SALES          CHICAGO
      7566 JONES            2975 RESEARCH       DALLAS
      7654 MARTIN           1250 SALES          CHICAGO
      7698 BLAKE            2850 SALES          CHICAGO
      7782 CLARK            2450 ACCOUNTING     NEW YORK
      7788 SCOTT            3000 RESEARCH       DALLAS
      7839 KING             5000 ACCOUNTING     NEW YORK
      7844 TURNER           1500 SALES          CHICAGO
      7876 ADAMS            1100 RESEARCH       DALLAS

     EMPNO ENAME             SAL DNAME          LOC
---------- ---------- ---------- -------------- -------------
      7900 JAMES             950 SALES          CHICAGO
      7902 FORD             3000 RESEARCH       DALLAS
      7934 MILLER           1300 ACCOUNTING     NEW YORK

14 rows selected.

 -- 2. The HR department needs a report of all employees. Write a query to display the JOB,MGR,SAL,COMM,DNAME of employees whose JOB is SALESMAN. -- 

SQL> SELECT JOB,
  2         MGR,
  3         SAL,
  4         COMM,
  5         DNAME
  6  FROM EMP E
  7  JOIN DEPT D
  8  ON E.DEPTNO = D.DEPTNO
  9  WHERE JOB='SALESMAN';

JOB              MGR        SAL       COMM DNAME
--------- ---------- ---------- ---------- --------------
SALESMAN        7698       1600        300 SALES
SALESMAN        7698       1250        500 SALES
SALESMAN        7698       1250       1400 SALES
SALESMAN        7698       1500          0 SALES

 -- 3. The HR department needs a report of employees in LOC  DALLAS. Display the ENAME, job, DEPTNO, and DNAME for all employees who work in DALLAS. -- 

SQL> SELECT ENAME,
  2         JOB,
  3         E.DEPTNO,
  4         DNAME
  5  FROM EMP E
  6  JOIN DEPT D
  7  ON E.DEPTNO=D.DEPTNO
  8  WHERE LOC='DALLAS';

ENAME      JOB           DEPTNO DNAME
---------- --------- ---------- --------------
SMITH      CLERK             20 RESEARCH
JONES      MANAGER           20 RESEARCH
SCOTT      ANALYST           20 RESEARCH
ADAMS      CLERK             20 RESEARCH
FORD       ANALYST           20 RESEARCH

 -- 4. Create a report to display employees’ ename and employee number along with their manager’s name and manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively. -- 

SQL> SELECT E.ENAME AS Employee,
  2         E.EMPNO AS "Emp#",
  3         M.ENAME AS Manager,
  4         M.EMPNO AS "Mgr#"
  5  FROM EMP E
  6  JOIN EMP M
  7  ON E.MGR=M.EMPNO;

EMPLOYEE         Emp# MANAGER          Mgr#
---------- ---------- ---------- ----------
SCOTT            7788 JONES            7566
FORD             7902 JONES            7566
ALLEN            7499 BLAKE            7698
WARD             7521 BLAKE            7698
MARTIN           7654 BLAKE            7698
TURNER           7844 BLAKE            7698
JAMES            7900 BLAKE            7698
MILLER           7934 CLARK            7782
ADAMS            7876 SCOTT            7788
JONES            7566 KING             7839
BLAKE            7698 KING             7839

EMPLOYEE         Emp# MANAGER          Mgr#
---------- ---------- ---------- ----------
CLARK            7782 KING             7839
SMITH            7369 FORD             7902

13 rows selected.

 -- 5. Modify the previous Query to display all employees including King, who has no manager. Order the results by the employee number. -- 

SQL> SELECT E.ENAME AS Employee,
  2         E.EMPNO AS "Emp#",
  3         M.ENAME AS Manager,
  4         M.EMPNO AS "Mgr#"
  5  FROM EMP E
  6  LEFT OUTER JOIN EMP M
  7  ON E.MGR=M.EMPNO
  8  ORDER BY E.EMPNO;

EMPLOYEE         Emp# MANAGER          Mgr#
---------- ---------- ---------- ----------
SMITH            7369 FORD             7902
ALLEN            7499 BLAKE            7698
WARD             7521 BLAKE            7698
JONES            7566 KING             7839
MARTIN           7654 BLAKE            7698
BLAKE            7698 KING             7839
CLARK            7782 KING             7839
SCOTT            7788 JONES            7566
KING             7839
TURNER           7844 BLAKE            7698
ADAMS            7876 SCOTT            7788

EMPLOYEE         Emp# MANAGER          Mgr#
---------- ---------- ---------- ----------
JAMES            7900 BLAKE            7698
FORD             7902 JONES            7566
MILLER           7934 CLARK            7782

14 rows selected.

 -- 6. The HR department needs a report on job grades and salaries. To familiarize yourself with the SALGRADE table, first show the structure of the SALGRADE table. Then create a query that displays the name, job, department name, salary, and grade for all employees. -- 


SQL> DESC SALGRADE;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 GRADE                                              NUMBER
 LOSAL                                              NUMBER
 HISAL                                              NUMBER

SQL> SELECT E.ENAME,
  2         E.JOB,
  3         D.DNAME,
  4         E.SAL,
  5         S.GRADE
  6  FROM EMP E
  7  JOIN DEPT D
  8  ON E.DEPTNO=D.DEPTNO
  9  JOIN SALGRADE S
 10  ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

ENAME      JOB       DNAME                 SAL      GRADE
---------- --------- -------------- ---------- ----------
MILLER     CLERK     ACCOUNTING           1300          2
CLARK      MANAGER   ACCOUNTING           2450          4
KING       PRESIDENT ACCOUNTING           5000          5
SMITH      CLERK     RESEARCH              800          1
ADAMS      CLERK     RESEARCH             1100          1
JONES      MANAGER   RESEARCH             2975          4
SCOTT      ANALYST   RESEARCH             3000          4
FORD       ANALYST   RESEARCH             3000          4
JAMES      CLERK     SALES                 950          1
WARD       SALESMAN  SALES                1250          2
MARTIN     SALESMAN  SALES                1250          2

ENAME      JOB       DNAME                 SAL      GRADE
---------- --------- -------------- ---------- ----------
ALLEN      SALESMAN  SALES                1600          3
TURNER     SALESMAN  SALES                1500          3
BLAKE      MANAGER   SALES                2850          4

14 rows selected.

 -- 7. Display the ENAME,DNAME of all the employees. Also display those department name which do not have any employees working. -- 

QL> SELECT E.ENAME,
  2         D.DNAME
  3  FROM DEPT D
  4  LEFT OUTER JOIN EMP E
  5  ON D.DEPTNO=E.DEPTNO;

ENAME      DNAME
---------- --------------
SMITH      RESEARCH
ALLEN      SALES
WARD       SALES
JONES      RESEARCH
MARTIN     SALES
BLAKE      SALES
CLARK      ACCOUNTING
SCOTT      RESEARCH
KING       ACCOUNTING
TURNER     SALES
ADAMS      RESEARCH

ENAME      DNAME
---------- --------------
JAMES      SALES
FORD       RESEARCH
MILLER     ACCOUNTING
           OPERATIONS

15 rows selected.

 -- 8. The HR department needs to find the names and hire dates for all employees who were hired before their managers, along with their managers’ names and hire dates. -- 

SQL> SELECT E.ENAME,
  2         E.HIREDATE,
  3         M.ENAME AS MANAGER,
  4         M.HIREDATE
  5  FROM EMP E
  6  JOIN EMP M
  7  ON E.MGR=M.EMPNO
  8  WHERE E.HIREDATE<M.HIREDATE;

ENAME      HIREDATE  MANAGER    HIREDATE
---------- --------- ---------- ---------
ALLEN      20-FEB-81 BLAKE      01-MAY-81
WARD       22-FEB-81 BLAKE      01-MAY-81
JONES      02-APR-81 KING       17-NOV-81
BLAKE      01-MAY-81 KING       17-NOV-81
CLARK      09-JUN-81 KING       17-NOV-81
SMITH      17-DEC-80 FORD       03-DEC-81

6 rows selected.

 -- 9. Display the EMPNO,ENAME,DNAME,LOC  of those employees who are working as CLERK. Use the USING clause. --

SQL> SELECT EMPNO,
  2         ENAME,
  3         DNAME,
  4         LOC
  5  FROM EMP
  6  JOIN DEPT
  7  USING(DEPTNO)
  8  WHERE JOB='CLERK';

     EMPNO ENAME      DNAME          LOC
---------- ---------- -------------- -------------
      7934 MILLER     ACCOUNTING     NEW YORK
      7369 SMITH      RESEARCH       DALLAS
      7876 ADAMS      RESEARCH       DALLAS
      7900 JAMES      SALES          CHICAGO


 -- 10. Display the ENAME,SAL,MGR,DNAME of employees whose salary is more than 2000. Use the ON clause. --

SQL> SELECT ENAME,
  2         SAL,
  3         MGR,
  4         DNAME
  5  FROM EMP
  6  JOIN DEPT
  7  ON EMP.DEPTNO=DEPT.DEPTNO
  8  WHERE SAL>2000;

ENAME             SAL        MGR DNAME
---------- ---------- ---------- --------------
JONES            2975       7839 RESEARCH
BLAKE            2850       7839 SALES
CLARK            2450       7839 ACCOUNTING
SCOTT            3000       7566 RESEARCH
KING             5000            ACCOUNTING
FORD             3000       7566 RESEARCH

6 rows selected.

 -- 11. Display the EMPNO,ENAME,JOB,DEPTNO,DNAME,LOC of employees. Use LEFT OUTER JOIN. -- 

SQL> SELECT EMPNO,
  2         ENAME,
  3         JOB,
  4         EMP.DEPTNO,
  5         DNAME,
  6         LOC
  7  FROM EMP
  8  LEFT OUTER JOIN DEPT
  9  ON EMP.DEPTNO=DEPT.DEPTNO;

     EMPNO ENAME      JOB           DEPTNO DNAME          LOC
---------- ---------- --------- ---------- -------------- -------------
      7782 CLARK      MANAGER           10 ACCOUNTING     NEW YORK
      7839 KING       PRESIDENT         10 ACCOUNTING     NEW YORK
      7934 MILLER     CLERK             10 ACCOUNTING     NEW YORK
      7369 SMITH      CLERK             20 RESEARCH       DALLAS
      7566 JONES      MANAGER           20 RESEARCH       DALLAS
      7788 SCOTT      ANALYST           20 RESEARCH       DALLAS
      7876 ADAMS      CLERK             20 RESEARCH       DALLAS
      7902 FORD       ANALYST           20 RESEARCH       DALLAS
      7499 ALLEN      SALESMAN          30 SALES          CHICAGO
      7521 WARD       SALESMAN          30 SALES          CHICAGO
      7654 MARTIN     SALESMAN          30 SALES          CHICAGO

     EMPNO ENAME      JOB           DEPTNO DNAME          LOC
---------- ---------- --------- ---------- -------------- -------------
      7698 BLAKE      MANAGER           30 SALES          CHICAGO
      7844 TURNER     SALESMAN          30 SALES          CHICAGO
      7900 JAMES      CLERK             30 SALES          CHICAGO

14 rows selected.


 -- 12. Display the ENAME,DNAME of employees. Use RIGHT OUTER JOIN. --

SQL> SELECT ENAME,
  2         DNAME
  3  FROM EMP
  4  RIGHT OUTER JOIN DEPT
  5  ON EMP.DEPTNO=DEPT.DEPTNO;

ENAME      DNAME
---------- --------------
SMITH      RESEARCH
ALLEN      SALES
WARD       SALES
JONES      RESEARCH
MARTIN     SALES
BLAKE      SALES
CLARK      ACCOUNTING
SCOTT      RESEARCH
KING       ACCOUNTING
TURNER     SALES
ADAMS      RESEARCH

ENAME      DNAME
---------- --------------
JAMES      SALES
FORD       RESEARCH
MILLER     ACCOUNTING
           OPERATIONS

15 rows selected.

 -- 13.  Display the EMPNO,DNAME,LOC of employees. Use FULL OUTER JOIN. --

SQL> SELECT EMPNO,
  2         DNAME,
  3         LOC
  4  FROM EMP
  5  FULL OUTER JOIN DEPT
  6  ON EMP.DEPTNO=DEPT.DEPTNO;

     EMPNO DNAME          LOC
---------- -------------- -------------
      7369 RESEARCH       DALLAS
      7499 SALES          CHICAGO
      7521 SALES          CHICAGO
      7566 RESEARCH       DALLAS
      7654 SALES          CHICAGO
      7698 SALES          CHICAGO
      7782 ACCOUNTING     NEW YORK
      7788 RESEARCH       DALLAS
      7839 ACCOUNTING     NEW YORK
      7844 SALES          CHICAGO
      7876 RESEARCH       DALLAS

     EMPNO DNAME          LOC
---------- -------------- -------------
      7900 SALES          CHICAGO
      7902 RESEARCH       DALLAS
      7934 ACCOUNTING     NEW YORK
           OPERATIONS     BOSTON

15 rows selected.