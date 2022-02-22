CREATE TABLE EMPLEADO (
Codigo INT PRIMARY KEY,
NIF VARCHAR(9),
Nombre VARCHAR(100),
Apellido1 VARCHAR(100),
Apellido2 VARCHAR(100),
Codigo_departamento INT,
CONSTRAINT fk_CodDep FOREIGN KEY (Codigo_departamento) REFERENCES DEPARTAMENTO (Codigo) 
);

CREATE TABLE DEPARTAMENTO(
Codigo INT PRIMARY KEY,
Nombre VARCHAR (100),
PRESUPUESTO NUMBER,
GASTOS NUMBER
);

DROP TABLE DEPARTAMENTO;

INSERT INTO departamento VALUES(1,'Desarrollo',120000,6000);
INSERT INTO departamento VALUES(2,'Sistemas',150000,21000);
INSERT INTO departamento VALUES(3,'RecursosHumanos',280000,25000);
INSERT INTO departamento VALUES(4,'Contabilidad',110000,3000);
INSERT INTO departamento VALUES(5,'I+D',375000,380000);
INSERT INTO departamento VALUES(6,'Proyectos',0,0);
INSERT INTO departamento VALUES(7,'Publicidad',0,1000);
INSERT INTO empleado VALUES(1,'32481596F','Aar�n','Rivero','G�mez',1);
INSERT INTO empleado VALUES(2,'Y5575632D','Adela','Salas','D�az',2);
INSERT INTO empleado VALUES(3,'R6970642B','Adolfo','Rubio','Flores',3);
INSERT INTO empleado VALUES(4,'77705545E','Adri�n','Su�rez',NULL,4);
INSERT INTO empleado VALUES(5,'17087203C','Marcos','Loyola','M�ndez',5);
INSERT INTO empleado VALUES(6,'38382980M','Mar�a','Santana','Moreno',1);
INSERT INTO empleado VALUES(7,'80576669X','Pilar','Ruiz',NULL,2);
INSERT INTO empleado VALUES(8,'71651431Z','Pepe','Ruiz','Santana',3);
INSERT INTO empleado VALUES(9,'56399183D','Juan','G�mez','L�pez',2);
INSERT INTO empleado VALUES(10,'46384486H','Diego','Flores','Salas',5);
INSERT INTO empleado VALUES(11,'67389283A','Marta','Herrera','Gil',1);
INSERT INTO empleado VALUES(12,'41234836R','Irene','Salas','Flores',NULL);
INSERT INTO empleado VALUES(13,'82635162B','JuanAntonio','S�ez','Guerrero',NULL);
COMMIT;
