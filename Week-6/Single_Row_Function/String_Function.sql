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

  ---UPPER()---

---1. Display the names of all employees in uppercase letters.
SELECT UPPER(ENAME)
FROM EMP;

---   2. Find the details of the employee named 'SMITH' regardless of case.
SELECT *
FROM EMP
WHERE UPPER(ENAME) = 'SMITH';

---3. Display employee names and their job titles in uppercase.
SELECT UPPER(ENAME), UPPER(JOB)
FROM EMP;

---   4. Convert the job title 'clerk' to uppercase and display it for all employees.
SELECT ENAME, UPPER(JOB)
FROM EMP
WHERE UPPER(JOB) = 'CLERK';

---   5. List all employees whose job title in uppercase starts with 'A'.
SELECT ENAME, JOB
FROM EMP
WHERE UPPER(JOB) LIKE 'A%';

---   6. Display the department names in uppercase for department 10.
SELECT UPPER(DNAME)
FROM DEPT
WHERE DEPTNO = 10;

---   7. Show employee names with their location in uppercase letters.
SELECT E.ENAME, UPPER(D.LOC)
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

---   8. Display the names of employees whose uppercase job title is 'MANAGER'.
SELECT ENAME, SAL
FROM EMP
WHERE UPPER(JOB) = 'MANAGER';

---   9. Display employee names and compare lowercase name with uppercase name.
SELECT LOWER(ENAME), UPPER(ENAME)
FROM EMP;

---   10. Order all employees by their uppercase names in ascending order.
SELECT ENAME, SAL
FROM EMP
ORDER BY UPPER(ENAME) ASC;

---LOWER()---

---1. Display the names of all employees in lowercase letters.
SELECT LOWER(ENAME)
FROM EMP;

---   2. Find all details of the employee where name in lowercase is 'king'.
SELECT *
FROM EMP
WHERE LOWER(ENAME) = 'king';

---3. Display employee names in lowercase and their job titles in uppercase.
SELECT LOWER(ENAME), UPPER(JOB)
FROM EMP;

---   4. Display the job titles in lowercase for employees in department 30.
SELECT LOWER(JOB)
FROM EMP
WHERE DEPTNO = 30;

---   5. List all employees whose job title in lowercase ends with 'man'.
SELECT ENAME, JOB
FROM EMP
WHERE LOWER(JOB) LIKE '%man';

---   6. Display department name and location in lowercase from DEPT table.
SELECT LOWER(DNAME), LOWER(LOC)
FROM DEPT;

---   7. Find employees whose lowercase name contains the letter 'a'.
SELECT ENAME
FROM EMP
WHERE LOWER(ENAME) LIKE '%a%';

---   8. Display the employee name and job in lowercase where salary is greater than 2000.
SELECT LOWER(ENAME), LOWER(JOB)
FROM EMP
WHERE SAL > 2000;

---   9. Show the lowercase employee names along with their department numbers.
SELECT LOWER(ENAME), DEPTNO
FROM EMP;

---   10. Order all employees by their lowercase job titles in descending order.
SELECT ENAME, JOB
FROM EMP
ORDER BY LOWER(JOB) DESC;

---INITCAP()---

---1. Display the names of all employees with only the first letter capitalized.
SELECT INITCAP(ENAME)
FROM EMP;

---   2. Display employee names and job titles formatted in title case.
SELECT INITCAP(ENAME), INITCAP(JOB)
FROM EMP;

---3. Find the employee details where the title case name is 'Martin'.
SELECT *
FROM EMP
WHERE INITCAP(ENAME) = 'Martin';

---   4. Display department names and locations with initial letters capitalized.
SELECT INITCAP(DNAME), INITCAP(LOC)
FROM DEPT;

---   5. List all employees in department 20 with their names in title case.
SELECT INITCAP(ENAME), SAL
FROM EMP
WHERE DEPTNO = 20;

