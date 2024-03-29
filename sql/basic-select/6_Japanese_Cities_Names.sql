/*
Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

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

SELECT NAME 
FROM CITY
WHERE COUNTRYCODE = 'JPN';
