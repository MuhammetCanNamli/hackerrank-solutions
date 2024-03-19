/*

You are given a table, Functions, containing two columns: X and Y.

 ______________ ______________
| Column       | Type         |
 -------------- --------------
| X            | Integer      |
| Y            | Integer      |
 -------------- --------------

Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.

Sample Input

 ____ ____
| X  | Y  |
 ---- ----
| 20 | 20 |
| 20 | 20 |
| 20 | 21 |
| 23 | 22 |
| 22 | 23 |
| 21 | 20 |
 ---- ----

Sample Output

20 20
20 21
22 23

*/

-- Working Platforms: DB2, MySQL, Oracle, MSSQL

SELECT X, Y FROM FUNCTIONS F1
    WHERE EXISTS(SELECT * FROM FUNCTIONS F2 WHERE F2.Y = F1.X
    AND F2.X = F1.Y AND F2.X > F1.X) AND (X != Y)
UNION
SELECT X,Y FROM FUNCTIONS F1 WHERE X = Y AND 
    ((SELECT COUNT(*) FROM FUNCTIONS WHERE X = F1.X AND Y = F1.X) > 1)
      ORDER BY X;