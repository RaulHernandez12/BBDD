--1.Hacer una  consulta que  muestre el  código  y  el  nombre  del  departamento, sólo de aquellos departamentos que tienen empleados.

SELECT DEPARTAMENTO.NOMBRE, DEPARTAMENTO.CODIGO FROM DEPARTAMENTO, EMPLEADO 
WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO;

/*2.Devuelve  un  listado  con el  código,  el  nombre  del  departamento  y  el  valor  del presupuesto  actual  del  que  dispone,  
solamente  de  aquellos  departamentos  que tienen empleados. El valor del presupuesto actualse calcula restando presupuesto y gastos.*/

SELECT DEPARTAMENTO.CODIGO, DEPARTAMENTO.NOMBRE, DEPARTAMENTO.PRESUPUESTO - DEPARTAMENTO.GASTOS AS "PRESUPUESTO ACTUAL" FROM EMPLEADO, DEPARTAMENTO
WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO;

--3.Devuelve  el  nombre  del  departamento  donde  trabaja  el  empleado  que  tiene  el NIF 38382980M.

SELECT DEPARTAMENTO.NOMBRE FROM DEPARTAMENTO, EMPLEADO
WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
AND NIF='38382980M';

--4.Mostrar el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.

SELECT DEPARTAMENTO.NOMBRE FROM DEPARTAMENTO, EMPLEADO
WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
AND EMPLEADO.NOMBRE = 'Pepe' AND EMPLEADO.APELLIDO1='Ruiz' AND EMPLEADO.APELLIDO2= 'Santana';

--5.Mostrar un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.

SELECT EMPLEADO.NOMBRE , DEPARTAMENTO.NOMBRE FROM  DEPARTAMENTO, EMPLEADO
WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
AND DEPARTAMENTO.NOMBRE = 'I+D' ORDER BY EMPLEADO.NOMBRE ASC;

--6.Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas,Contabilidado I+D. Ordena el resultado alfabéticamente.

SELECT EMPLEADO.NOMBRE , DEPARTAMENTO.NOMBRE FROM  DEPARTAMENTO, EMPLEADO
WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
AND DEPARTAMENTO.NOMBRE IN ('Sistemas','Contabilidad','I+D') ORDER BY EMPLEADO.NOMBRE ASC;

--7.Devuelve  una  lista  con  el  nombre  de  los  empleados  que  tienen  los  departamentos que no tienen un presupuesto entre 100000 y 200000 euros.

SELECT EMPLEADO.NOMBRE FROM  DEPARTAMENTO, EMPLEADO
WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
AND  NOT (PRESUPUESTO BETWEEN  100000 AND 200000);

/*8.Hacer  una  consulta  que  muestre todos  los  empleados junto  con  los  datos  de  los departamentos donde trabajan. 
Este listado también debe incluir los empleados que no tienen ningún departamento asociado.*/

SELECT EMPLEADO.NOMBRE, DEPARTAMENTO.* FROM  DEPARTAMENTO RIGHT JOIN EMPLEADO
ON DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO;

--9.Queremos  un listado  donde   sólo   aparezcan empleados   que  no  tienen  ningún departamento asociado.

SELECT EMPLEADO.NOMBRE, DEPARTAMENTO.* FROM  DEPARTAMENTO RIGHT JOIN EMPLEADO
ON DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO 
WHERE DEPARTAMENTO.CODIGO IS NULL;

--10.Devuelve  un  listado  donde  sólo  aparezcan  aquellos  departamentos  que  no  tienen ningún empleado asociado.

SELECT EMPLEADO.NOMBRE AS "Nombre empleado", DEPARTAMENTO.NOMBRE AS "Nombre departamento" FROM  DEPARTAMENTO LEFT JOIN EMPLEADO
ON DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO 
WHERE EMPLEADO.CODIGO IS NULL;

--11.Calcula   la   suma   del   presupuesto y   la   media   del   presupuesto de   todos   los departamentos.

