/*

Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

For example, the output for all prime numbers <=10 would be:

2&3&5&7

*/

-- Working Platforms: Oracle

SET SERVEROUTPUT ON;
DECLARE
    COUNTER NUMBER;
    K NUMBER;
    RESULT CLOB;
BEGIN
    RESULT := '';
    FOR N IN 2..1000 LOOP
    COUNTER := 0;
    K := FLOOR(N/2);
    FOR i IN 2..K LOOP
        IF(MOD(N,i)=0) THEN
          COUNTER :=1;
        END IF;
    END LOOP;
    IF (COUNTER = 0) THEN
       RESULT := RESULT||N||'&';
    END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(SUBSTR(RESULT,0,length(RESULT)-1));
END;
/