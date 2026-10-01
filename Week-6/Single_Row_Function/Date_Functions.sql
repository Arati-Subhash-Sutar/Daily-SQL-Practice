---SYSDATE / SYSDATE()---

---1. Display the current system date and time.
SELECT SYSDATE
FROM DUAL;

---   2. Display employee names along with the current system date.
SELECT ENAME, SYSDATE
FROM EMP;

---3. Calculate the total experience of all employees in years using SYSDATE.
SELECT ENAME, ROUND((SYSDATE - HIREDATE) / 365, 2) AS YEARS_EXP
FROM EMP;

---   4. Find all employees hired in the current year.
SELECT ENAME, HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY');

---   5. Display the system date formatted as 'DD-MON-YYYY HH24:MI:SS'.
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') AS TODAY_TIME
FROM DUAL;

---   6. Find employees who joined more than 10000 days ago from today.
SELECT ENAME, HIREDATE
FROM EMP
WHERE (SYSDATE - HIREDATE) > 10000;

---   7. Display the date 100 days after current system date.
SELECT SYSDATE, SYSDATE + 100 AS FUTURE_DATE
FROM DUAL;

---   8. Display employee names, hiredate, and number of days elapsed since hire date.
SELECT ENAME, HIREDATE, ROUND(SYSDATE - HIREDATE) AS DAYS_WORKED
FROM EMP;

---   9. List employees hired on the same day of the week as today.
SELECT ENAME, HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE, 'DAY') = TO_CHAR(SYSDATE, 'DAY');

---   10. Order all employees by the number of days between SYSDATE and their hire date in descending order.
SELECT ENAME, HIREDATE, (SYSDATE - HIREDATE) AS TENURE
FROM EMP
ORDER BY (SYSDATE - HIREDATE) DESC;

---CURRENT_DATE / CURRENT_DATE()---

---1. Display the current date according to the session time zone.
SELECT CURRENT_DATE
FROM DUAL;

---   2. Display employee name and session current date for all employees in department 10.
SELECT ENAME, CURRENT_DATE
FROM EMP
WHERE DEPTNO = 10;

---3. Find the number of days between CURRENT_DATE and hiredate for each employee.
SELECT ENAME, ROUND(CURRENT_DATE - HIREDATE) AS DAYS_SERVED
FROM EMP;

---   4. Display the day of the week for CURRENT_DATE.
SELECT CURRENT_DATE, TO_CHAR(CURRENT_DATE, 'DAY') AS TODAY_DAY
FROM DUAL;

---   5. Show employees hired before CURRENT_DATE minus 15000 days.
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE < (CURRENT_DATE - 15000);

---   6. Display CURRENT_DATE formatted to show full month name and year.
SELECT TO_CHAR(CURRENT_DATE, 'Month DD, YYYY') AS FORMATTED_DATE
FROM DUAL;

---   7. Calculate age in days between employee hiredate and CURRENT_DATE.
SELECT ENAME, TRUNC(CURRENT_DATE - HIREDATE) AS TOTAL_DAYS
FROM EMP;

---   8. Display department names alongside CURRENT_DATE.
SELECT DNAME, CURRENT_DATE
FROM DEPT;

---   9. Display employees hired within the current month using CURRENT_DATE.
SELECT ENAME, HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE, 'MM-YYYY') = TO_CHAR(CURRENT_DATE, 'MM-YYYY');

---   10. Order all employees by difference between CURRENT_DATE and hiredate in ascending order.
SELECT ENAME, HIREDATE, (CURRENT_DATE - HIREDATE)
FROM EMP
ORDER BY (CURRENT_DATE - HIREDATE) ASC;

---SYSTIMESTAMP / SYSTIMESTAMP()---

---1. Display the system date and precise timestamp including fractional seconds and time zone.
SELECT SYSTIMESTAMP
FROM DUAL;

---   2. Display employee names along with the current system timestamp.
SELECT ENAME, SYSTIMESTAMP
FROM EMP;

---3. Extract hour and minute components from SYSTIMESTAMP.
SELECT EXTRACT(HOUR FROM SYSTIMESTAMP) AS CURRENT_HOUR,
EXTRACT(MINUTE FROM SYSTIMESTAMP) AS CURRENT_MINUTE
FROM DUAL;