SELECT SUM(DEPARTAMENTO.PRESUPUESTO) AS "SUMA PRESUPUESTO", ROUND (AVG(DEPARTAMENTO.PRESUPUESTO)) AS "MEDIA PRESUPUESTO REDONDEADO" FROM DEPARTAMENTO;

--12.Calcula el número total de empleados que hay en la tabla empleado.

SELECT COUNT(EMPLEADO.CODIGO) FROM EMPLEADO;

--13.Calcula el número de empleados que no tienen NULL en su segundo apellido.

SELECT COUNT(EMPLEADO.CODIGO) FROM EMPLEADO WHERE NOT (EMPLEADO.APELLIDO2) IS NULL;

--14.Calcula el número de empleados que hay en cada departamento. Tienes que mostrar una columna con  el  nombre  del  departamento  y  otra  con  el  número  de  empleados que tiene asignados.

SELECT COUNT(EMPLEADO.CODIGO),DEPARTAMENTO.NOMBRE FROM  DEPARTAMENTO, EMPLEADO
WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
GROUP BY DEPARTAMENTO.NOMBRE;

/*15.Calcula  el  nombre  de  los  departamentos  que  tienen  más  de  2  empleados. 
Debes mostrar  una  columna con  el  nombre  del  departamento  y  otra  con  el  número  de empleados que tiene asignados.*/

SELECT COUNT(DEPARTAMENTO.NOMBRE), DEPARTAMENTO.NOMBRE FROM  DEPARTAMENTO, EMPLEADO
WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
GROUP BY DEPARTAMENTO.NOMBRE HAVING COUNT (EMPLEADO.NOMBRE) >2; 

/*16.Calcula el número de empleados que trabajan en cada uno de los departamentos.
El resultado de esta consulta también tiene que incluir aquellos departamentos 
que no tienen ningún empleado asociado.*/

SELECT COUNT(EMPLEADO.CODIGO),DEPARTAMENTO.NOMBRE FROM EMPLEADO RIGHT JOIN DEPARTAMENTO
ON DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
GROUP BY DEPARTAMENTO.NOMBRE;

/*17.Calcula el número de empleados que trabajan en cada uno de los departamentos que tienen un presupuesto mayor a 200000 euros*/

SELECT COUNT(EMPLEADO.CODIGO), DEPARTAMENTO.NOMBRE FROM DEPARTAMENTO, EMPLEADO
WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
AND DEPARTAMENTO.PRESUPUESTO > 200000 GROUP BY DEPARTAMENTO.NOMBRE;

-- SUBCONSULTAS --

--1.Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. 

SELECT EMPLEADO.NOMBRE, DEPARTAMENTO.NOMBRE FROM DEPARTAMENTO, EMPLEADO
WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
AND DEPARTAMENTO.NOMBRE = 'Sistemas';

SELECT EMPLEADO.NOMBRE FROM EMPLEADO WHERE CODIGO_DEPARTAMENTO = (SELECT DEPARTAMENTO.CODIGO FROM DEPARTAMENTO WHERE NOMBRE='Sistemas');

--2.Devuelve  el  nombre  del  departamento  con  mayor  presupuesto  y la  cantidad  que  tiene asignada.

SELECT DEPARTAMENTO.NOMBRE FROM DEPARTAMENTO WHERE DEPARTAMENTO.PRESUPUESTO =(SELECT MAX (DEPARTAMENTO.PRESUPUESTO) FROM DEPARTAMENTO );

--3.Devuelve  el  nombre  del  departamento  con  menor  presupuesto  y  la  cantidad  que  tiene asignada. Sin hacer uso de MIN,ORDER BY

SELECT NOMBRE FROM DEPARTAMENTO WHERE PRESUPUESTO <= ALL (SELECT PRESUPUESTO FROM DEPARTAMENTO);

--4.Devuelve los nombres de los departamentos que tienen empleados asociados. 

SELECT NOMBRE FROM DEPARTAMENTO WHERE DEPARTAMENTO.CODIGO = ANY (SELECT CODIGO_DEPARTAMENTO FROM EMPLEADO);

--5.Devuelve los nombres de los departamentos que no tienen empleados asociados. 








