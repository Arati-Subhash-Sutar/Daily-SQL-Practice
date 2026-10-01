---NVL()---

---1. Display employee names and their commission, replacing NULL values with 0.
SELECT ENAME, NVL(COMM, 0) AS COMMISSION
FROM EMP;

---   2. Calculate total compensation (salary plus commission) for all employees using NVL.
SELECT ENAME, SAL, COMM, SAL + NVL(COMM, 0) AS TOTAL_SAL
FROM EMP;

---3. Display employee manager ID, replacing NULL with 0 for the top manager.
SELECT ENAME, NVL(MGR, 0) AS MANAGER_ID
FROM EMP;

---   4. Display employee name and commission, showing -1 if commission is NULL.
SELECT ENAME, NVL(COMM, -1) AS COMM_STATUS
FROM EMP;

---   5. Find employees whose commission or 0 is equal to 0.
SELECT ENAME, SAL, NVL(COMM, 0)
FROM EMP
WHERE NVL(COMM, 0) = 0;

---   6. Display employee name, salary, commission, and total annual earnings using NVL.
SELECT ENAME, (SAL + NVL(COMM, 0)) * 12 AS ANNUAL_EARNINGS
FROM EMP;

---   7. List department number 30 employees showing commission substituted with 100 if NULL.
SELECT ENAME, SAL, NVL(COMM, 100) AS ADJUSTED_COMM
FROM EMP
WHERE DEPTNO = 30;

---   8. Calculate average commission considering NULL values as 0.
SELECT AVG(NVL(COMM, 0)) AS AVG_COMMISSION
FROM EMP;

---   9. Display employee job and manager ID, replacing NULL manager with 9999.
SELECT ENAME, JOB, NVL(MGR, 9999) AS MGR_NO
FROM EMP;

---   10. Order all employees by their commission with NULL values treated as zero.
SELECT ENAME, SAL, NVL(COMM, 0) AS COMM
FROM EMP
ORDER BY NVL(COMM, 0) DESC;

---NVL2()---

---1. Display 'Commissioned' if employee has commission, otherwise 'Salaried'.
SELECT ENAME, COMM, NVL2(COMM, 'Commissioned', 'Salaried') AS PAY_TYPE
FROM EMP;

---   2. Display salary plus commission if commission exists, else display salary only using NVL2.
SELECT ENAME, SAL, COMM, NVL2(COMM, SAL + COMM, SAL) AS NET_PAY
FROM EMP;

---3. Display 'Has Manager' if MGR is present, else display 'Top Boss'.
SELECT ENAME, JOB, NVL2(MGR, 'Has Manager', 'Top Boss') AS MANAGER_STATUS
FROM EMP;

---   4. Calculate bonus as 20% of commission if available, otherwise 10% of salary.
SELECT ENAME, SAL, COMM, NVL2(COMM, COMM * 0.20, SAL * 0.10) AS BONUS
FROM EMP;

---   5. Display department number and 'Assigned' or 'Unassigned' based on DEPTNO presence.
SELECT ENAME, DEPTNO, NVL2(DEPTNO, 'Assigned', 'Unassigned') AS DEPT_STATUS
FROM EMP;

---   6. Display 'Eligible' if commission is present, otherwise 'Not Eligible' for sales team.
SELECT ENAME, JOB, NVL2(COMM, 'Eligible', 'Not Eligible') AS ELIGIBILITY
FROM EMP
WHERE JOB = 'SALESMAN';

---   7. Show 'Direct Report' if manager ID exists, else 'CEO' for department 10.
SELECT ENAME, NVL2(MGR, 'Direct Report', 'CEO') AS ROLE_TYPE
FROM EMP
WHERE DEPTNO = 10;

---   8. Display employee salary with a 1000 increment if commission is not NULL, else 500 increment.
SELECT ENAME, SAL, NVL2(COMM, SAL + 1000, SAL + 500) AS REVISED_SAL
FROM EMP;

