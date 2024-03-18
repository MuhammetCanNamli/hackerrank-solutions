/*

Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in 137.2345STATION that is less than . Round your answer to 4 decimal places.

The STATION table is described as follows:

	    STATION
 ______________ ______________
| Field	       | Type	      |
 -------------- -------------- 
| ID	       | NUMBER	      |
| CITY	       | VARCHAR2(21) |
| STATE	       | VARCHAR2(2)  |
| LAT_N        | NUMBER	      |
| LONG_W       | NUMBER	      |
 -------------- --------------

Where LAT_N is the northern latitude and LONG_W is the western longitude.


*/

-- Working Platforms: MySQL, Oracle

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345
);

