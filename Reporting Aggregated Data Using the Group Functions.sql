Reporting Aggregated Data Using the Group Functions:


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



 -- 1. Find the highest, lowest, sum, and average salary of all employees. Label the columns. -- 

SQL> SELECT
  2      MAX(SAL) AS HIGHEST_SALARY,
  3      MIN(SAL) AS LOWEST_SALARY,
  4      SUM(SAL) AS TOTAL_SALARY,
  5      ROUND(AVG(SAL)) AS AVERAGE_SALARY
  6  FROM EMP;

HIGHEST_SALARY LOWEST_SALARY TOTAL_SALARY AVERAGE_SALARY
-------------- ------------- ------------ --------------
          5000           800        29025           2073

 -- 2.Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number. -- 

SQL> SELECT
  2      ROUND(MAX(SAL)) AS MAXIMUM,
  3      ROUND(MIN(SAL)) AS MINIMUM,
  4      ROUND(SUM(SAL)) AS SUM,
  5      ROUND(AVG(SAL)) AS AVERAGE
  6  FROM EMP;

   MAXIMUM    MINIMUM        SUM    AVERAGE
---------- ---------- ---------- ----------
      5000        800      29025       2073

 -- 3. Modify the above query to display the minimum, maximum, sum, and average salary for each job type. -- 

SQL> SELECT
  2      JOB,
  3      MIN(SAL) AS MINIMUM,
  4      MAX(SAL) AS MAXIMUM,
  5      SUM(SAL) AS TOTAL,
  6      ROUND(AVG(SAL)) AS AVERAGE
  7  FROM EMP
  8  GROUP BY JOB;

JOB          MINIMUM    MAXIMUM      TOTAL    AVERAGE
--------- ---------- ---------- ---------- ----------
CLERK            800       1300       4150       1038
SALESMAN        1250       1600       5600       1400
MANAGER         2450       2975       8275       2758
ANALYST         3000       3000       6000       3000
PRESIDENT       5000       5000       5000       5000

 -- 4. Write a query to display the number of people with the same job. --

SQL> SELECT
  2      JOB,
  3      COUNT(*) AS NUMBER_OF_EMPLOYEES
  4  FROM EMP
  5  GROUP BY JOB;

JOB       NUMBER_OF_EMPLOYEES
--------- -------------------
CLERK                       4
SALESMAN                    4
MANAGER                     3
ANALYST                     2
PRESIDENT                   1

 -- 5.  Determine the number of managers without listing them. Label the column Number of Managers. -- 

SQL> SELECT
  2      COUNT(DISTINCT MGR) AS "NUMBER OF MANAGERS"
  3  FROM EMP
  4  WHERE MGR IS NOT NULL;

NUMBER OF MANAGERS
------------------
                 6

 -- 6. Find the difference between the highest and lowest salaries. Label the column DIFFERENCE. -- 

SQL> SELECT
  2      MAX(SAL) - MIN(SAL) AS DIFFERENCE
  3  FROM EMP;

DIFFERENCE
----------
      4200

 -- 7. Create a report to display the manager number and the salary of the lowest-paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $2000 or less. Sort the output in descending order of salary. --

SQL> SELECT
  2      MGR,
  3      MIN(SAL) AS LOWEST_SALARY
  4  FROM EMP
  5  WHERE MGR IS NOT NULL
  6  GROUP BY MGR
  7  HAVING MIN(SAL) > 2000
  8  ORDER BY LOWEST_SALARY DESC;

       MGR LOWEST_SALARY
---------- -------------
      7566          3000
      7839          2450

 -- 8.Create a query to display the total number of employees and, of that total, the number of employees hired in 1980, 1981, and 1982. Create appropriate column headings. -- 

SQL> SELECT
  2      COUNT(*) AS TOTAL_EMPLOYEES,
  3      SUM(CASE WHEN TO_CHAR(HIREDATE,'YYYY')='1980' THEN 1 ELSE 0 END) AS HIRED_1980,
  4      SUM(CASE WHEN TO_CHAR(HIREDATE,'YYYY')='1981' THEN 1 ELSE 0 END) AS HIRED_1981,
  5      SUM(CASE WHEN TO_CHAR(HIREDATE,'YYYY')='1982' THEN 1 ELSE 0 END) AS HIRED_1982
  6  FROM EMP;

TOTAL_EMPLOYEES HIRED_1980 HIRED_1981 HIRED_1982
--------------- ---------- ---------- ----------
             14          1         10          2