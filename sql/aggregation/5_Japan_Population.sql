/*

Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

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

SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';
