---RANK()---

---1. Rank all employees based on their salary in descending order.
SELECT ENAME, SAL, RANK() OVER (ORDER BY SAL DESC) AS SAL_RANK
FROM EMP;

---   2. Rank employees within each department based on their salary.
SELECT ENAME, DEPTNO, SAL, RANK() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS DEPT_SAL_RANK
FROM EMP;

---3. Find all employees who hold the highest salary rank in their respective departments.
SELECT * FROM (
SELECT ENAME, DEPTNO, SAL, RANK() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS RK
FROM EMP
) WHERE RK = 1;

---   4. Rank employees by their hire date to determine seniority.
SELECT ENAME, HIREDATE, RANK() OVER (ORDER BY HIREDATE ASC) AS SENIORITY_RANK
FROM EMP;

---   5. Display employee name, commission, and rank based on commission amount.
SELECT ENAME, COMM, RANK() OVER (ORDER BY COMM DESC NULLS LAST) AS COMM_RANK
FROM EMP;

---   6. Rank employees within each job title based on their experience (hire date).
SELECT ENAME, JOB, HIREDATE, RANK() OVER (PARTITION BY JOB ORDER BY HIREDATE ASC) AS JOB_RANK
FROM EMP;

---   7. Rank departments by their total salary expenditure.
SELECT DEPTNO, SUM(SAL) AS TOTAL_SAL, RANK() OVER (ORDER BY SUM(SAL) DESC) AS DEPT_RANK
FROM EMP
GROUP BY DEPTNO;

---   8. Rank employees based on total compensation (salary plus commission).
SELECT ENAME, SAL, COMM, RANK() OVER (ORDER BY (SAL + NVL(COMM,0)) DESC) AS TOTAL_COMP_RANK
FROM EMP;

---   9. Find employees with the top 3 salary ranks across the company.
SELECT * FROM (
SELECT ENAME, SAL, RANK() OVER (ORDER BY SAL DESC) AS RK
FROM EMP
) WHERE RK <= 3;

---   10. Order all employees by department number and their salary rank within that department.
SELECT ENAME, DEPTNO, SAL, RANK() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS RK
FROM EMP
ORDER BY DEPTNO, RK;

---DENSE_RANK()---

---1. Assign a dense rank to employees based on salary without skipping numbers for ties.
SELECT ENAME, SAL, DENSE_RANK() OVER (ORDER BY SAL DESC) AS DENSE_SAL_RANK
FROM EMP;

---   2. Calculate dense rank for employee salaries within each department.
SELECT ENAME, DEPTNO, SAL, DENSE_RANK() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS DEPT_DENSE_RANK
FROM EMP;

---3. Find employees who have the 2nd highest salary in the company using DENSE_RANK.
SELECT * FROM (
SELECT ENAME, SAL, DENSE_RANK() OVER (ORDER BY SAL DESC) AS DRK
FROM EMP
) WHERE DRK = 2;

---   4. Display the top 3 distinct salary levels in department 20 using DENSE_RANK.
SELECT * FROM (
SELECT ENAME, SAL, DEPTNO, DENSE_RANK() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS DRK
FROM EMP
WHERE DEPTNO = 20
) WHERE DRK <= 3;

---   5. Dense rank employees by hire date within each department.
SELECT ENAME, DEPTNO, HIREDATE, DENSE_RANK() OVER (PARTITION BY DEPTNO ORDER BY HIREDATE ASC) AS HIRE_RANK
FROM EMP;

---   6. Display employee details along with dense rank based on commission.
SELECT ENAME, COMM, DENSE_RANK() OVER (ORDER BY COMM DESC NULLS LAST) AS COMM_DENSE_RANK
FROM EMP;

---   7. Find employees with the 3rd lowest salary across all departments.
SELECT * FROM (
SELECT ENAME, SAL, DENSE_RANK() OVER (ORDER BY SAL ASC) AS DRK
FROM EMP
) WHERE DRK = 3;

---   8. Compare RANK() and DENSE_RANK() for employee salaries side by side.
SELECT ENAME, SAL,
RANK() OVER (ORDER BY SAL DESC) AS RK,
DENSE_RANK() OVER (ORDER BY SAL DESC) AS DRK
FROM EMP;

---   9. Assign dense rank to job roles based on average salary per job.
SELECT JOB, AVG(SAL) AS AVG_SAL, DENSE_RANK() OVER (ORDER BY AVG(SAL) DESC) AS JOB_RANK
FROM EMP
GROUP BY JOB;

---   10. Order all employees by department and dense rank of hiredate.
SELECT ENAME, DEPTNO, HIREDATE, DENSE_RANK() OVER (PARTITION BY DEPTNO ORDER BY HIREDATE ASC) AS DRK
FROM EMP
ORDER BY DEPTNO, DRK;

---ROW_NUMBER()---

---1. Assign a unique sequential row number to every employee ordered by salary.
SELECT ENAME, SAL, ROW_NUMBER() OVER (ORDER BY SAL DESC) AS ROW_NUM
FROM EMP;