---   6. Display the job titles in initial capitalization for employees earning more than 1500.
SELECT ENAME, INITCAP(JOB)
FROM EMP
WHERE SAL > 1500;

---   7. Display combined employee name and job in title case.
SELECT INITCAP(ENAME || ' ' || JOB) AS EMP_DETAILS
FROM EMP;

---   8. List names in title case for employees whose job title is 'SALESMAN'.
SELECT INITCAP(ENAME)
FROM EMP
WHERE JOB = 'SALESMAN';

---   9. Display original employee names alongside their title case versions.
SELECT ENAME, INITCAP(ENAME)
FROM EMP;

---   10. Order all employees by their title-case job title in ascending order.
SELECT ENAME, INITCAP(JOB)
FROM EMP
ORDER BY INITCAP(JOB) ASC;

---REVERSE()---

---1. Display the names of all employees reversed.
SELECT ENAME, REVERSE(ENAME)
FROM EMP;

---   2. Display job titles in reversed order for all employees.
SELECT JOB, REVERSE(JOB)
FROM EMP;

---3. Find employees whose reversed name starts with 'H'.
SELECT ENAME
FROM EMP
WHERE REVERSE(ENAME) LIKE 'H%';

---   4. Display employee names where the reversed name is identical to the original name.
SELECT ENAME
FROM EMP
WHERE ENAME = REVERSE(ENAME);

---   5. Display reversed names for employees in department 10.
SELECT ENAME, REVERSE(ENAME)
FROM EMP
WHERE DEPTNO = 10;

---   6. List employees whose reversed job title ends with 'R'.
SELECT ENAME, JOB
FROM EMP
WHERE REVERSE(JOB) LIKE '%R';

---   7. Display employee names, job titles, and reversed job titles.
SELECT ENAME, JOB, REVERSE(JOB)
FROM EMP;

---   8. Show reversed department names from the DEPT table.
SELECT DNAME, REVERSE(DNAME)
FROM DEPT;

---   9. Display employee names and the length of their reversed names.
SELECT ENAME, LENGTH(REVERSE(ENAME))
FROM EMP;

---   10. Order all employees by their reversed names in descending order.
SELECT ENAME, REVERSE(ENAME)
FROM EMP
ORDER BY REVERSE(ENAME) DESC;

---SUBSTR()---

---1. Display the first 3 characters of all employee names.
SELECT ENAME, SUBSTR(ENAME, 1, 3)
FROM EMP;

---   2. Display the last 2 characters of all employee names.
SELECT ENAME, SUBSTR(ENAME, -2)
FROM EMP;

---3. List all employees whose names start with the letter 'S' using SUBSTR.
SELECT ENAME
FROM EMP
WHERE SUBSTR(ENAME, 1, 1) = 'S';

---   4. Display the first character of job titles for employees in department 20.
SELECT ENAME, SUBSTR(JOB, 1, 1)
FROM EMP
WHERE DEPTNO = 20;

---   5. Find employees whose second character in their name is 'A'.
SELECT ENAME
FROM EMP
WHERE SUBSTR(ENAME, 2, 1) = 'A';

---   6. Display employee names starting from the 3rd character onwards.
SELECT ENAME, SUBSTR(ENAME, 3)
FROM EMP;

---   7. Display the middle 2 characters of employee names having 4 letters.
SELECT ENAME, SUBSTR(ENAME, 2, 2)
FROM EMP
WHERE LENGTH(ENAME) = 4;

---   8. Show the first 4 characters of department names in DEPT table.
SELECT DNAME, SUBSTR(DNAME, 1, 4)
FROM DEPT;

---   9. Display employee name, job title, and the first 3 letters of their job.
SELECT ENAME, JOB, SUBSTR(JOB, 1, 3)
FROM EMP;

---   10. Order all employees by the first 2 characters of their names.
SELECT ENAME
FROM EMP
ORDER BY SUBSTR(ENAME, 1, 2) ASC;

---INSTR()---

---1. Find the position of character 'A' in all employee names.
SELECT ENAME, INSTR(ENAME, 'A')
FROM EMP;

