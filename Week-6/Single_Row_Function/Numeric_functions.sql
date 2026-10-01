---MOD()---

---1. Display the employee name, salary, and the remainder when salary is divided by 1000.
SELECT ENAME, SAL, MOD(SAL, 1000)
FROM EMP;

---   2. Find all employees whose employee number is an even number.
SELECT ENAME, EMPNO
FROM EMP
WHERE MOD(EMPNO, 2) = 0;

---3. Display all employees whose salary is not completely divisible by 500.
SELECT ENAME, SAL
FROM EMP
WHERE MOD(SAL, 500) != 0;

---   4. Show the department number and the remainder when department number is divided by 3.
SELECT DEPTNO, MOD(DEPTNO, 3)
FROM DEPT;

---   5. List all employees whose employee number is an odd number.
SELECT ENAME, EMPNO
FROM EMP
WHERE MOD(EMPNO, 2) <> 0;

---   6. Display the remainder when commission is divided by 100 for sales employees.
SELECT ENAME, COMM, MOD(COMM, 100)
FROM EMP
WHERE COMM IS NOT NULL;

---   7. Find employees whose salary divided by 300 leaves a remainder of 0.
SELECT ENAME, SAL
FROM EMP
WHERE MOD(SAL, 300) = 0;

---   8. Display employee name, salary, and remainder after dividing salary by 7.
SELECT ENAME, SAL, MOD(SAL, 7)
FROM EMP;

---   9. List employees in department 20 whose salary is an odd number.
SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO = 20 AND MOD(SAL, 2) != 0;

---   10. Order all employees by the remainder of their salary when divided by 100 in descending order.
SELECT ENAME, SAL, MOD(SAL, 100)
FROM EMP
ORDER BY MOD(SAL, 100) DESC;

---ROUND()---

---1. Display employee name, monthly salary, and daily salary rounded to 2 decimal places.
SELECT ENAME, SAL, ROUND(SAL/30, 2) AS DAILY_SAL
FROM EMP;

---   2. Display the salary of all employees rounded to the nearest thousand.
SELECT ENAME, SAL, ROUND(SAL, -3)
FROM EMP;

---3. Display annual salary divided by 12 rounded to 0 decimal places for department 10.
SELECT ENAME, ROUND(SAL)
FROM EMP
WHERE DEPTNO = 10;

---   4. Find employee commission values rounded to the nearest hundred.
SELECT ENAME, COMM, ROUND(COMM, -2)
FROM EMP
WHERE COMM IS NOT NULL;

---   5. Display average salary of all employees rounded to 2 decimal places.
SELECT ROUND(AVG(SAL), 2) AS AVG_SAL
FROM EMP;

---   6. Show daily salary rounded to 1 decimal place for employees earning more than 2000.
SELECT ENAME, ROUND(SAL/30, 1)
FROM EMP
WHERE SAL > 2000;

---   7. Display the salary divided by 7 rounded to 3 decimal places.
SELECT ENAME, SAL, ROUND(SAL/7, 3)
FROM EMP;

---   8. Display employee salary rounded to the nearest ten.
SELECT ENAME, SAL, ROUND(SAL, -1)
FROM EMP;

---   9. List employees whose salary divided by 3 rounded to 0 decimal places exceeds 1000.
SELECT ENAME, SAL
FROM EMP
WHERE ROUND(SAL/3) > 1000;

---   10. Order all employees by their daily salary rounded to 2 decimal places in ascending order.
SELECT ENAME, SAL, ROUND(SAL/30, 2)
FROM EMP
ORDER BY ROUND(SAL/30, 2) ASC;

---TRUNC()---

---1. Display employee name, monthly salary, and daily salary truncated to 2 decimal places.
SELECT ENAME, SAL, TRUNC(SAL/30, 2) AS DAILY_SAL
FROM EMP;

---   2. Display the salary of all employees truncated to the nearest thousand.
SELECT ENAME, SAL, TRUNC(SAL, -3)
FROM EMP;

---3. Display daily salary truncated without decimal places for department 30.
SELECT ENAME, TRUNC(SAL/30)
FROM EMP
WHERE DEPTNO = 30;

---   4. Show commission values truncated to the nearest hundred.
SELECT ENAME, COMM, TRUNC(COMM, -2)
FROM EMP
WHERE COMM IS NOT NULL;

---   5. Display average salary of all employees truncated to 2 decimal places.
SELECT TRUNC(AVG(SAL), 2) AS AVG_SAL
FROM EMP;

---   6. Show salary divided by 7 truncated to 1 decimal place.
SELECT ENAME, SAL, TRUNC(SAL/7, 1)
FROM EMP;

---   7. Display employee salary truncated to the nearest ten.
SELECT ENAME, SAL, TRUNC(SAL, -1)
FROM EMP;

---   8. Compare rounded and truncated values of daily salary for all employees.
SELECT ENAME, ROUND(SAL/30, 2), TRUNC(SAL/30, 2)
FROM EMP;

---   9. List employees whose truncated daily salary is greater than 50.
SELECT ENAME, SAL
FROM EMP
WHERE TRUNC(SAL/30) > 50;

---   10. Order all employees by their daily salary truncated to 2 decimal places in descending order.
SELECT ENAME, SAL, TRUNC(SAL/30, 2)
FROM EMP
ORDER BY TRUNC(SAL/30, 2) DESC;

