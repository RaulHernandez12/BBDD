--CON PROCEDIMIENTO SIN PARAMETROS
CREATE OR REPLACE PROCEDURE aumentarSalario   IS
CURSOR c_empleado IS
SELECT * FROM EMPLEADO
where empleado.salario >= 800 and empleado.salario <= 1000;
v_registro c_empleado%ROWTYPE;
v_contador number :=0;
BEGIN

OPEN c_empleado;
    LOOP
        FETCH c_empleado INTO v_registro;
        EXIT WHEN c_empleado%NOTFOUND;
        UPDATE empleado SET empleado.salario= (empleado.salario * 1.20)
        WHERE v_registro.codigo = empleado.codigo;         
        v_contador:= v_contador +1;        
    END LOOP;
    dbms_output.put_line('Empleados actualizados: ' || v_contador);
    
CLOSE c_empleado;
END;
EXEC aumentarSalario;

UPDATE EMPLEADO SET SALARIO = 1000 where codigo_departamento = 1;
select * from empleado ORDER BY SALARIO ASC;
ROLLBACK;


--Procedimiento por parametros
CREATE OR REPLACE PROCEDURE aumentarSalario1 (v_codDep empleado.codigo_departamento%type)   IS
CURSOR c_empleado IS
SELECT * FROM EMPLEADO
where empleado.salario >= 800 and empleado.salario <= 1000 and v_codDep = codigo_departamento;
v_registro c_empleado%ROWTYPE;
v_contador number :=0;
BEGIN

OPEN c_empleado;
    LOOP
        FETCH c_empleado INTO v_registro;
        EXIT WHEN c_empleado%NOTFOUND;
        UPDATE empleado SET empleado.salario= (empleado.salario * 1.20)
        WHERE v_registro.codigo = empleado.codigo;         
        v_contador:= v_contador +1;        
    END LOOP;
    dbms_output.put_line('Empleados actualizados: ' || v_contador);
    
CLOSE c_empleado;
END;

EXEC aumentarSalario1 (1);