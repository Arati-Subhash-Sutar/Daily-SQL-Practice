---ROWNUM---

---1. Display the first 5 records from the EMP table.
SELECT *
FROM EMP
WHERE ROWNUM <= 5;

---   2. Display the top 3 highest paid employees using ROWNUM and an inline view.
SELECT *
FROM (
SELECT ENAME, SAL
FROM EMP
ORDER BY SAL DESC
)
WHERE ROWNUM <= 3;

---3. Display employee details along with their sequential ROWNUM value.
SELECT ROWNUM, ENAME, JOB, SAL
FROM EMP;

---   4. Fetch the first 10 employees ordered by hire date using ROWNUM.
SELECT *
FROM (
SELECT ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE ASC
)
WHERE ROWNUM <= 10;

---   5. Display employees in department 20 restricting the output to the first 4 rows.
SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 20 AND ROWNUM <= 4;

---   6. Retrieve the 5th to 10th rows from the EMP table using ROWNUM in a subquery.
SELECT *
FROM (
SELECT E.*, ROWNUM AS RN
FROM EMP E
)
WHERE RN BETWEEN 5 AND 10;

---   7. Find the most recently hired employee using ROWNUM.
SELECT *
FROM (
SELECT ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC
)
WHERE ROWNUM = 1;

---   8. Display the employee name and salary for the 2 lowest paid employees.
SELECT *
FROM (
SELECT ENAME, SAL
FROM EMP
ORDER BY SAL ASC
)
WHERE ROWNUM <= 2;

---   9. Select department details limiting the output to 2 rows.
SELECT DEPTNO, DNAME, LOC
FROM DEPT
WHERE ROWNUM <= 2;

---   10. Order employees by name and limit the result set to the first 6 rows.
SELECT *
FROM (
SELECT ENAME, JOB
FROM EMP
ORDER BY ENAME ASC
)
WHERE ROWNUM <= 6;

---ROWID---

---1. Display employee name, job, and their corresponding physical ROWID.
SELECT ROWID, ENAME, JOB
FROM EMP;

---   2. Delete duplicate records from a table while preserving one using ROWID.
DELETE FROM EMP E1
WHERE ROWID > (
SELECT MIN(ROWID)
FROM EMP E2
WHERE E1.EMPNO = E2.EMPNO
);

---3. Fetch employee details using a specific ROWID value.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE ROWID = 'AAAR3sAAEAAAABTAAA';

---   4. Display employee details and ROWID for employees in department 10.
SELECT ROWID, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

---   5. Find duplicate rows based on employee name using ROWID comparison.
SELECT *
FROM EMP
WHERE ROWID NOT IN (
SELECT MIN(ROWID)
FROM EMP
GROUP BY ENAME
);

---   6. Select employee name and length of their ROWID string.
SELECT ENAME, ROWID, LENGTH(ROWID) AS ROWID_LEN
FROM EMP;

---   7. Update salary for a specific employee identified by ROWID.
UPDATE EMP
SET SAL = SAL + 500
WHERE ROWID = 'AAAR3sAAEAAAABTAAA';

---   8. Order employees based on their physical row address using ROWID.
SELECT ROWID, ENAME, SAL
FROM EMP
ORDER BY ROWID ASC;

---   9. Display ROWID along with department name and location from DEPT table.
SELECT ROWID, DNAME, LOC
FROM DEPT;

---   10. Identify rows with identical salaries using ROWID to separate records.
SELECT E1.ENAME, E1.SAL, E1.ROWID
FROM EMP E1 JOIN EMP E2
ON E1.SAL = E2.SAL AND E1.ROWID != E2.ROWID;

---USER / UID---

---1. Display the current logged-in database user name.
SELECT USER
FROM DUAL;

---   2. Display employee details alongside the active session user name.
SELECT ENAME, SAL, USER
FROM EMP;

---3. Display the unique numeric identifier (UID) of the current database user.
SELECT UID, USER
FROM DUAL;

---   4. Filter audit records or employee queries based on current USER context.
SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE USER = 'SCOTT';

---   5. Display department details along with current UID.
SELECT DEPTNO, DNAME, UID
FROM DEPT;

---   6. Concatenate current user name with employee details.
SELECT CONCAT('Queried by: ', USER) AS AUDIT_INFO, ENAME
FROM EMP;

---   7. Display user name in lowercase and title case using USER pseudo column.
SELECT USER, LOWER(USER), INITCAP(USER)
FROM DUAL;