---   2. Display employees whose names contain the character 'L'.
SELECT ENAME, INSTR(ENAME, 'L')
FROM EMP
WHERE INSTR(ENAME, 'L') > 0;

---3. Find the position of the character 'E' starting search from the 2nd position in employee names.
SELECT ENAME, INSTR(ENAME, 'E', 2)
FROM EMP;

---   4. Display employees where character 'I' appears as the second letter in their name.
SELECT ENAME
FROM EMP
WHERE INSTR(ENAME, 'I') = 2;

---   5. Find the position of 'MANAGER' substring in job titles.
SELECT JOB, INSTR(JOB, 'MANAGER')
FROM EMP;

---   6. Show employees whose names do not contain the letter 'A'.
SELECT ENAME
FROM EMP
WHERE INSTR(ENAME, 'A') = 0;

---   7. Find the position of the first occurrence of 'T' in department locations.
SELECT LOC, INSTR(LOC, 'T')
FROM DEPT;

---   8. Display the employee name and the position of 'S' in their job title.
SELECT ENAME, JOB, INSTR(JOB, 'S')
FROM EMP;

---   9. List employees whose names have 'R' in any position after the first character.
SELECT ENAME
FROM EMP
WHERE INSTR(ENAME, 'R', 2) > 0;

---   10. Order all employees by the position of letter 'A' in their names.
SELECT ENAME, INSTR(ENAME, 'A')
FROM EMP
ORDER BY INSTR(ENAME, 'A') DESC;

---CONCAT()---

---1. Concatenate employee name and job title with a space in between.
SELECT CONCAT(CONCAT(ENAME, ' '), JOB) AS EMP_JOB
FROM EMP;

---   2. Display employee name concatenated with their salary.
SELECT CONCAT(ENAME, TO_CHAR(SAL)) AS NAME_SAL
FROM EMP;

---3. Display employee name concatenated with department number for department 10.
SELECT CONCAT(ENAME, TO_CHAR(DEPTNO))
FROM EMP
WHERE DEPTNO = 10;

---   4. Concatenate department name and location from DEPT table.
SELECT CONCAT(CONCAT(DNAME, ' - '), LOC) AS DEPT_INFO
FROM DEPT;

---   5. Display 'Employee: ' prefix concatenated with employee name.
SELECT CONCAT('Employee: ', ENAME) AS EMP_NAME
FROM EMP;

---   6. Concatenate job title and commission for employees receiving commission.
SELECT ENAME, CONCAT(JOB, TO_CHAR(COMM))
FROM EMP
WHERE COMM IS NOT NULL;

---   7. Display concatenated string of employee name and hiredate.
SELECT CONCAT(ENAME, TO_CHAR(HIREDATE))
FROM EMP;

---   8. Concatenate employee name with string ' belongs to dept ' and department number.
SELECT CONCAT(CONCAT(ENAME, ' belongs to dept '), TO_CHAR(DEPTNO))
FROM EMP;

---   9. Display concatenated employee name and length of name.
SELECT CONCAT(ENAME, TO_CHAR(LENGTH(ENAME)))
FROM EMP;

---   10. Order all employees by the concatenated string of job and name.
SELECT ENAME, JOB
FROM EMP
ORDER BY CONCAT(JOB, ENAME) ASC;

---REPLACE()---

---1. Replace letter 'A' with 'X' in all employee names.
SELECT ENAME, REPLACE(ENAME, 'A', 'X')
FROM EMP;

---   2. Replace 'MANAGER' job title with 'LEAD' in the EMP table output.
SELECT ENAME, JOB, REPLACE(JOB, 'MANAGER', 'LEAD')
FROM EMP;

---3. Replace space character with underscore in department names.
SELECT DNAME, REPLACE(DNAME, ' ', '_')
FROM DEPT;

---   4. Display employee names with character 'S' removed.
SELECT ENAME, REPLACE(ENAME, 'S', '')
FROM EMP;

