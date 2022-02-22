--PROCEDIMIENTO QUE MUESTRE NOMBRE DE DEPARTAMENTO Y PRESUPUESTO REAL DEL DEPARTAMENTO (PRESUPUESTO - GASTOS)
CREATE OR REPLACE PROCEDURE nombrePresupuesto IS
v_nombre departamento.nombre%type;
v_presupuestoReal departamento.presupuesto%type;
CURSOR c_presupuesto is
    SELECT departamento.nombre, presupuesto - gastos  into v_nombre, v_presupuestoReal from departamento;
       
BEGIN 
    
    OPEN c_presupuesto;
        
    LOOP
        FETCH c_presupuesto into v_nombre,v_presupuestoReal;
        EXIT WHEN c_presupuesto%NOTFOUND;
        dbms_output.put_line('El nombre es: '|| v_nombre || ' y el presupuesto:  '|| v_presupuestoReal);
    END LOOP;
    CLOSE c_presupuesto;
END;


EXEC nombrePresupuesto;

--PROCEDIMIENTO QUE MUESTRE NOMBRE DE DEPARTAMENTO Y PRESUPUESTO REAL DEL DEPARTAMENTO (PRESUPUESTO - GASTOS)
CREATE OR REPLACE PROCEDURE nombrePresupuesto1 IS
v_registro departamento%ROWTYPE;
CURSOR c_presupuesto is
    SELECT departamento.nombre, presupuesto - gastos  into v_registro from departamento;
       
BEGIN 
    
    OPEN c_presupuesto;
        
    LOOP
        FETCH c_presupuesto into v_registro;
        EXIT WHEN c_presupuesto%NOTFOUND;
        dbms_output.put_line('El nombre es: '|| v_registro.nombre || ' y el presupuesto:  '|| v_registro.presupuesto);
    END LOOP;
    CLOSE c_presupuesto;
END;

EXEC nombrePresupuesto1;