---   8. Insert a audit log record using USER and UID pseudo columns.
SELECT USER AS CREATED_BY, UID AS USER_ID, SYSDATE AS CREATED_DATE
FROM DUAL;

---   9. Compare current user string with department location string.
SELECT DNAME, LOC, USER
FROM DEPT
WHERE UPPER(LOC) = USER;

---   10. Order employee details and append active user context in output.
SELECT ENAME, SAL, USER
FROM EMP
ORDER BY SAL DESC;

---LEVEL---

---1. Display the organizational hierarchy levels starting from the top manager.
SELECT LEVEL, ENAME, JOB, MGR
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO = MGR;

---   2. Indent employee names based on their hierarchy level in the organization.
SELECT LEVEL, LPAD(' ', (LEVEL - 1) * 2) || ENAME AS HIERARCHY
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO = MGR;

---3. Find all direct and indirect subordinates of 'KING' along with their level.
SELECT LEVEL, ENAME, JOB
FROM EMP
START WITH ENAME = 'KING'
CONNECT BY PRIOR EMPNO = MGR;

---   4. Display employees who are at hierarchy level 2.
SELECT LEVEL, ENAME, JOB
FROM EMP
WHERE LEVEL = 2
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO = MGR;

---   5. Count the total number of employees at each level of hierarchy.
SELECT LEVEL, COUNT(*) AS TOTAL_EMPS
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO = MGR
GROUP BY LEVEL
ORDER BY LEVEL;

---   6. Display the level and path of manager hierarchy for 'SMITH'.
SELECT LEVEL, ENAME, JOB
FROM EMP
WHERE ENAME = 'SMITH'
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO = MGR;

---   7. Generate a sequence of numbers from 1 to 10 using LEVEL and DUAL.
SELECT LEVEL AS SEQ_NO
FROM DUAL
CONNECT BY LEVEL <= 10;

---   8. Generate a list of dates for the next 7 days using LEVEL.
SELECT SYSDATE + LEVEL - 1 AS NEXT_DATES
FROM DUAL
CONNECT BY LEVEL <= 7;

---   9. Display hierarchical tree starting from employee 'JONES'.
SELECT LEVEL, ENAME, SAL, MGR
FROM EMP
START WITH ENAME = 'JONES'
CONNECT BY PRIOR EMPNO = MGR;

---   10. Order hierarchical tree by employee salary within each level.
SELECT LEVEL, ENAME, SAL
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO = MGR
ORDER BY LEVEL ASC, SAL DESC;

---CURRVAL / NEXTVAL (SEQUENCES)---

---1. Generate the next value from a sequence named EMP_SEQ.
SELECT EMP_SEQ.NEXTVAL
FROM DUAL;

---   2. Display the current value of the sequence EMP_SEQ in the session.
SELECT EMP_SEQ.CURRVAL
FROM DUAL;

---3. Insert a new employee using NEXTVAL pseudo column for primary key generation.
INSERT INTO EMP (EMPNO, ENAME, SAL, DEPTNO)
VALUES (EMP_SEQ.NEXTVAL, 'CLARK', 2500, 10);

---   4. Display the next sequence value along with employee records.
SELECT EMP_SEQ.NEXTVAL, ENAME, SAL
FROM EMP
WHERE ROWNUM <= 5;

---   5. Use NEXTVAL to insert multiple records into a backup table.
INSERT INTO EMP_BAK (BAK_ID, ENAME, SAL)
SELECT EMP_SEQ.NEXTVAL, ENAME, SAL
FROM EMP;

---   6. Display current sequence value alongside current system date.
SELECT EMP_SEQ.CURRVAL, SYSDATE
FROM DUAL;

---   7. Assign next sequence number to new department inserts.
INSERT INTO DEPT (DEPTNO, DNAME, LOC)
VALUES (DEPT_SEQ.NEXTVAL, 'MARKETING', 'CHICAGO');

---   8. Select next sequence value converted to formatted string.
SELECT TO_CHAR(EMP_SEQ.NEXTVAL, '000000') AS FMT_SEQ
FROM DUAL;

---   9. Compare current sequence value with maximum employee number in EMP table.
SELECT EMP_SEQ.CURRVAL, MAX(EMPNO)
FROM EMP;

---   10. Fetch next sequence value for order processing simulation.
SELECT EMP_SEQ.NEXTVAL AS ORDER_ID, USER AS CREATED_BY
FROM DUAL;
