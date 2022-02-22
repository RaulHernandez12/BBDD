--1.Inserta dos nuevos departamentos indicando su código,nombre y presupuesto.
INSERT INTO DEPARTAMENTO (codigo,nombre,presupuesto) VALUES (8,'Jefatura',500000);
INSERT INTO DEPARTAMENTO (codigo,nombre,presupuesto) VALUES (9,'Pedidos',100000);

--2.Inserta un nuevo empleado asociado a uno de los nuevos departamentos.La sentencia debe incluir código, nif, nombre, apellido1, apellido2 y codigo_departamento.

INSERT INTO EMPLEADO VALUES(14,'76652178L','Raul','Hernandez','Cabello',8);
INSERT INTO EMPLEADO VALUES(15,'70070080P','Alejandro','Moreno','Ruz',9);

/*3.Crea una nueva tabla con el nombre departamento_backup que tenga las mismas columnas que la tabla departamento. 
Una vez creada copia todas las filas de tabla departamento en departamento_backup.*/

CREATE TABLE DEPARTAMENTO_BACKUP(
Codigo NUMBER,
Nombre VARCHAR2(100),
Presupuesto NUMBER,
Gastos NUMBER
);

INSERT INTO DEPARTAMENTO_BACKUP SELECT * FROM DEPARTAMENTO;

/*4.Elimina el departamento Proyectos. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?*/

DELETE FROM DEPARTAMENTO WHERE nombre='Proyectos';

/*5.Elimina el departamento Desarrollo. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?*/

DELETE  FROM DEPARTAMENTO WHERE nombre='Desarrollo';
/*No es posible eliminarlo ya que que el departamento desarrollo está relacionado con la tabla empleado mediante la clave primaria,
y se perdería la integridadpara poder borrar este departamento deberiamos haber creado la tabla con la foreing key con la condicion on delete cascade*/

/*6.Actualiza el código del departamento Recursos Humanos y asígnale el valor 30. 
¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?*/

UPDATE DEPARTAMENTO SET CODIGO=30 WHERE NOMBRE='RecursosHumanos';
/*No es posible actualizarlo por la misma razon que el anterior, ya que hay una relación entre las tablas y se perderia la integridad*/

/*7.Actualiza el código del departamento Publicidad y asígnale el valor 40.
¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?*/

UPDATE DEPARTAMENTO SET CODIGO=40 WHERE NOMBRE='Publicidad';
/*En este caso si se puede ya que no hay ningún empleado asignado al departamento publicidad por lo que no hay relación entre las tablas*/

/*8.Actualiza el presupuesto de los departamentos sumándole 50000 € al valor del presupuesto actual,
solamente a aquellos departamentos que tienen un presupuesto menor que 20000 €.*/

UPDATE DEPARTAMENTO SET PRESUPUESTO= PRESUPUESTO + 5000 WHERE PRESUPUESTO <= 20000;

/*9.Realiza una transacción que elimine todos los empleados que no tienen un departamento asociado.*/

BEGIN
DELETE EMPLEADO WHERE codigo_departamento is null;
END;

/*10.Crea una tabla igual que la de empleado que se llamará empleado_backup pero sin la foreign key.
Si no te acuerdas de los campos que tiene la tabla empleado y el tipo de cada campo, usa la sentencia DESCRIBE empleado;*/

CREATE TABLE EMPLEADO_BACKUP(
CODIGO NUMBER,
NIF VARCHAR2(9),
NOMBRE VARCHAR2(100),
APELLLIDO1 VARCHAR2(100),
APELLIDO2 VARCHAR2(100),
CODIGO_DEPARTAMENTO NUMBER
);

Describe empleado;
/*11.Insertar en la tabla de backup de empleados, los empleados que trabajen en el departamento 1*/

INSERT INTO EMPLEADO_BACKUP SELECT * FROM EMPLEADO WHERE CODIGO_DEPARTAMENTO=1;

/*12.Insertar solo los códigos, nif y salario de aquellos empleados que trabajen en el departamento 9.*/

INSERT INTO EMPLEADO_BACKUP (CODIGO,NIF) SELECT CODIGO,NIF FROM EMPLEADO WHERE CODIGO_DEPARTAMENTO=9;

/*13.Cambiar a los empleados que trabajen en el departamento 5 al departamento 9.*/

UPDATE EMPLEADO SET CODIGO_DEPARTAMENTO=9 WHERE CODIGO_DEPARTAMENTO=5;



/* Aqui dejo algunos select que he utilizado durante la realización del ejercicio*/
Select nombre,codigo from departamento;

Select codigo_departamento,nombre from empleado;

SELECT PRESUPUESTO FROM DEPARTAMENTO;

SELECT * FROM EMPLEADO;