/*
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

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
WHERE NOT LEFT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u');
