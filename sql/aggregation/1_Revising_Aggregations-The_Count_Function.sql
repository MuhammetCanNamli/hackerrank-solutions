/*

Query a count of the number of cities in CITY having a Population larger than 100000.

	      CITY
 ______________ ______________
| Field	       | Type	      |
 -------------- --------------
| ID	       | NUMBER	      |
| CITY	       | VARCHAR2(17) |
| COUNTRYCODE  | VARCHAR2(3)  |
| DISTRICT     | VARCHAR2(20) |
| POPULATION   | NUMBER	      |
 -------------- --------------

*/

-- Working Platforms: MySQL, Oracle, MSSQL

SELECT COUNT(*)
FROM CITY
WHERE POPULATION > 100000;