---   4. Display the difference between SYSTIMESTAMP and employee hiredate.
SELECT ENAME, SYSTIMESTAMP - CAST(HIREDATE AS TIMESTAMP) AS EXACT_TENURE
FROM EMP;

---   5. Format SYSTIMESTAMP to display full timestamp string with time zone name.
SELECT TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS.FF TZR') AS DETAILED_TIME
FROM DUAL;

---   6. Display department details along with SYSTIMESTAMP.
SELECT DEPTNO, DNAME, SYSTIMESTAMP
FROM DEPT;

---   7. Calculate exact timestamp value for 7 days from now using SYSTIMESTAMP.
SELECT SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '7' DAY AS NEXT_WEEK
FROM DUAL;

---   8. Display employee name and cast HIREDATE as timestamp alongside SYSTIMESTAMP.
SELECT ENAME, CAST(HIREDATE AS TIMESTAMP), SYSTIMESTAMP
FROM EMP;

---   9. Check time zone displacement from UTC using SYSTIMESTAMP.
SELECT SESSIONTIMEZONE, SYSTIMESTAMP
FROM DUAL;

---   10. Order all employees by job title and output current SYSTIMESTAMP.
SELECT ENAME, JOB, SYSTIMESTAMP
FROM EMP
ORDER BY JOB ASC;

---MONTHS_BETWEEN()---

---1. Find the number of months between current date and hiredate for all employees.
SELECT ENAME, MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS_WORKED
FROM EMP;

---   2. Display employee name and rounded number of months served in the company.
SELECT ENAME, ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS ROUNDED_MONTHS
FROM EMP;

---3. Find employees who have completed more than 400 months of service.
SELECT ENAME, HIREDATE
FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) > 400;

---   4. Display total experience of employees in years using MONTHS_BETWEEN.
SELECT ENAME, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)/12, 1) AS YEARS_EXP
FROM EMP;

---   5. Calculate months between hiredate of 'SMITH' and hiredate of 'KING'.
SELECT MONTHS_BETWEEN(
(SELECT HIREDATE FROM EMP WHERE ENAME = 'KING'),
(SELECT HIREDATE FROM EMP WHERE ENAME = 'SMITH')
) AS MONTHS_DIFF
FROM DUAL;

---   6. Display employee name, hiredate, and months worked for department 20.
SELECT ENAME, HIREDATE, ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE), 2)
FROM EMP
WHERE DEPTNO = 20;

---   7. List employees whose service in months is an even number after truncating.
SELECT ENAME, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS TOTAL_MONTHS
FROM EMP
WHERE MOD(TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)), 2) = 0;

---   8. Display employee name, job, and months between SYSDATE and hiredate for MANAGERs.
SELECT ENAME, JOB, ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE))
FROM EMP
WHERE JOB = 'MANAGER';

---   9. Find the difference in months between end of current year and employee hiredate.
SELECT ENAME, ROUND(MONTHS_BETWEEN(TRUNC(SYSDATE, 'YYYY') + INTERVAL '1' YEAR - 1, HIREDATE))
FROM EMP;

---   10. Order all employees by the number of months served in descending order.
SELECT ENAME, HIREDATE, MONTHS_BETWEEN(SYSDATE, HIREDATE)
FROM EMP
ORDER BY MONTHS_BETWEEN(SYSDATE, HIREDATE) DESC;

---ADD_MONTHS()---

---1. Add 6 months to the hiredate of all employees.
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6) AS REVIEW_DATE
FROM EMP;

---   2. Display the date 3 months prior to employee hiredate.
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, -3) AS PREV_DATE
FROM EMP;

---3. Find the confirmation date (1 year after hiredate) for employees in department 10.
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 12) AS CONFIRM_DATE
FROM EMP
WHERE DEPTNO = 10;

---   4. Display employee name and the date 1 month after current date.
SELECT ENAME, ADD_MONTHS(SYSDATE, 1) AS NEXT_MONTH
FROM EMP;

---   5. Find employees whose hiredate plus 24 months is before '01-JAN-1983'.
SELECT ENAME, HIREDATE
FROM EMP
WHERE ADD_MONTHS(HIREDATE, 24) < TO_DATE('01-JAN-1983', 'DD-MON-YYYY');

---   6. Display the date 100 months after employee hiredate.
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 100)
FROM EMP;

