/*
Query all columns for a city in CITY with the ID 1661.

The CITY table is described as follows:

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

-- Working Platforms: DB2, MySQL, Oracle, MSSQL

SELECT *
FROM CITY
WHERE ID = 1661;
