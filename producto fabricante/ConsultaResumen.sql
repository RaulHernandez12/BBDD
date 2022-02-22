--1. Calcula el n�mero total de productos que hay en la tabla producto
SELECT COUNT(*) FROM PRODUCTO;

--2.Calcula el n�mero total de fabricantes que hay en la tabla fabricante
SELECT COUNT (*) FROM FABRICANTE;

--3. Calcula el n�mero de valores distintos de c�digo de fabricante aparecen en la tabla productos.
SELECT COUNT ( DISTINCT(PRODUCTO.CODIGO_FABRICANTE)) FROM PRODUCTO;

--4.Calcula la media del precio de todos los productos
SELECT AVG (PRODUCTO.PRECIO) FROM PRODUCTO;

--5.Calcula el precio m�s barato de todos los productos.
SELECT MIN (PRODUCTO.PRECIO) FROM PRODUCTO ;

--6.Calcula el precio m�s caro de todos los productos
SELECT MAX (PRODUCTO.PRECIO) FROM PRODUCTO ;

--7.Lista el nombre y el precio del producto m�s barato.
SELECT PRODUCTO.NOMBRE,  PRODUCTO.PRECIO FROM PRODUCTO ORDER BY PRECIO ASC;

--8.Lista el nombre y el precio del producto m�s caro
SELECT PRODUCTO.NOMBRE,  PRODUCTO.PRECIO FROM PRODUCTO ORDER BY PRECIO DESC;

--9.Calcula la suma de los precios de todos los producto.
SELECT SUM(PRODUCTO.PRECIO) FROM PRODUCTO;

--10.CALCULA EL N�MERO DE PRODUCTOS QUE TIENE EL FABRICANTE ASUS
SELECT COUNT (PRODUCTO.CODIGO) FROM PRODUCTO,FABRICANTE
WHERE (PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO)
AND FABRICANTE.NOMBRE IN ('Asus');

--11.Calcula la media del precio de todos los productos del fabricante Asus

SELECT AVG(PRODUCTO.PRECIO) FROM PRODUCTO,FABRICANTE
WHERE (PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO)
AND FABRICANTE.NOMBRE IN ('Asus');

SELECT (PRODUCTO.PRECIO) FROM PRODUCTO,FABRICANTE
WHERE (PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO)
AND FABRICANTE.NOMBRE IN ('Asus');--AQUI TENEMOS EL PRECIO DE LOS PRODUCTOS ASUS

--12.Calcula el precio mas barato de todos los productos del fabricante Asus
SELECT min(PRODUCTO.PRECIO) FROM PRODUCTO,FABRICANTE
WHERE (PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO)
AND FABRICANTE.NOMBRE = ('Asus');

--13.Calcula el precio m�s caro de todos los productos del fabricante Asus.

SELECT MAX(PRODUCTO.PRECIO) FROM PRODUCTO,FABRICANTE
WHERE (PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO)
AND FABRICANTE.NOMBRE = ('Asus');

--14.Calcula la suma de todos los productos del fabricante Asus

SELECT SUM(PRODUCTO.PRECIO) FROM PRODUCTO,FABRICANTE
WHERE (PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO)
AND FABRICANTE.NOMBRE IN ('Asus');

--15.Muestra el precio max, min , medio y el numero total de productos que tiene el fabricante crucial

SELECT MIN(PRODUCTO.PRECIO), MAX(PRODUCTO.PRECIO), AVG(PRODUCTO.PRECIO), COUNT(PRODUCTO.CODIGO) FROM PRODUCTO,FABRICANTE
WHERE (PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO)
AND FABRICANTE.NOMBRE IN ('Crucial');

/*16.Muestra el n�mero total de productos que tiene cada uno de los fabricantes. El listado tambi�n debe incluir los fabricantes que no tienen ning�n producto.
El resultado mostrar� dos columnas, una con el nombre del fabricante y otra con el n�mero de productos que tiene. Ordene el resultado desc por el n�mero del producto.*/

SELECT  COUNT(PRODUCTO.CODIGO) AS "total productos", fabricante.nombre, FABRICANTE.CODIGO FROM PRODUCTO RIGHT JOIN FABRICANTE  
ON (PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO) 
GROUP BY FABRICANTE.NOMBRE, FABRICANTE.CODIGO;

SELECT * FROM PRODUCTO;
SELECT * FROM FABRICANTE;

/*17..Muestra el precio m�ximo, precio m�nimo y precio medio de los productos de
cada uno de los fabricantes. El resultado mostrar� el nombre del fabricante junto
con los datos que se solicitan.*/

SELECT MIN(PRODUCTO.PRECIO), MAX(PRODUCTO.PRECIO), AVG(PRODUCTO.PRECIO), (FABRICANTE.NOMBRE) FROM PRODUCTO,FABRICANTE
WHERE (PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO)
GROUP BY FABRICANTE.NOMBRE;

/*18..Muestra el precio m�ximo, precio m�nimo, precio medio y el n�mero total de
productos de los fabricantes que tienen un precio medio superior a 200�. No es 
necesario mostrar el nombre del fabricante, con el c�digo del fabricante es
suficiente.*/

SELECT MIN(PRODUCTO.PRECIO), MAX(PRODUCTO.PRECIO), AVG(PRODUCTO.PRECIO), (FABRICANTE.CODIGO) FROM PRODUCTO,FABRICANTE
WHERE (PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO)
GROUP BY  FABRICANTE.CODIGO HAVING AVG(PRODUCTO.PRECIO)>200;

/*19..Muestra el nombre de cada fabricante, junto con el precio m�ximo, precio
m�nimo, precio medio y el n�mero total de productos de los fabricantes que
tienen un precio medio superior a 200�. Es necesario mostrar el nombre del
fabricante.*/

SELECT MIN(PRODUCTO.PRECIO), MAX(PRODUCTO.PRECIO), AVG(PRODUCTO.PRECIO), (FABRICANTE.NOMBRE) FROM PRODUCTO,FABRICANTE
WHERE (PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO)
GROUP BY  FABRICANTE.NOMBRE HAVING AVG(PRODUCTO.PRECIO)>200;

/*20.Calcula el n�mero de productos que tienen un precio mayor o igual a 180�.*/

SELECT COUNT(PRODUCTO.CODIGO) FROM PRODUCTO WHERE PRECIO >= 180;

/*21.Calcula el n�mero de productos que tiene cada fabricante con un precio mayor o
igual a 180�.*/

SELECT COUNT(PRODUCTO.CODIGO), FABRICANTE.NOMBRE FROM PRODUCTO
WHERE (PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO)
GROUP BY FABRICANTE.NOMBRE HAVING PRECIO >= 180;