---   5. Replace 'SALESMAN' with 'SALES EXEC' for employees in department 30.
SELECT ENAME, REPLACE(JOB, 'SALESMAN', 'SALES EXEC')
FROM EMP
WHERE DEPTNO = 30;

---   6. Replace digit '0' with '9' in salary values converted to character string.
SELECT SAL, REPLACE(TO_CHAR(SAL), '0', '9')
FROM EMP;

---   7. Replace 'NEW YORK' location with 'NY' in DEPT table.
SELECT LOC, REPLACE(LOC, 'NEW YORK', 'NY')
FROM DEPT;

---   8. Replace first two characters 'CL' with 'AB' in job title 'CLERK'.
SELECT JOB, REPLACE(JOB, 'CL', 'AB')
FROM EMP
WHERE JOB = 'CLERK';

---   9. Display employee name after replacing 'E' with '3' and 'I' with '1'.
SELECT ENAME, REPLACE(REPLACE(ENAME, 'E', '3'), 'I', '1')
FROM EMP;

---   10. Order all employees by replaced names where 'A' is substituted with 'Z'.
SELECT ENAME, REPLACE(ENAME, 'A', 'Z')
FROM EMP
ORDER BY REPLACE(ENAME, 'A', 'Z') ASC;

---LTRIM()---

---1. Trim leading spaces from employee names if present.
SELECT ENAME, LTRIM(ENAME)
FROM EMP;

---   2. Remove leading character 'S' from employee names.
SELECT ENAME, LTRIM(ENAME, 'S')
FROM EMP;

---3. Trim leading letters 'A' or 'B' from employee names.
SELECT ENAME, LTRIM(ENAME, 'AB')
FROM EMP;

---   4. Remove leading zeros from string representation of department numbers.
SELECT LTRIM(TO_CHAR(DEPTNO, '099'), ' 0')
FROM EMP;

---   5. Trim leading 'C' from job titles.
SELECT JOB, LTRIM(JOB, 'C')
FROM EMP;

---   6. Remove leading 'A' from job titles for employees in department 20.
SELECT JOB, LTRIM(JOB, 'A')
FROM EMP
WHERE DEPTNO = 20;

---   7. Trim leading character 'M' from employee names.
SELECT ENAME, LTRIM(ENAME, 'M')
FROM EMP;

---   8. Remove leading spaces from department locations in DEPT table.
SELECT LOC, LTRIM(LOC)
FROM DEPT;

---   9. Display employee name and left trimmed job title removing letters 'S' and 'A'.
SELECT ENAME, JOB, LTRIM(JOB, 'SA')
FROM EMP;

---   10. Order all employees by left trimmed name removing leading letter 'K'.
SELECT ENAME, LTRIM(ENAME, 'K')
FROM EMP
ORDER BY LTRIM(ENAME, 'K') ASC;

---RTRIM()---

---1. Trim trailing spaces from employee names if present.
SELECT ENAME, RTRIM(ENAME)
FROM EMP;

---   2. Remove trailing character 'S' from employee names.
SELECT ENAME, RTRIM(ENAME, 'S')
FROM EMP;

---3. Trim trailing letters 'N' or 'R' from employee names.
SELECT ENAME, RTRIM(ENAME, 'NR')
FROM EMP;

---   4. Remove trailing character 'R' from job titles.
SELECT JOB, RTRIM(JOB, 'R')
FROM EMP;

---   5. Remove trailing zeros from formatted commission values.
SELECT COMM, RTRIM(TO_CHAR(COMM), '0')
FROM EMP
WHERE COMM IS NOT NULL;

---   6. Trim trailing character 'N' from department names in DEPT table.
SELECT DNAME, RTRIM(DNAME, 'N')
FROM DEPT;

---   7. Remove trailing letters 'M' or 'A' from job titles.
SELECT JOB, RTRIM(JOB, 'MA')
FROM EMP;

