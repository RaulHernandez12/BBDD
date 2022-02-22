/* INSERTAMOS DATOS EN LAS TABLAS */
INSERT INTO CLIENTE
(codigo_cliente,nombre,apellidos,direccion,telefono,categoria)
VALUES ('100A','Jaime','Alvarez','Calle la calle',525252,'VIP');

INSERT INTO CLIENTE
(codigo_cliente,nombre,apellidos,direccion,telefono,categoria)
VALUES ('100B','Alejandro','Alvarez','Calle la calle',525255,'VIP');

INSERT INTO CLIENTE
(codigo_cliente,nombre,apellidos,direccion,telefono,categoria)
VALUES ('100C','Juan','Ceballos','Calle la calle',5255465,'VIP');

INSERT INTO CLIENTE
(codigo_cliente,nombre,apellidos,direccion,telefono,categoria)
VALUES ('100D','Juan','Perez','avenida aogjea',52554665,'VIP');

INSERT INTO cliente (codigo_cliente, nombre, apellidos)
values ('102A','PEPE', 'pérez');

INSERT INTO producto (codigo_producto, descripcion, existencias, precio )
VALUES ('A100','Lavavajillas', 15, 100.50); 

INSERT INTO producto (codigo_producto, descripcion, existencias, precio )
VALUES ('A200','Lavavajillas', 20, 300.99);

INSERT INTO producto (codigo_producto, descripcion, existencias, precio )
VALUES ('A300','Lavadora', 50, 250); 

INSERT INTO producto (codigo_producto, descripcion, existencias, precio )
VALUES ('A400','Lavadora', 25, 199.99); 


INSERT INTO compra (fecha_compra, codigo_producto, codigo_cliente)
values ('08/12/2020', 'A100', '100B');


INSERT INTO compra (fecha_compra, codigo_producto, codigo_cliente)
values ('08/12/2021', 'A200', '100B');

INSERT INTO compra (fecha_compra, codigo_producto, codigo_cliente)
values ('08/12/2020', 'A300', '100A');

INSERT INTO compra (fecha_compra, codigo_producto, codigo_cliente)
values ('05/12/2020', 'A400', '100C');

INSERT INTO proveedor (codigo_proveedor, nombre, apellidos, direccion , edad , telefono )
VALUES ('AB01', 'SEBASTIAN', 'Gutierrez', 'Calle safari', 40, 555555);

INSERT INTO proveedor (codigo_proveedor, nombre, apellidos, direccion , edad , telefono )
VALUES ('DD44', 'David', 'Moreno', 'Calle benavente', 35, 88888);

INSERT INTO proveedor (codigo_proveedor, nombre, apellidos, direccion , edad , telefono )
VALUES ('FF66', 'Manuel', 'Garrido', 'Calle garcia lorca', 42, 666666);

INSERT INTO suministra (codigo_producto,codigo_proveedor)
VALUES ('A100', 'FF66');

INSERT INTO suministra (codigo_producto,codigo_proveedor)
VALUES ('A200', 'FF66');

INSERT INTO suministra (codigo_producto,codigo_proveedor)
VALUES ('A300', 'DD44');

INSERT INTO suministra (codigo_producto,codigo_proveedor)
VALUES ('A400', 'AB01');

/*Hacemos los select*/

Select * from proveedor;

SELECT * from compra;

SELECT * from suministra; /*Si salen repetidos porque un mismo proveedor suministra dos productos diferentes*/

SELECT ALL apellidos from cliente where apellidos = 'Alvarez'; /* Hay dos alvarez, he puesto alvarez porque no tenía ningún gomez como dice el ejercicio*/

SELECT ALL direccion from cliente where direccion like 'Calle%';

SELECT ALL nombre from cliente where nombre like 'J%';

SELECT ALL fecha_compra from compra where fecha_compra BETWEEN '01/01/2020' AND '12/12/2020';

SELECT codigo_producto from compra ;

SELECT codigo_producto from compra WHERE codigo_producto like 'L%'; /* Sería asi pero no sale ninguno porque no hay ningun producto que empiece por L*/

SELECT fecha_compra from compra ORDER BY 1 ASC;

/* Aqui estan todas las consultas , no se si alguna estará mal , lo único con lo que he tenido problemas ha sido a la hora de poner la restricción de la fecha de compra que sea anterior a la fecha actual
que no he conseguido ponerla me daba error de formato o algo así y no he conseguido solucionarlo lo mirare mas detenidamente en casa*/



