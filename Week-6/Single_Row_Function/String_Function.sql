 ---LENGTH()---

---1. Display the names of all employees and the number of characters in their names.
 SELECT ENAME, LENGTH(ENAME)
 FROM EMP;

 ---   2. Find the total number of characters in the job title for 'SMITH'.
 SELECT JOB , LENGTH(JOB)
 FROM EMP 
 WHERE ENAME = 'SMITH';

 ---3. List all employees whose names are exactly 4 characters long.
 SELECT * 
 FROM EMP 
 WHERE LENGTH(ENAME)=4;

 ---   4. Display employee names and the length of their names, but only for employees working in department 20.
 SELECT ENAME , LENGTH(ENAME)
 FROM EMP 
 WHERE DEPTNO = 20;

 ---   5. Find the employee with the longest name in the table.
 SELECT ENAME, LENGTH(ENAME)
 FROM EMP 
 WHERE LENGTH(ENAME) =ALL(SELECT MAX(LENGTH(ENAME)) FROM EMP);

 ---   6. List all employees whose job title length is greater than the length of their name.
 SELECT ENAME,JOB,LENGTH(JOB)
 FROM EMP
 WHERE LENGTH(JOB)>LENGTH(ENAME);

 ---   7. Display the name and job title of employees where the combined length of their name and job is less than 10 characters.
 SELECT ENAME,JOB 
  FROM EMP 
  WHERE (LENGTH(JOB)+LENGTH(ENAME)<10);

 ---   8. Show the names of employees whose names have an even number of characters.
 SELECT ENAME , LENGTH(ENAME)
 FROM EMP
 WHERE MOD(LENGTH(ENAME),2)=0;

 ---   9. Display the employee name, their salary, and the length of their salary (converted to character strings).
 SELECT ENAME, SAL, LENGTH(TO_CHAR(SAL)) AS SAL
 FROM EMP;

 ---   10. Order all employees by the length of their names in descending order.
 SELECT ENAME, LENGTH(ENAME)
 FROM EMP 
 ORDER BY LENGTH(ENAME) DESC;
