/*
Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

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

-- Working Platforms: DB2, MySQL, Oracle

SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;