---SQRT()---

---1. Display employee name, salary, and the square root of their salary.
SELECT ENAME, SAL, SQRT(SAL)
FROM EMP;

---   2. Display the square root of department numbers from the DEPT table.
SELECT DEPTNO, SQRT(DEPTNO)
FROM DEPT;

---3. Find the square root of employee salary rounded to 2 decimal places.
SELECT ENAME, SAL, ROUND(SQRT(SAL), 2)
FROM EMP;

---   4. Display the square root of commission for employees receiving a commission.
SELECT ENAME, COMM, SQRT(COMM)
FROM EMP
WHERE COMM IS NOT NULL AND COMM > 0;

---   5. List all employees where the square root of salary is greater than 40.
SELECT ENAME, SAL
FROM EMP
WHERE SQRT(SAL) > 40;

---   6. Display employee number and square root of employee number for department 20.
SELECT EMPNO, SQRT(EMPNO)
FROM EMP
WHERE DEPTNO = 20;

---   7. Find the square root of total compensation (salary + commission).
SELECT ENAME, SQRT(SAL + NVL(COMM, 0)) AS SQRT_TOTAL
FROM EMP;

---   8. Display square root of average salary across all employees.
SELECT SQRT(AVG(SAL))
FROM EMP;

---   9. List employees whose square root of salary is between 30 and 50.
SELECT ENAME, SAL
FROM EMP
WHERE SQRT(SAL) BETWEEN 30 AND 50;

---   10. Order all employees by the square root of their salary in descending order.
SELECT ENAME, SAL, SQRT(SAL)
FROM EMP
ORDER BY SQRT(SAL) DESC;

---POWER()---

---1. Display employee name, department number, and department number raised to the power 2.
SELECT ENAME, DEPTNO, POWER(DEPTNO, 2)
FROM EMP;

---   2. Display salary raised to the power 2 for all employees.
SELECT ENAME, SAL, POWER(SAL, 2)
FROM EMP;

---3. Calculate 2 raised to the power of department number for department 10.
SELECT DEPTNO, POWER(2, DEPTNO)
FROM DEPT
WHERE DEPTNO = 10;

---   4. Display employee number and employee number raised to power 3.
SELECT EMPNO, POWER(EMPNO, 3)
FROM EMP;

---   5. Show the value of salary divided by 1000 raised to the power 3.
SELECT ENAME, SAL, POWER(SAL/1000, 3)
FROM EMP;

---   6. Display commission value raised to power 2 for sales employees.
SELECT ENAME, COMM, POWER(COMM, 2)
FROM EMP
WHERE COMM IS NOT NULL;

---   7. Find employees where salary raised to power 0.5 (square root equivalent) is greater than 50.
SELECT ENAME, SAL
FROM EMP
WHERE POWER(SAL, 0.5) > 50;

---   8. Display department number raised to power 3 from DEPT table.
SELECT DNAME, DEPTNO, POWER(DEPTNO, 3)
FROM DEPT;

---   9. Calculate 10 raised to power 2 and display alongside employee details.
SELECT ENAME, SAL, POWER(10, 2)
FROM EMP;

---   10. Order all employees by their salary raised to power 2 in ascending order.
SELECT ENAME, SAL, POWER(SAL, 2)
FROM EMP
ORDER BY POWER(SAL, 2) ASC;

---ABS()---

---1. Display the absolute value of salary for all employees.
SELECT ENAME, ABS(SAL)
FROM EMP;

---   2. Find the absolute difference between salary and 2000 for all employees.
SELECT ENAME, SAL, ABS(SAL - 2000) AS SAL_DIFF
FROM EMP;

---3. Display absolute difference between salary and average salary.
SELECT ENAME, SAL, ABS(SAL - (SELECT AVG(SAL) FROM EMP)) AS ABS_DIFF
FROM EMP;

---   4. Display absolute value of negative numbers passed as salary deductions.
SELECT ENAME, SAL, ABS(-500) AS DEDUCTION
FROM EMP;

---   5. Show absolute difference between salary and commission.
SELECT ENAME, SAL, COMM, ABS(SAL - NVL(COMM, 0)) AS DIFF
FROM EMP;

---   6. List employees whose absolute difference from target salary 3000 is less than 1000.
SELECT ENAME, SAL
FROM EMP
WHERE ABS(SAL - 3000) < 1000;

---   7. Display employee number and absolute value of employee number subtracted from 8000.
SELECT EMPNO, ABS(EMPNO - 8000)
FROM EMP;

---   8. Show absolute difference between max salary and employee salary.
SELECT ENAME, SAL, ABS(SAL - (SELECT MAX(SAL) FROM EMP)) AS MAX_DIFF
FROM EMP;

---   9. Display absolute value of commission minus 500 for employees in department 30.
SELECT ENAME, COMM, ABS(COMM - 500)
FROM EMP
WHERE DEPTNO = 30 AND COMM IS NOT NULL;

---   10. Order all employees by absolute difference of their salary from 2500 in ascending order.
SELECT ENAME, SAL, ABS(SAL - 2500)
FROM EMP
ORDER BY ABS(SAL - 2500) ASC;
