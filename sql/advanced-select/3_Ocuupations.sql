/*

Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Input Format

The OCCUPATIONS table is described as follows:

 ______________ ______________
| Column       | Type	      |
 -------------- --------------
| Name	       | String       |
| Occupation   | String       |
 -------------- --------------

Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Sample Input

 ______________ ______________
| Name         | Occupation   |
 -------------- --------------
| Samantha     | Doctor       |
| Julia	       | Actor        |
| Maria	       | Actor        |
| Meera	       | Singer       |
| Ashley       | Professor    |
| Ketty	       | Professor    |
| Chirsteen    | Professor    |
| Jane	       | Actor        |
| Jenny	       | Doctor       |
| Priya	       | Singer       |
 -------------- --------------

Sample Output

Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria


Explanation

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with NULL values.

*/

-- Working Platforms: MySQL, MSSQL

SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
    SELECT
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
    FROM
        OCCUPATIONS
) AS sub
GROUP BY
    rn
ORDER BY
    rn;

