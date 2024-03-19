/*

Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0.

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.


Input Format

The following tables hold interview data:

- Contests: The contest_id is the id of the contest, hacker_id is the id of the hacker who created the contest, and name is the name of the hacker.

 ______________ ______________
| Column       | Type         |
 -------------- --------------
| contest_id   | Integer      |
| hacker_id    | Integer      |
| name         | String       |
 -------------- --------------

- Colleges: The college_id is the id of the college, and contest_id is the id of the contest that Samantha used to screen the candidates.

 ______________ ______________
| Column       | Type         |
 -------------- --------------
| college_id   | Integer      |
| contest_id   | Integer      |
 -------------- --------------

- Challenges: The challenge_id is the id of the challenge that belongs to one of the contests whose contest_id Samantha forgot, and college_id is the id of the college where the challenge was given to candidates.

 ______________ ______________
| Column       | Type         |
 -------------- --------------
| challenge_id | Integer      |
| college_id   | Integer      |
 -------------- --------------

- View_Stats: The challenge_id is the id of the challenge, total_views is the number of times the challenge was viewed by candidates, and total_unique_views is the number of times the challenge was viewed by unique candidates. 

 ____________________ ______________
| Column             | Type         |
 -------------------- --------------
| challenge_id       | Integer      |
| total_views        | Integer      |
| total_unique_views | Integer      |
 -------------------- --------------

- Submission_Stats: The challenge_id is the id of the challenge, total_submissions is the number of submissions for the challenge, and total_accepted_submission is the number of submissions that achieved full scores.

 ____________________________ ______________
| Column                     | Type         |
 ---------------------------- --------------
| challenge_id               | Integer      |
| total_submissions          | Integer      |
| total_accepted_submissions | Integer      |
 ---------------------------- --------------


Sample Input

             Contests Table
 ______________ ___________ ___________
| contest_id   | hacker_id | name      |
 -------------- ----------- ----------- 
| 66406        | 17973     | Rose      |
| 66556        | 79153     | Angela    |
| 94828        | 80275     | Frank     |
 -------------- ----------- -----------

       Colleges Table
 ______________ ____________ 
| challenge_id | college_id |
 -------------- ------------ 
| 18765        | 11219      |
| 47127        | 11219      |
| 60292        | 32473      |
| 72974        | 56685      |
 -------------- ------------ 

      Challenges Table
 ______________ ____________ 
| college_id   | contest_id |
 -------------- ------------ 
| 11219        | 66406      |
| 32473        | 66556      |
| 56685        | 94828      |
 -------------- ------------

                  View_Stats Table
 ______________ _____________ _________________________
| challenge_id | total_views | total_unique_views      |
 -------------- ------------- ------------------------- 
| 47127        | 26          | 19                      |
| 47127        | 15          | 14                      |
| 18765        | 43          | 10                      |
| 18765        | 72          | 13                      |
| 75516        | 35          | 17                      |
| 60292        | 11          | 10                      |
| 72974        | 41          | 15                      |
| 75516        | 75          | 11                      |
 -------------- ------------- ------------------------- 

               Submission_Stats Table
 ______________ _____________ _________________________
| challenge_id | total_views | total_unique_views      |
 -------------- ------------- ------------------------- 
| 75516        | 34          | 12                      |
| 47127        | 27          | 10                      |
| 47127        | 56          | 18                      |
| 75516        | 74          | 12                      |
| 75516        | 83          | 8                       |
| 72974        | 68          | 24                      |
| 72974        | 82          | 14                      |
| 47127        | 28          | 11                      |
 -------------- ------------- ------------------------- 


Sample Output

66406 17973 Rose 111 39 156 56
66556 79153 Angela 0 0 11 10
94828 80275 Frank 150 38 41 15


Explanation

The contest 66406 is used in the college 11219. In this college 11219, challenges 18765 and 47127 are asked, so from the view and submission stats:

- Sum of total submissions = 27 + 56 + 28 = 111

- Sum of total accepted submissions = 10 + 18 + 11 = 39

- Sum of total views = 43 + 72 + 26 + 15 = 56

- Sum of total unique views = 10 + 13 + 19 + 14 = 56

Similarly, we can find the sums for contests 66556 and 94828.


*/

-- Working Platforms: DB2, MySQL, Oracle, MSSQL

SELECT A.CONTEST_ID, A.HACKER_ID, A.NAME, 
        SUM(COALESCE(E.TOTAL_SUBMISSIONS, 0)) AS TOTAL_SUBMISSIONS, 
        SUM(COALESCE(E.TOTAL_ACCEPTED_SUBMISSIONS, 0)) AS TOTAL_ACCEPTED_SUBMISSIONS,
        SUM(COALESCE(D.TOTAL_VIEWS, 0)) AS TOTAL_VIEWS,
        SUM(COALESCE(D.TOTAL_UNIQUE_VIEWS, 0)) AS TOTAL_UNIQUE_VIEWS
FROM CONTESTS A
LEFT JOIN COLLEGES B
    ON A.CONTEST_ID = B.CONTEST_ID
LEFT JOIN CHALLENGES C
    ON B.COLLEGE_ID = C.COLLEGE_ID 
LEFT JOIN (SELECT CHALLENGE_ID, SUM(TOTAL_VIEWS) AS TOTAL_VIEWS, 
                  SUM(TOTAL_UNIQUE_VIEWS) AS TOTAL_UNIQUE_VIEWS
           FROM VIEW_STATS
           GROUP BY CHALLENGE_ID) D 
    ON C.CHALLENGE_ID = D.CHALLENGE_ID 
LEFT JOIN (SELECT CHALLENGE_ID, SUM(TOTAL_SUBMISSIONS) AS TOTAL_SUBMISSIONS, 
                  SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TOTAL_ACCEPTED_SUBMISSIONS
           FROM SUBMISSION_STATS
           GROUP BY CHALLENGE_ID) E
    ON C.CHALLENGE_ID = E.CHALLENGE_ID
GROUP BY A.CONTEST_ID, A.HACKER_ID, A.NAME
HAVING (SUM(COALESCE(E.TOTAL_SUBMISSIONS, 0)) + 
        SUM(COALESCE(E.TOTAL_ACCEPTED_SUBMISSIONS, 0)) + 
        SUM(COALESCE(D.TOTAL_VIEWS, 0)) + 
        SUM(COALESCE(D.TOTAL_UNIQUE_VIEWS, 0))) > 0 
ORDER BY A.CONTEST_ID;