---   2. Assign row numbers to employees within each department ordered by hire date.
SELECT ENAME, DEPTNO, HIREDATE, ROW_NUMBER() OVER (PARTITION BY DEPTNO ORDER BY HIREDATE ASC) AS DEPT_ROW_NUM
FROM EMP;

---3. Fetch the earliest hired employee in each department using ROW_NUMBER.
SELECT * FROM (
SELECT ENAME, DEPTNO, HIREDATE, ROW_NUMBER() OVER (PARTITION BY DEPTNO ORDER BY HIREDATE ASC) AS RN
FROM EMP
) WHERE RN = 1;

---   4. Fetch the highest paid employee in each job category using ROW_NUMBER.
SELECT * FROM (
SELECT ENAME, JOB, SAL, ROW_NUMBER() OVER (PARTITION BY JOB ORDER BY SAL DESC) AS RN
FROM EMP
) WHERE RN = 1;

---   5. Paginate employee records to retrieve rows 6 through 10 ordered by employee number.
SELECT * FROM (
SELECT ENAME, EMPNO, ROW_NUMBER() OVER (ORDER BY EMPNO ASC) AS RN
FROM EMP
) WHERE RN BETWEEN 6 AND 10;

---   6. Assign sequential numbers to employees ordered alphabetically by name.
SELECT ENAME, ROW_NUMBER() OVER (ORDER BY ENAME ASC) AS SEQ_NO
FROM EMP;

---   7. Assign row numbers to employees in department 30 ordered by salary.
SELECT ENAME, SAL, ROW_NUMBER() OVER (ORDER BY SAL DESC) AS RN
FROM EMP
WHERE DEPTNO = 30;

---   8. Display employee name, salary, and row number within job groups ordered by salary.
SELECT ENAME, JOB, SAL, ROW_NUMBER() OVER (PARTITION BY JOB ORDER BY SAL DESC) AS RN
FROM EMP;

---   9. Compare ROW_NUMBER(), RANK(), and DENSE_RANK() for employee salaries.
SELECT ENAME, SAL,
ROW_NUMBER() OVER (ORDER BY SAL DESC) AS RN,
RANK() OVER (ORDER BY SAL DESC) AS RK,
DENSE_RANK() OVER (ORDER BY SAL DESC) AS DRK
FROM EMP;

---   10. Order all employees by department and row number.
SELECT ENAME, DEPTNO, SAL, ROW_NUMBER() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS RN
FROM EMP
ORDER BY DEPTNO, RN;

---LEAD()---

---1. Display each employee's salary along with the salary of the next higher paid employee.
SELECT ENAME, SAL, LEAD(SAL, 1) OVER (ORDER BY SAL ASC) AS NEXT_SAL
FROM EMP;

---   2. Display employee name, hire date, and the hire date of the next hired employee.
SELECT ENAME, HIREDATE, LEAD(HIREDATE, 1) OVER (ORDER BY HIREDATE ASC) AS NEXT_HIRED
FROM EMP;

---3. Find the difference between current employee salary and the next employee salary.
SELECT ENAME, SAL,
LEAD(SAL, 1) OVER (ORDER BY SAL DESC) AS NEXT_SAL,
SAL - LEAD(SAL, 1) OVER (ORDER BY SAL DESC) AS SAL_DIFF
FROM EMP;

---   4. Display next employee salary within the same department ordered by salary.
SELECT ENAME, DEPTNO, SAL, LEAD(SAL, 1) OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS NEXT_DEPT_SAL
FROM EMP;

---   5. Display employee salary alongside the salary 2 rows ahead in salary order.
SELECT ENAME, SAL, LEAD(SAL, 2) OVER (ORDER BY SAL DESC) AS SAL_2_AHEAD
FROM EMP;

---   6. Supply a default value of 0 when LEAD reaches the last record.
SELECT ENAME, SAL, LEAD(SAL, 1, 0) OVER (ORDER BY SAL DESC) AS NEXT_SAL
FROM EMP;

---   7. Display employee name, job, and next employee's job ordered by hiredate.
SELECT ENAME, JOB, LEAD(JOB, 1) OVER (ORDER BY HIREDATE ASC) AS NEXT_JOB
FROM EMP;

---   8. Find next hire date within each job role.
SELECT ENAME, JOB, HIREDATE, LEAD(HIREDATE, 1) OVER (PARTITION BY JOB ORDER BY HIREDATE ASC) AS NEXT_JOB_HIRE
FROM EMP;

---   9. Display employee name and next employee name in department 10 ordered by name.
SELECT ENAME, LEAD(ENAME, 1) OVER (ORDER BY ENAME ASC) AS NEXT_EMP
FROM EMP
WHERE DEPTNO = 10;

---   10. Order all employees by hire date and display next employee details.
SELECT ENAME, HIREDATE, LEAD(ENAME, 1) OVER (ORDER BY HIREDATE ASC) AS NEXT_JOINER
FROM EMP
ORDER BY HIREDATE ASC;

---LAG()---

---1. Display each employee's salary along with the salary of the previously listed employee.
SELECT ENAME, SAL, LAG(SAL, 1) OVER (ORDER BY SAL DESC) AS PREV_SAL
FROM EMP;

