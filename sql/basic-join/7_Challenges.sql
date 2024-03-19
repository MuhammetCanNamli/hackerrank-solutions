/*

Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

Input Format

The following tables contain challenge data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.

 ______________ ______________
| Column       | Type         |
 -------------- --------------
| hacker_id    | Integer      |
| name         | String       |
 -------------- --------------


Challenges: The challenge_id is the id of the challenge, and hacker_id is the id of the student who created the challenge. 

 __________________ ______________
| Column           | Type         |
 ------------------ --------------
| challenge_id     | Integer      |
| hacker_id        | Integer      |
 ------------------ --------------


Sample Input 0

         Hackers Table
 ______________ ______________
| hacker_id    | name         |
 -------------- --------------
| 5077         | Rose         |
| 21283        | Angela       |
| 62743        | Frank        |
| 88255        | Patrick      |
| 96196        | Lisa         |
 -------------- --------------


               Challenges Table
 ______________ ______________ 
| challenge_id | hacker_id    |
 -------------- -------------- 
| 61654        | 5077         |
| 58302        | 21283        |
| 40587        | 88255        |
| 29477        | 5077         |
| 1220         | 21283        |
| 69514        | 21283        |
| 46561        | 62743        |
| 58077        | 62743        |
| 18483        | 88255        |
| 76766        | 21283        |
| 52382        | 5077         |
| 74467        | 21283        |
| 33625        | 96196        |
| 26053        | 88255        |
| 42665        | 62743        |
| 12859        | 62743        |
| 70094        | 21283        |
| 34599        | 88255        |
| 54680        | 88255        |
| 61881        | 5077         |
 -------------- -------------- 


Sample Output 0

21283 Angela 6
88255 Patrick 5
96196 Lisa 1


Sample Input 1

        Hackers Table
 ______________ ______________
| hacker_id    | name         |
 -------------- --------------
| 12299        | Rose         |
| 34856        | Angela       |
| 79345        | Frank        |
| 80491        | Patrick      |
| 81041        | Lisa         |
 -------------- --------------


               Challenges Table
 ______________ ______________ 
| challenge_id | hacker_id    |
 -------------- -------------- 
| 63963        | 81041        |
| 63117        | 79345        |
| 28225        | 34856        |
| 21989        | 12299        |
| 4653         | 12299        |
| 70070        | 79345        |
| 36905        | 34856        |
| 61136        | 80491        |
| 17234        | 12299        |
| 80308        | 79345        |
| 40510        | 34856        |
| 79820        | 80491        |
| 22720        | 12299        |
| 21394        | 12299        |
| 36261        | 34856        |
| 15334        | 12299        |
| 71435        | 79345        |
| 23157        | 34856        |
| 54102        | 34856        |
| 69065        | 804941       |
 -------------- -------------- 

Sample Output 1

12299 Rose 6
34856 Angela 6
79345 Frank 4
80491 Patrick 3
81041 Lisa 1


Explanation

For Sample Case 0, we can get the following details:

 ______________ ___________ ____________________
| hacker_id    | name      | challenges_created |
 -------------- ----------- --------------------
| 21283        | Angela    | 6                  |
| 88255        | Patrick   | 5                  |
| 5077         | Rose      | 4                  |
| 62743        | Frank     | 4                  |
| 96196        | Lisa      | 1                  |
 -------------- ----------- --------------------

Students 5077 and 62743 both created 4 challenges, but the maximum number of challenges created is 6 so these students are excluded from the result.

For Sample Case 1, we can get the following details:

 ______________ ___________ ____________________
| hacker_id    | name      | challenges_created |
 -------------- ----------- --------------------
| 12299        | Rose      | 6                  |
| 34856        | Angela    | 6                  |
| 79345        | Frank     | 4                  |
| 80491        | Patrick   | 3                  |
| 81041        | Lisa      | 1                  |
 -------------- ----------- --------------------

Students 12299 and 34856 both created 6 challenges. Because 6 is the maximum number of challenges created, these students are included in the result.


*/

-- Working Platforms: MySQL

SELECT H.HACKER_ID, 
       H.NAME, 
       COUNT(C.CHALLENGE_ID) AS C_COUNT
FROM HACKERS H
JOIN CHALLENGES C ON C.HACKER_ID = H.HACKER_ID
GROUP BY H.HACKER_ID, H.NAME
HAVING C_COUNT = 
    (SELECT COUNT(C2.CHALLENGE_ID) AS C_MAX
     FROM CHALLENGES AS C2
     GROUP BY C2.HACKER_ID 
     ORDER BY C_MAX DESC LIMIT 1)
OR C_COUNT IN 
    (SELECT DISTINCT C_COMPARE AS C_UNIQUE
     FROM (SELECT H2.HACKER_ID, 
                  H2.NAME, 
                  COUNT(CHALLENGE_ID) AS C_COMPARE
           FROM HACKERS H2
           JOIN CHALLENGES C ON C.HACKER_ID = H2.HACKER_ID
           GROUP BY H2.HACKER_ID, H2.NAME) COUNTS
     GROUP BY C_COMPARE
     HAVING COUNT(C_COMPARE) = 1)
ORDER BY C_COUNT DESC, H.HACKER_ID;