/*

Query the average population of all cities in CITY where District is California.

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

SELECT AVG(POPULATION) AS Average_Population
FROM CITY
WHERE DISTRICT = 'California';
