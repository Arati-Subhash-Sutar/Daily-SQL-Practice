---TO_CHAR()---

---1. Display the hiredate of all employees formatted as 'DD-MON-YYYY'.
SELECT ENAME, TO_CHAR(HIREDATE, 'DD-MON-YYYY') AS FORMATTED_DATE
FROM EMP;

---   2. Display employee salary formatted with a dollar sign and comma separator.
SELECT ENAME, TO_CHAR(SAL, '$99,999.00') AS FORMATTED_SAL
FROM EMP;

---3. Display the day of the week on which each employee was hired.
SELECT ENAME, TO_CHAR(HIREDATE, 'DAY') AS HIRE_DAY
FROM EMP;

---   4. Display the full month name of employee hiredate.
SELECT ENAME, TO_CHAR(HIREDATE, 'MONTH') AS HIRE_MONTH
FROM EMP;

---   5. Display employee name, salary, and commission formatted as currency for department 30.
SELECT ENAME, TO_CHAR(SAL, '$99,990.00'), TO_CHAR(COMM, '$99,990.00')
FROM EMP
WHERE DEPTNO = 30;

---   6. Display hiredate formatted in 'YYYY/MM/DD' format for all employees.
SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY/MM/DD') AS DATE_FORMAT
FROM EMP;

---   7. Find all employees who were hired in the year '1981' using TO_CHAR.
SELECT ENAME, HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE, 'YYYY') = '1981';

---   8. Display the current system time formatted as 'HH24:MI:SS'.
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS CURRENT_TIME
FROM DUAL;

---   9. Display employee number formatted with leading zeros to make it 6 digits long.
SELECT ENAME, TO_CHAR(EMPNO, '000000') AS FMT_EMPNO
FROM EMP;

---   10. Order all employees by the month name of their hiredate using TO_CHAR.
SELECT ENAME, HIREDATE, TO_CHAR(HIREDATE, 'Month')
FROM EMP
ORDER BY TO_CHAR(HIREDATE, 'MM') ASC;

---TO_DATE()---

---1. Display all employees who were hired on '17-DEC-1980' using TO_DATE.
SELECT *
FROM EMP
WHERE HIREDATE = TO_DATE('17-DEC-1980', 'DD-MON-YYYY');

---   2. Find employees hired between '01-JAN-1981' and '31-DEC-1981'.
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN TO_DATE('01-JAN-1981', 'DD-MON-YYYY') AND TO_DATE('31-DEC-1981', 'DD-MON-YYYY');

---3. Display the number of days between '01-JAN-2024' and current date.
SELECT ROUND(SYSDATE - TO_DATE('01-JAN-2024', 'DD-MON-YYYY')) AS DAYS_DIFF
FROM DUAL;

---   4. Find employees hired after '01-JUN-1982' using TO_DATE.
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE > TO_DATE('1982/06/01', 'YYYY/MM/DD');

---   5. Convert string '2023-10-15' to a date and display the day of the week.
SELECT TO_CHAR(TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'DAY') AS DAY_NAME
FROM DUAL;

---   6. Display details of employees hired specifically in February 1981 using TO_DATE.
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE >= TO_DATE('01-02-1981', 'DD-MM-YYYY')
AND HIREDATE <= TO_DATE('28-02-1981', 'DD-MM-YYYY');

---   7. Calculate difference in months between '15-AUG-1947' and current date.
SELECT ROUND(MONTHS_BETWEEN(SYSDATE, TO_DATE('15-08-1947', 'DD-MM-YYYY'))) AS MONTHS_SINCE
FROM DUAL;

---   8. Convert string '25122020' to date format and display full month.
SELECT TO_CHAR(TO_DATE('25122020', 'DDMMYYYY'), 'Month DD, YYYY') AS XMAS
FROM DUAL;

---   9. Select employees hired before '1981-05-01' using TO_DATE format.
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE < TO_DATE('1981-05-01', 'YYYY-MM-DD');

---   10. Order all employees by distance from target date '01-JAN-1980'.
SELECT ENAME, HIREDATE, ABS(HIREDATE - TO_DATE('01-JAN-1980', 'DD-MON-YYYY')) AS DISTANCE
FROM EMP
ORDER BY ABS(HIREDATE - TO_DATE('01-JAN-1980', 'DD-MON-YYYY')) ASC;

---TO_NUMBER()---

---1. Convert string '$1,250.00' to a number and add 500 to it.
SELECT TO_NUMBER('$1,250.00', '$9,999.00') + 500 AS CALCULATED_VAL
FROM DUAL;

---   2. Display employees whose salary string converted to number is greater than 2000.
SELECT ENAME, SAL
FROM EMP
WHERE TO_NUMBER(TO_CHAR(SAL)) > 2000;

---3. Convert character string '500' to number and calculate total remuneration with salary.
SELECT ENAME, SAL + TO_NUMBER('500') AS NEW_SAL
FROM EMP;

---   4. Convert string '123.45' to number and round it to 1 decimal place.
SELECT ROUND(TO_NUMBER('123.45'), 1) AS ROUNDED_NUM
FROM DUAL;

---   5. Convert string representation of department number '20' to number and filter employees.
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = TO_NUMBER('20');

---   6. Subtract string '100' converted to number from employee commission.
SELECT ENAME, COMM, COMM - TO_NUMBER('100') AS REDUCED_COMM
FROM EMP
WHERE COMM IS NOT NULL;

---   7. Convert string with thousand separator '5,000' to number and compare with salary.
SELECT ENAME, SAL
FROM EMP
WHERE SAL < TO_NUMBER('5,000', '9,999');

---   8. Multiply string '12' converted to number with salary to display annual salary.
SELECT ENAME, SAL * TO_NUMBER('12') AS ANNUAL_SAL
FROM EMP;

---   9. Convert formatted string '1200.50' to number and find its square root.
SELECT SQRT(TO_NUMBER('1200.50')) AS SQRT_VAL
FROM DUAL;

---   10. Order all employees by employee number after explicitly converting string representation to number.
SELECT ENAME, EMPNO
FROM EMP
ORDER BY TO_NUMBER(TO_CHAR(EMPNO)) DESC;
