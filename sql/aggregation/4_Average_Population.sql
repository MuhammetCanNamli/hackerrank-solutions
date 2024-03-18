/*

Query the average population for all cities in CITY, rounded down to the nearest integer.

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

-- Working Platforms: DB2, MySQL, Oracle

SELECT ROUND(AVG(Population)) AS Average_Population
FROM CITY;