---   9. Display 'Valid Comm' if commission is present, otherwise 'No Comm' for department 30.
SELECT ENAME, COMM, NVL2(COMM, 'Valid Comm', 'No Comm') AS COMM_CHECK
FROM EMP
WHERE DEPTNO = 30;

---   10. Order all employees by the result of NVL2 checking commission status.
SELECT ENAME, NVL2(COMM, 'Has Comm', 'No Comm') AS COMM_STATUS
FROM EMP
ORDER BY NVL2(COMM, 'Has Comm', 'No Comm') ASC;

---COALESCE()---

---1. Display the first non-null value among commission, salary, and 0 for each employee.
SELECT ENAME, COALESCE(COMM, SAL, 0) AS FIRST_NON_NULL
FROM EMP;

---   2. Calculate total earnings selecting commission first, then salary allowance, then base salary.
SELECT ENAME, COALESCE(SAL + COMM, SAL, 0) AS TOTAL_INCOME
FROM EMP;

---3. Display manager ID, or department number if manager is NULL, or 9999 if both are NULL.
SELECT ENAME, COALESCE(MGR, DEPTNO, 9999) AS REF_NUMBER
FROM EMP;

---   4. Return the first valid date among commission update date, hire date, and current date.
SELECT ENAME, COALESCE(HIREDATE, SYSDATE) AS EFFECTIVE_DATE
FROM EMP;

---   5. Display employee name and job title or 'No Job Assigned' using COALESCE.
SELECT ENAME, COALESCE(JOB, 'No Job Assigned') AS JOB_ROLE
FROM EMP;

---   6. Display compensation using COALESCE for employees in department 20.
SELECT ENAME, COALESCE(COMM, SAL) AS PAY
FROM EMP
WHERE DEPTNO = 20;

---   7. Evaluate COALESCE with multiple numeric fallback values for salary adjustments.
SELECT ENAME, SAL, COMM, COALESCE(COMM, SAL * 0.10, 100) AS EXTRA_PAY
FROM EMP;

---   8. Display 'NO DETAILS' if both job and manager are missing using COALESCE.
SELECT ENAME, COALESCE(JOB, TO_CHAR(MGR), 'NO DETAILS') AS INFO
FROM EMP;

---   9. Find employees where COALESCE of commission and salary exceeds 2500.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COALESCE(COMM, SAL) > 2500;

---   10. Order all employees by the output of COALESCE function on commission and salary.
SELECT ENAME, SAL, COMM, COALESCE(COMM, SAL) AS SORT_VAL
FROM EMP
ORDER BY COALESCE(COMM, SAL) DESC;

---NULLIF()---

---1. Compare employee job title length with name length and return NULL if they are equal.
SELECT ENAME, JOB, NULLIF(LENGTH(ENAME), LENGTH(JOB)) AS LENGTH_DIFF
FROM EMP;

---   2. Return NULL if salary is equal to 3000, otherwise return salary.
SELECT ENAME, SAL, NULLIF(SAL, 3000) AS SAL_CHECK
FROM EMP;

---3. Compare commission with 0 and return NULL if commission is zero.
SELECT ENAME, COMM, NULLIF(COMM, 0) AS MODIFIED_COMM
FROM EMP;

---   4. Display NULL if department number is equal to 10, otherwise display DEPTNO.
SELECT ENAME, DEPTNO, NULLIF(DEPTNO, 10) AS DEPT_CHECK
FROM EMP;

---   5. Compare employee salary with target salary 1500 using NULLIF.
SELECT ENAME, SAL, NULLIF(SAL, 1500) AS RESULT
FROM EMP;

---   6. Return NULL if job title is 'CLERK', otherwise return job title.
SELECT ENAME, JOB, NULLIF(JOB, 'CLERK') AS NON_CLERK
FROM EMP;

---   7. Calculate average salary avoiding a specific salary benchmark using NULLIF.
SELECT AVG(NULLIF(SAL, 5000)) AS AVG_EXCL_TOP
FROM EMP;

