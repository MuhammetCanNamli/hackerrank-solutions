/*

You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

           Students
 ______________ ______________
| Column       | Type         |
 -------------- --------------
| ID           | Integer      |
| Name         | String       |
 -------------- --------------

            Friends
 ______________ ______________
| Column       | Type         |
 -------------- --------------
| ID           | Integer      |
| Friend_ID    | Integer      |
 -------------- --------------

           Packages
 ______________ ______________
| Column       | Type         |
 -------------- --------------
| ID           | Integer      |
| Salary       | Float        |
 -------------- --------------

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

Sample Input

     Friends
 ____ ___________ 
| ID | Friend_ID |
 ---- -----------
| 1  | 2         |
| 2  | 3         |
| 3  | 4         |
| 4  | 1         |
 ---- ----------- 

    Students
 ____ ___________ 
| ID | Name      |
 ---- -----------
| 1  | Ashley    |
| 2  | Samantha  |
| 3  | Julia     |
| 4  | Scarlet   |
 ---- ----------- 

    Packages
 ____ ___________ 
| ID | Salary    |
 ---- -----------
| 1  | 15.20     |
| 2  | 10.06     |
| 3  | 11.55     |
| 4  | 12.12     |
 ---- ----------- 


Sample Output

Samantha
Julia
Scarlet


Explanation

See the following table:

 ________________ __________ ____________ _________ __________
| ID             | 1        | 2          | 3       | 4        |
 ---------------- ---------- ------------ --------- ----------
| Name           | Ashley   | Samantha   | Julia   | Scarlet  |
| Salary         | 15.20    | 10.06      | 11.55   | 12.12    |
| Friend ID      | 2        | 3          | 4       | 1        |
| Friend Salary  | 10.06    | 11.55      | 12.12   | 15.20    |
 ---------------- ---------- ------------ --------- ----------

Now,
- Samantha's best friend got offered a higher salary than her at 11.55
- Julia's best friend got offered a higher salary than her at 12.12
- Scarlet's best friend got offered a higher salary than her at 15.2
- Ashley's best friend did NOT get offered a higher salary than her


The name output, when ordered by the salary offered to their friends, will be:
- Samantha
- Julia
- Scarlet

*/

-- Working Platforms: DB2, MySQL, Oracle, MSSQL

Select S.NAME
FROM STUDENTS S 
JOIN FRIENDS F ON S.ID = F.ID
JOIN PACKAGES P1 ON S.ID = P1.ID
JOIN PACKAGES P2 ON F.FRIEND_ID = P2.ID
WHERE P2.SALARY > P1.SALARY
ORDER BY P2.SALARY;