/*

Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

Input Format

The following tables contain data on the wands in Ollivander's inventory:

Wands: The id is the id of the wand, code is the code of the wand, coins_needed is the total number of gold galleons needed to buy the wand, and power denotes the quality of the wand (the higher the power, the better the wand is).

 ______________ ______________
| Column       | Type         |
 -------------- --------------
| id           | Integer      |
| code         | Integer      |
| coins_needed | Integer      |
| power        | Integer      |
 -------------- --------------


Wands_Property: The code is the code of the wand, age is the age of the wand, and is_evil denotes whether the wand is good for the dark arts. If the value of is_evil is 0, it means that the wand is not evil. The mapping between code and age is one-one, meaning that if there are two pairs, (code1, age1) and (code2, age2), then code1 != code2 and age1 != age2.

 ______________ ______________
| Column       | Type         |
 -------------- --------------
| code         | Integer      |
| age          | Integer      |
| is_evil      | Integer      |
 -------------- --------------


Sample Input

           Wands Table
 ____ ______ ______________ _______
| id | code | coins_needed | power |
 ---- ------ -------------- -------
| 1  | 4    | 3688         | 4     |
| 2  | 3    | 9365         | 1     |
| 3  | 3    | 7187         | 7     |
| 4  | 3    | 734          | 6     |
| 5  | 1    | 6020         | 2     |
| 6  | 2    | 6773         | 0     |
| 7  | 3    | 9873         | 20    |
| 8  | 3    | 7721         | 23    |
| 9  | 1    | 1647         | 30    |
| 10 | 4    | 504          | 0     |
| 11 | 2    | 7587         | 30    |
| 12 | 5    | 9897         | 92    |
| 13 | 3    | 4651         | 92    |
| 14 | 2    | 5408         | 36    |
| 15 | 2    | 6018         | 4     |
| 16 | 4    | 7710         | 0     |
| 17 | 2    | 8798         | 80    |
| 18 | 2    | 3312         | 35    |
| 19 | 4    | 7651         | 80    |
| 20 | 4    | 5689         | 100   |
 ---- ------ -------------- -------

  Wands_Property Table
 ______ _______ _______ 
| code | age   | power |
 ------ ------- -------
| 1    | 45    | 0     |
| 2    | 40    | 0     |
| 3    | 4     | 1     |
| 4    | 20    | 0     |
| 5    | 17    | 0     |
 ------ ------- -------


Sample Output

9 45 1647 10
12 17 9897 10
1 20 3688 8
15 40 6018 7
19 20 7651 6
11 40 7587 5
10 20 504 5
18 40 3312 3
20 17 5689 3
5 45 6020 2
14 40 5408 1


Explanation

 ____ ______ ______________ _______
| id | age  | coins_needed | power |
 ---- ------ -------------- -------
| 5  | 45   | 6020         | 2     |
| 9  | 45   | 1647         | 10    |
 ---- ------ -------------- -------

The data for wands of age 45 (code 1): 

The minimum number of galleons needed for wand(age = 45, power = 2) = 6020
The minimum number of galleons needed for wand(age = 45, power = 10) = 1647


 ____ ______ ______________ _______
| id | age  | coins_needed | power |
 ---- ------ -------------- -------
| 14 | 40   | 5408         | 1     |
| 18 | 40   | 3312         | 3     |
| 11 | 40   | 7587         | 5     |
| 15 | 40   | 6018         | 7     |
| 17 | 40   | 8798         | 7     |
| 6  | 40   | 6773         | 7     |
 ---- ------ -------------- -------

The data for wands of age 40 (code 2): 

The minimum number of galleons needed for wand(age = 40, power = 1) = 5408
The minimum number of galleons needed for wand(age = 40, power = 3) = 3312
The minimum number of galleons needed for wand(age = 40, power = 5) = 7587
The minimum number of galleons needed for wand(age = 40, power = 7) = 6018


 ____ ______ ______________ _______
| id | age  | coins_needed | power |
 ---- ------ -------------- -------
| 10 | 20   | 504          | 5     |
| 16 | 20   | 7710         | 5     |
| 19 | 20   | 7651         | 6     |
| 1  | 20   | 3688         | 8     |
 ---- ------ -------------- -------

The data for wands of age 20 (code 4): 

The minimum number of galleons needed for wand(age = 20, power = 5) = 504
The minimum number of galleons needed for wand(age = 20, power = 6) = 7651
The minimum number of galleons needed for wand(age = 20, power = 8) = 3688


 ____ ______ ______________ _______
| id | age  | coins_needed | power |
 ---- ------ -------------- -------
| 20 | 17   | 5689         | 3     |
| 12 | 17   | 9897         | 10    |
 ---- ------ -------------- -------

The data for wands of age 17 (code 5): 

The minimum number of galleons needed for wand(age = 17, power = 3) = 5689
The minimum number of galleons needed for wand(age = 17, power = 10) = 9897

*/

-- Working Platforms: DB2, MySQL, MSSQL

SELECT W.ID, WP.AGE, W.COINS_NEEDED, W.POWER 
FROM WANDS AS W
JOIN WANDS_PROPERTY AS WP ON W.CODE = WP.CODE
WHERE WP.IS_EVIL = 0 
AND W.COINS_NEEDED = 
(
    SELECT MIN(X.COINS_NEEDED) 
    FROM WANDS AS X
    JOIN WANDS_PROPERTY AS Y ON X.CODE = Y.CODE
    WHERE X.POWER = W.POWER 
    AND Y.AGE = WP.AGE
) 
ORDER BY W.POWER DESC, WP.AGE DESC;