---   8. Compare hiredate year with 1981 and return NULL if hired in 1981.
SELECT ENAME, HIREDATE, NULLIF(TO_CHAR(HIREDATE, 'YYYY'), '1981') AS HIRE_YEAR_CHECK
FROM EMP;

---   9. Display NULL if commission equals salary, else return commission.
SELECT ENAME, SAL, COMM, NULLIF(COMM, SAL) AS COMM_RESULT
FROM EMP;

---   10. Order all employees by NULLIF outcome comparing DEPTNO with 20.
SELECT ENAME, DEPTNO, NULLIF(DEPTNO, 20) AS SORT_COL
FROM EMP
ORDER BY NULLIF(DEPTNO, 20) NULLS LAST;

---DECODE()---

---1. Decode department number to display full department name for all employees.
SELECT ENAME, DEPTNO,
DECODE(DEPTNO, 10, 'ACCOUNTING',
20, 'RESEARCH',
30, 'SALES',
40, 'OPERATIONS', 'UNKNOWN') AS DEPT_NAME
FROM EMP;

---   2. Decode job title to assign specific tax percentages to each role.
SELECT ENAME, JOB, SAL,
DECODE(JOB, 'PRESIDENT', SAL * 0.30,
'MANAGER',   SAL * 0.20,
'ANALYST',   SAL * 0.15,
SAL * 0.10) AS TAX_AMOUNT
FROM EMP;

---3. Display designation abbreviation based on job title using DECODE.
SELECT ENAME, JOB,
DECODE(JOB, 'CLERK', 'CLK',
'SALESMAN', 'SLM',
'MANAGER', 'MGR',
'ANALYST', 'ANL',
'PRESIDENT', 'PRE', 'OTH') AS SHORT_JOB
FROM EMP;

---   4. Decode commission presence returning 'Commissioned' or 'Non-Commissioned'.
SELECT ENAME, COMM,
DECODE(COMM, NULL, 'Non-Commissioned', 'Commissioned') AS COMM_STATUS
FROM EMP;

---   5. Display custom bonus based on department number for all employees.
SELECT ENAME, DEPTNO, SAL,
DECODE(DEPTNO, 10, 500,
20, 1000,
30, 1500, 0) AS DEPT_BONUS
FROM EMP;

---   6. Decode hire year to categorize employee tenure groups.
SELECT ENAME, HIREDATE,
DECODE(TO_CHAR(HIREDATE, 'YYYY'), '1980', 'Senior',
'1981', 'Mid-Senior',
'1982', 'Junior', 'Recent') AS TENURE_GROUP
FROM EMP;

---   7. Calculate modified salary by giving increment based on job role.
SELECT ENAME, JOB, SAL,
SAL + DECODE(JOB, 'CLERK', 200,
'SALESMAN', 400,
'MANAGER', 600, 0) AS REVISED_SAL
FROM EMP;

---   8. Decode department location from DEPT table.
SELECT DNAME, LOC,
DECODE(LOC, 'NEW YORK', 'HQ',
'DALLAS', 'BRANCH-1',
'CHICAGO', 'BRANCH-2',
'BOSTON', 'BRANCH-3', 'OTHER') AS LOCATION_TYPE
FROM DEPT;

---   9. Decode manager ID to display the manager's name for department 20.
SELECT ENAME, MGR,
DECODE(MGR, 7839, 'KING',
7566, 'JONES',
7788, 'SCOTT', 'OTHER') AS MANAGER_NAME
FROM EMP
WHERE DEPTNO = 20;

---   10. Order all employees based on decoded priority of their job title.
SELECT ENAME, JOB,
DECODE(JOB, 'PRESIDENT', 1,
'MANAGER', 2,
'ANALYST', 3,
'SALESMAN', 4, 5) AS JOB_PRIORITY
FROM EMP
ORDER BY JOB_PRIORITY ASC;

---CASE---