---   8. Display employee names with trailing letter 'H' removed.
SELECT ENAME, RTRIM(ENAME, 'H')
FROM EMP;

---   9. Display employee name and right trimmed job title removing letter 'MAN'.
SELECT ENAME, JOB, RTRIM(JOB, 'MAN')
FROM EMP;

---   10. Order all employees by right trimmed names removing trailing letter 'E'.
SELECT ENAME, RTRIM(ENAME, 'E')
FROM EMP
ORDER BY RTRIM(ENAME, 'E') ASC;

---LPAD()---

---1. Pad employee names on the left with '*' to make total length 10 characters.
SELECT ENAME, LPAD(ENAME, 10, '*')
FROM EMP;

---   2. Pad salary values on the left with '0' to make length 6 characters.
SELECT SAL, LPAD(TO_CHAR(SAL), 6, '0')
FROM EMP;

---3. Display job titles left-padded with spaces up to length 15.
SELECT JOB, LPAD(JOB, 15, ' ')
FROM EMP;

---   4. Pad employee names on the left with '#' up to length 8 for department 10.
SELECT ENAME, LPAD(ENAME, 8, '#')
FROM EMP
WHERE DEPTNO = 10;

---   5. Left pad department names with '.' to a total length of 12 characters.
SELECT DNAME, LPAD(DNAME, 12, '.')
FROM DEPT;

---   6. Display job titles left-padded with '-' to length 12 for employees earning over 2000.
SELECT ENAME, LPAD(JOB, 12, '-')
FROM EMP
WHERE SAL > 2000;

---   7. Left pad department number with '0' to make it 4 digits long.
SELECT ENAME, LPAD(TO_CHAR(DEPTNO), 4, '0')
FROM EMP;

---   8. Display employee names left-padded with '$' up to 10 characters.
SELECT ENAME, LPAD(ENAME, 10, '$')
FROM EMP;

---   9. Show employee names and left-padded job titles using character 'X'.
SELECT ENAME, LPAD(JOB, 10, 'X')
FROM EMP;

---   10. Order all employees by left-padded names with length 10.
SELECT ENAME, LPAD(ENAME, 10, '*')
FROM EMP
ORDER BY LPAD(ENAME, 10, '*') DESC;

---RPAD()---

---1. Pad employee names on the right with '*' to make total length 10 characters.
SELECT ENAME, RPAD(ENAME, 10, '*')
FROM EMP;

---   2. Pad job titles on the right with '.' to make length 15 characters.
SELECT JOB, RPAD(JOB, 15, '.')
FROM EMP;

---3. Display employee names right-padded with '-' up to length 12 for department 20.
SELECT ENAME, RPAD(ENAME, 12, '-')
FROM EMP
WHERE DEPTNO = 20;

---   4. Pad department names on the right with spaces up to 15 characters.
SELECT DNAME, RPAD(DNAME, 15, ' ')
FROM DEPT;

---   5. Display employee name right-padded with '#' and salary.
SELECT RPAD(ENAME, 10, '#'), SAL
FROM EMP;

---   6. Right pad salary values with '0' to make length 6 characters.
SELECT SAL, RPAD(TO_CHAR(SAL), 6, '0')
FROM EMP;

---   7. Right pad department locations with '*' up to length 10 in DEPT table.
SELECT LOC, RPAD(LOC, 10, '*')
FROM DEPT;

---   8. Display job titles right-padded with '+' up to 12 characters for ANALYST.
SELECT ENAME, RPAD(JOB, 12, '+')
FROM EMP
WHERE JOB = 'ANALYST';

---   9. Show employee name right-padded with ' ' and their department number.
SELECT RPAD(ENAME, 10, ' '), DEPTNO
FROM EMP;

---   10. Order all employees by right-padded job titles with length 15.
SELECT ENAME, RPAD(JOB, 15, '*')
FROM EMP
ORDER BY RPAD(JOB, 15, '*') ASC;
 FROM EMP 
 ORDER BY LENGTH(ENAME) DESC;


