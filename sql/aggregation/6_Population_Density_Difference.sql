/*

Query the difference between the maximum and minimum populations in CITY.

	      CITY
 ______________ ______________
| Field	       | Type	      |
-------------------------------
| ID	       | NUMBER	      |
| CITY	       | VARCHAR2(17) |
| COUNTRYCODE  | VARCHAR2(3)  |
| DISTRICT     | VARCHAR2(20) |
| POPULATION   | NUMBER	      |
-------------------------------

*/

-- Working Platforms: DB2, MySQL, Oracle, MSSQL

SELECT MAX(Population) - MIN(Population) AS Population_Difference
FROM CITY;
