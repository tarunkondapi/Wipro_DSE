NORMALIZATION:

SQL> CREATE TABLE EMPLOYEE_NF (
  2      EMPNO NUMBER PRIMARY KEY,
  3      ENAME VARCHAR2(30),
  4      SAL NUMBER,
  5      DEPTNO NUMBER,
  6      DNAME VARCHAR2(30),
  7      LOC VARCHAR2(30)
  8  );

Table created.

SQL> INSERT INTO EMPLOYEE_NF VALUES (101,'RAM',30000,10,'HR','HYDERABAD');

1 row created.

SQL> INSERT INTO EMPLOYEE_NF VALUES (102,'RAVI',35000,20,'SALES','CHENNAI');

1 row created.

SQL> INSERT INTO EMPLOYEE_NF VALUES (103,'RAJU',40000,10,'HR','HYDERABAD');

1 row created.

SQL> INSERT INTO EMPLOYEE_NF VALUES (104,'SITA',45000,30,'IT','BANGALORE');

1 row created.

SQL> COMMIT;

Commit complete.

SQL> CREATE TABLE DEPARTMENT (
  2      DEPTNO NUMBER PRIMARY KEY,
  3      DNAME VARCHAR2(30),
  4      LOC VARCHAR2(30)
  5  );

Table created.

SQL> INSERT INTO DEPARTMENT VALUES (10,'HR','HYDERABAD');

1 row created.

SQL> INSERT INTO DEPARTMENT VALUES (20,'SALES','CHENNAI');

1 row created.

SQL> INSERT INTO DEPARTMENT VALUES (30,'IT','BANGALORE');

1 row created.

SQL> COMMIT;

Commit complete.

SQL> CREATE TABLE STUDENT_NF (
  2      ROLLNO NUMBER,
  3      NAME VARCHAR2(30),
  4      AGE NUMBER,
  5      EXAM VARCHAR2(30),
  6      MARKS NUMBER,
  7      GRADE CHAR(2)
  8  );

Table created.

SQL> INSERT INTO STUDENT_NF VALUES (1,'RAHUL',20,'DBMS',90,'A');

1 row created.

SQL> INSERT INTO STUDENT_NF VALUES (1,'RAHUL',20,'JAVA',85,'B');

1 row created.

SQL> INSERT INTO STUDENT_NF VALUES (2,'ANU',21,'DBMS',95,'A');

1 row created.

SQL> INSERT INTO STUDENT_NF VALUES (2,'ANU',21,'JAVA',80,'B');

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM STUDENT_NF;

    ROLLNO NAME                                  AGE
---------- ------------------------------ ----------
EXAM                                MARKS GR
------------------------------ ---------- --
         1 RAHUL                                  20
DBMS                                   90 A

         1 RAHUL                                  20
JAVA                                   85 B

         2 ANU                                    21
DBMS                                   95 A


    ROLLNO NAME                                  AGE
---------- ------------------------------ ----------
EXAM                                MARKS GR
------------------------------ ---------- --
         2 ANU                                    21
JAVA                                   80 B


SQL> CREATE TABLE STUDENT (
  2      ROLLNO NUMBER PRIMARY KEY,
  3      NAME VARCHAR2(30),
  4      AGE NUMBER
  5  );

Table created.

SQL> INSERT INTO STUDENT VALUES (1,'RAHUL',20);

1 row created.

SQL> INSERT INTO STUDENT VALUES (2,'ANU',21);

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> CREATE TABLE STUDENT_MARKS (
  2      ROLLNO NUMBER,
  3      EXAM VARCHAR2(30),
  4      MARKS NUMBER,
  5      GRADE CHAR(2),
  6      PRIMARY KEY (ROLLNO, EXAM),
  7      FOREIGN KEY (ROLLNO) REFERENCES STUDENT(ROLLNO)
  8  );

Table created.

SQL> INSERT INTO STUDENT_MARKS VALUES (1,'DBMS',90,'A');

1 row created.

SQL> INSERT INTO STUDENT_MARKS VALUES (1,'JAVA',85,'B');

1 row created.

SQL> INSERT INTO STUDENT_MARKS VALUES (2,'DBMS',95,'A');

1 row created.

SQL> INSERT INTO STUDENT_MARKS VALUES (2,'JAVA',80,'B');

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM STUDENT;

    ROLLNO NAME                                  AGE
---------- ------------------------------ ----------
         1 RAHUL                                  20
         2 ANU                                    21

SQL> SELECT * FROM STUDENT_MARKS;

    ROLLNO EXAM                                MARKS GR
---------- ------------------------------ ---------- --
         1 DBMS                                   90 A
         1 JAVA                                   85 B
         2 DBMS                                   95 A
         2 JAVA                                   80 B

SQL> CREATE TABLE EMP_PROJECT_NF (
  2      EMPNO NUMBER,
  3      PROJECT_NO NUMBER,
  4      NO_OF_DAYS NUMBER,
  5      CUSTOMERNAME VARCHAR2(30),
  6      PRIMARY KEY (EMPNO, PROJECT_NO)
  7  );

Table created.

SQL> INSERT INTO EMP_PROJECT_NF VALUES (101,1001,30,'TCS');

1 row created.

SQL> INSERT INTO EMP_PROJECT_NF VALUES (101,1002,20,'INFOSYS');

1 row created.

SQL> INSERT INTO EMP_PROJECT_NF VALUES (102,1001,25,'TCS');

1 row created.

SQL> INSERT INTO EMP_PROJECT_NF VALUES (103,1003,40,'WIPRO');

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM EMP_PROJECT_NF;

     EMPNO PROJECT_NO NO_OF_DAYS CUSTOMERNAME
---------- ---------- ---------- ------------------------------
       101       1001         30 TCS
       101       1002         20 INFOSYS
       102       1001         25 TCS
       103       1003         40 WIPRO

SQL> CREATE TABLE PROJECT (
  2      PROJECT_NO NUMBER PRIMARY KEY,
  3      CUSTOMERNAME VARCHAR2(30)
  4  );

Table created.

SQL> INSERT INTO PROJECT VALUES (1001,'TCS');

1 row created.

SQL> INSERT INTO PROJECT VALUES (1002,'INFOSYS');

1 row created.

SQL> INSERT INTO PROJECT VALUES (1003,'WIPRO');

1 row created.

SQL> COMMIT;

Commit complete.

SQL> CREATE TABLE EMP_PROJECT (
  2      EMPNO NUMBER,
  3      PROJECT_NO NUMBER,
  4      NO_OF_DAYS NUMBER,
  5      PRIMARY KEY (EMPNO, PROJECT_NO),
  6      FOREIGN KEY (PROJECT_NO)
  7          REFERENCES PROJECT(PROJECT_NO)
  8  );

Table created.

SQL> INSERT INTO EMP_PROJECT VALUES (101,1001,30);

1 row created.

SQL> INSERT INTO EMP_PROJECT VALUES (101,1002,20);

1 row created.

SQL> INSERT INTO EMP_PROJECT VALUES (102,1001,25);

1 row created.

SQL> INSERT INTO EMP_PROJECT VALUES (103,1003,40);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM PROJECT;

PROJECT_NO CUSTOMERNAME
---------- ------------------------------
      1001 TCS
      1002 INFOSYS
      1003 WIPRO

SQL> SELECT * FROM EMP_PROJECT;

     EMPNO PROJECT_NO NO_OF_DAYS
---------- ---------- ----------
       101       1001         30
       101       1002         20
       102       1001         25
       103       1003         40

SQL>
