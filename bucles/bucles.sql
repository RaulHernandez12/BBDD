CREATE OR REPLACE PROCEDURE NEGATIVO (num1 in NUMBER) IS
BEGIN
IF num1 = 0 THEN dbms_output.put_line('El resultado es 0'); 
ELSIF num1 < 0 THEN dbms_output.put_line('negativo');
ELSE dbms_output.put_line('positivo');
END IF;
END;

BEGIN

NEGATIVO(0);

END;

CREATE OR REPLACE PROCEDURE positivo (num1 in NUMBER,resultado out varchar) IS
BEGIN
IF num1 = 0 THEN resultado:='El resultado es 0'; 
ELSIF num1 < 0 THEN resultado:='negativo';
ELSE resultado:='positivo';
END IF;
END;

DECLARE
texto varchar2(20);

BEGIN
positivo(10,texto);
DBMS_OUTPUT.put_line(texto);
END;

DECLARE
numero NUMBER :=1;
BEGIN
LOOP
DBMS_OUTPUT.put_line(numero);
if numero = 10 THEN EXIT;
END IF;
numero := numero + 1;
END LOOP;
END;
    

BEGIN
FOR numero IN 1..10 LOOP
DBMS_OUTPUT.put_line(numero);
END LOOP;
END;

DECLARE
numero NUMBER:=0;
BEGIN
LOOP          
DBMS_OUTPUT.put_line(numero);
numero :=numero+1;  
IF (numero >10) THEN
    EXIT;
END IF;
END LOOP;
END;

DECLARE
numero number(10);
BEGIN
numero :=0;
    WHILE numero <=10 LOOP
    dbms_output.put_line(numero);
    numero := numero + 1;
    END LOOP;
END;

DECLARE
v_stock NUMBER;
BEGIN 
SELECT  COUNT(producto.codigo) INTO v_stock FROM PRODUCTO;
dbms_output.put_line('el stock de productos es '||v_stock);
END;


SELECT COUNT(producto.codigo) FROM PRODUCTO;