---   2. Display employee name, hire date, and the hire date of the previous employee.
SELECT ENAME, HIREDATE, LAG(HIREDATE, 1) OVER (ORDER BY HIREDATE ASC) AS PREV_HIRED
FROM EMP;

---3. Calculate salary difference between current employee and previously hired employee.
SELECT ENAME, SAL, HIREDATE,
LAG(SAL, 1) OVER (ORDER BY HIREDATE ASC) AS PREV_SAL,
SAL - LAG(SAL, 1) OVER (ORDER BY HIREDATE ASC) AS SAL_DIFF
FROM EMP;

---   4. Display previous employee salary within each department ordered by salary.
SELECT ENAME, DEPTNO, SAL, LAG(SAL, 1) OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS PREV_DEPT_SAL
FROM EMP;

---   5. Display employee salary alongside the salary 2 rows behind in salary order.
SELECT ENAME, SAL, LAG(SAL, 2) OVER (ORDER BY SAL DESC) AS SAL_2_BEHIND
FROM EMP;

---   6. Supply a default value of 0 when LAG reaches the first record.
SELECT ENAME, SAL, LAG(SAL, 1, 0) OVER (ORDER BY SAL DESC) AS PREV_SAL
FROM EMP;

---   7. Display employee name, job, and previous employee's job ordered by hiredate.
SELECT ENAME, JOB, LAG(JOB, 1) OVER (ORDER BY HIREDATE ASC) AS PREV_JOB
FROM EMP;

---   8. Find previous hire date within each job role.
SELECT ENAME, JOB, HIREDATE, LAG(HIREDATE, 1) OVER (PARTITION BY JOB ORDER BY HIREDATE ASC) AS PREV_JOB_HIRE
FROM EMP;

---   9. Display employee name and previous employee name in department 20 ordered by salary.
SELECT ENAME, SAL, LAG(ENAME, 1) OVER (ORDER BY SAL DESC) AS PREV_EMP
FROM EMP
WHERE DEPTNO = 20;

---   10. Order all employees by salary and display previous employee details.
SELECT ENAME, SAL, LAG(ENAME, 1) OVER (ORDER BY SAL ASC) AS PREV_LOWER_EMP
FROM EMP
ORDER BY SAL ASC;

---FIRST_VALUE() / LAST_VALUE()---

---1. Display each employee alongside the lowest salary in the company using FIRST_VALUE.
SELECT ENAME, SAL, FIRST_VALUE(SAL) OVER (ORDER BY SAL ASC) AS MIN_SAL
FROM EMP;

---   2. Display each employee alongside the highest salary in their department using FIRST_VALUE.
SELECT ENAME, DEPTNO, SAL,
FIRST_VALUE(SAL) OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS HIGHEST_DEPT_SAL
FROM EMP;

---3. Display the first hired employee in the entire company alongside every employee.
SELECT ENAME, HIREDATE,
FIRST_VALUE(ENAME) OVER (ORDER BY HIREDATE ASC) AS FIRST_JOINER
FROM EMP;

---   4. Display highest salary in department using LAST_VALUE with full window frame scope.
SELECT ENAME, DEPTNO, SAL,
LAST_VALUE(SAL) OVER (
PARTITION BY DEPTNO ORDER BY SAL ASC
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS MAX_DEPT_SAL
FROM EMP;

---   5. Display the latest hired employee name within each department using FIRST_VALUE.
SELECT ENAME, DEPTNO, HIREDATE,
FIRST_VALUE(ENAME) OVER (PARTITION BY DEPTNO ORDER BY HIREDATE DESC) AS LATEST_JOINER
FROM EMP;

---   6. Calculate difference between employee salary and highest salary in company using FIRST_VALUE.
SELECT ENAME, SAL,
FIRST_VALUE(SAL) OVER (ORDER BY SAL DESC) - SAL AS DIFF_FROM_TOP
FROM EMP;

---   7. Display the first value of job title within department ordered by hiredate.
SELECT ENAME, DEPTNO, JOB,
FIRST_VALUE(JOB) OVER (PARTITION BY DEPTNO ORDER BY HIREDATE ASC) AS INITIAL_DEPT_JOB
FROM EMP;

---   8. Find the lowest salary in each job category using LAST_VALUE with frame specification.
SELECT ENAME, JOB, SAL,
LAST_VALUE(SAL) OVER (
PARTITION BY JOB ORDER BY SAL DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS LOWEST_JOB_SAL
FROM EMP;

---   9. Display employee name and first employee name in department 30 ordered by salary.
SELECT ENAME, SAL,
FIRST_VALUE(ENAME) OVER (ORDER BY SAL DESC) AS TOP_EARNER
FROM EMP
WHERE DEPTNO = 30;

---   10. Order all employees by department and show the department's top earner.
SELECT ENAME, DEPTNO, SAL,
FIRST_VALUE(ENAME) OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS TOP_DEPT_EARNER
FROM EMP
ORDER BY DEPTNO, SAL DESC;