---   7. Calculate probation end date (3 months after hiredate) for ANALYST job.
SELECT ENAME, JOB, HIREDATE, ADD_MONTHS(HIREDATE, 3) AS PROBATION_END
FROM EMP
WHERE JOB = 'ANALYST';

---   8. Display employee name and hiredate minus 12 months.
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, -12) AS ONE_YEAR_BEFORE
FROM EMP;

---   9. Display current system date and date after adding 60 months to SYSDATE.
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 60) AS FIVE_YEARS_LATER
FROM DUAL;

---   10. Order all employees by their 1-year anniversary date (ADD_MONTHS(HIREDATE, 12)).
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 12)
FROM EMP
ORDER BY ADD_MONTHS(HIREDATE, 12) ASC;

---EXTRACT()---

---1. Extract the year from employee hiredate.
SELECT ENAME, HIREDATE, EXTRACT(YEAR FROM HIREDATE) AS HIRE_YEAR
FROM EMP;

---   2. Extract the month from employee hiredate.
SELECT ENAME, HIREDATE, EXTRACT(MONTH FROM HIREDATE) AS HIRE_MONTH
FROM EMP;

---3. Extract the day from employee hiredate for employees in department 30.
SELECT ENAME, HIREDATE, EXTRACT(DAY FROM HIREDATE) AS HIRE_DAY
FROM EMP
WHERE DEPTNO = 30;

---   4. Find all employees hired in the year 1981 using EXTRACT.
SELECT ENAME, HIREDATE
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;

---   5. Find all employees hired in the month of December (month 12).
SELECT ENAME, HIREDATE
FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 12;

---   6. Extract year from current system date.
SELECT EXTRACT(YEAR FROM SYSDATE) AS CURRENT_YEAR
FROM DUAL;

---   7. List employees hired on the 1st day of any month.
SELECT ENAME, HIREDATE
FROM EMP
WHERE EXTRACT(DAY FROM HIREDATE) = 1;

---   8. Extract year and month from hiredate for employees earning more than 2500.
SELECT ENAME, SAL, EXTRACT(YEAR FROM HIREDATE), EXTRACT(MONTH FROM HIREDATE)
FROM EMP
WHERE SAL > 2500;

---   9. List employees hired in odd numbered months using EXTRACT and MOD.
SELECT ENAME, HIREDATE
FROM EMP
WHERE MOD(EXTRACT(MONTH FROM HIREDATE), 2) != 0;

---   10. Order all employees by the extracted month of their hiredate.
SELECT ENAME, HIREDATE, EXTRACT(MONTH FROM HIREDATE)
FROM EMP
ORDER BY EXTRACT(MONTH FROM HIREDATE) ASC;

---LAST_DAY()---

---1. Display the last day of the month in which each employee was hired.
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE) AS MONTH_END
FROM EMP;

---   2. Display the last day of the current month.
SELECT LAST_DAY(SYSDATE) AS END_OF_MONTH
FROM DUAL;

---3. Find the number of days remaining in the month when employee was hired.
SELECT ENAME, HIREDATE, (LAST_DAY(HIREDATE) - HIREDATE) AS DAYS_LEFT
FROM EMP;

---   4. List employees who were hired on the last day of the month.
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE = LAST_DAY(HIREDATE);

---   5. Display employee name, hiredate, and last day of previous month.
SELECT ENAME, HIREDATE, LAST_DAY(ADD_MONTHS(HIREDATE, -1)) AS PREV_MONTH_END
FROM EMP;

---   6. Display the last day of February for the year employee was hired.
SELECT ENAME, HIREDATE, LAST_DAY(TO_DATE('01-FEB-' || TO_CHAR(HIREDATE, 'YYYY'), 'DD-MON-YYYY')) AS FEB_END
FROM EMP;

---   7. Display employee name and last day of hiredate month for department 10.
SELECT ENAME, LAST_DAY(HIREDATE)
FROM EMP
WHERE DEPTNO = 10;

---   8. Show the last day of the next month relative to employee hiredate.
SELECT ENAME, HIREDATE, LAST_DAY(ADD_MONTHS(HIREDATE, 1))
FROM EMP;

---   9. Find employees hired within 5 days before the last day of their hire month.
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE)
FROM EMP
WHERE (LAST_DAY(HIREDATE) - HIREDATE) <= 5;

---   10. Order all employees by the last day of their hiredate month.
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE)
FROM EMP
ORDER BY LAST_DAY(HIREDATE) ASC;