---1. Classify employees into salary grades based on salary ranges.
SELECT ENAME, SAL,
CASE
WHEN SAL >= 3000 THEN 'HIGH SALARY'
WHEN SAL >= 1500 THEN 'MEDIUM SALARY'
ELSE 'LOW SALARY'
END AS SALARY_GRADE
FROM EMP;

---   2. Calculate performance bonus based on job role and salary using CASE expression.
SELECT ENAME, JOB, SAL,
CASE JOB
WHEN 'PRESIDENT' THEN SAL * 0.30
WHEN 'MANAGER' THEN SAL * 0.20
WHEN 'ANALYST' THEN SAL * 0.15
ELSE SAL * 0.10
END AS BONUS
FROM EMP;

---3. Display eligibility for annual appraisal based on hire date and department.
SELECT ENAME, DEPTNO, HIREDATE,
CASE
WHEN DEPTNO = 10 AND HIREDATE < TO_DATE('01-JAN-1982', 'DD-MON-YYYY') THEN 'ELIGIBLE-CAT A'
WHEN HIREDATE < TO_DATE('01-JAN-1982', 'DD-MON-YYYY') THEN 'ELIGIBLE-CAT B'
ELSE 'NOT ELIGIBLE'
END AS APPRAISAL_STATUS
FROM EMP;

---   4. Categorize employees based on compensation structure (salary + commission).
SELECT ENAME, SAL, COMM,
CASE
WHEN COMM IS NOT NULL AND COMM > 0 THEN 'SALARY + COMMISSION'
WHEN COMM = 0 THEN 'SALARY + ZERO COMM'
ELSE 'ONLY SALARY'
END AS COMP_STRUCTURE
FROM EMP;

---   5. Display employee name and workload category based on department number.
SELECT ENAME, DEPTNO,
CASE DEPTNO
WHEN 10 THEN 'LIGHT WORKLOAD'
WHEN 20 THEN 'HEAVY WORKLOAD'
WHEN 30 THEN 'MODERATE WORKLOAD'
ELSE 'UNASSIGNED'
END AS WORKLOAD
FROM EMP;

---   6. Identify salary brackets for employees in department 30 using CASE.
SELECT ENAME, SAL,
CASE
WHEN SAL < 1200 THEN 'BAND 1'
WHEN SAL BETWEEN 1200 AND 2000 THEN 'BAND 2'
ELSE 'BAND 3'
END AS SAL_BAND
FROM EMP
WHERE DEPTNO = 30;

---   7. Determine shift allocation based on employee number being odd or even.
SELECT ENAME, EMPNO,
CASE
WHEN MOD(EMPNO, 2) = 0 THEN 'NIGHT SHIFT'
ELSE 'DAY SHIFT'
END AS SHIFT_TYPE
FROM EMP;

---   8. Calculate tax percentage dynamically based on combined income.
SELECT ENAME, (SAL + NVL(COMM, 0)) AS TOTAL_PAY,
CASE
WHEN (SAL + NVL(COMM, 0)) > 3000 THEN '30%'
WHEN (SAL + NVL(COMM, 0)) BETWEEN 1500 AND 3000 THEN '20%'
ELSE '10%'
END AS TAX_BRACKET
FROM EMP;

---   9. Display job level based on job title using searched CASE expression.
SELECT ENAME, JOB,
CASE
WHEN JOB IN ('PRESIDENT', 'MANAGER') THEN 'EXECUTIVE'
WHEN JOB IN ('ANALYST') THEN 'SENIOR STAFF'
ELSE 'JUNIOR STAFF'
END AS JOB_LEVEL
FROM EMP;

---   10. Order all employees dynamically using CASE expression in ORDER BY clause.
SELECT ENAME, DEPTNO, SAL
FROM EMP
ORDER BY CASE DEPTNO
WHEN 20 THEN 1
WHEN 10 THEN 2
WHEN 30 THEN 3
ELSE 4
END, SAL DESC;
