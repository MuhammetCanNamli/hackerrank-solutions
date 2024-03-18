/*
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

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

-- Working Platforms: DB2, MySQL, MSSQL

SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u')
    AND LEFT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u');
