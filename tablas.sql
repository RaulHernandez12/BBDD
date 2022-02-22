/* Modelo relacional

Producto ( Codigo, descripcion, existencias, precio)
Cliente (Codigo, nombre, apellidos, direccion, telefono)
Proveedor (Codigo, nombre, apellidos,direccion, telefono)
Compra (fecha_compra, codigo_producto, codigo_cliente)
Suministra ( Codigo_producto, Codigo_proveedor)

*/

/*1.CREAMOS LAS TABLAS

CREATE TABLE PRODUCTO(
Codigo_producto VARCHAR2(4),
Descripcion VARCHAR2(200) NOT NULL,
Existencias INT NOT NULL,
Precio FLOAT,
CONSTRAINT pk_codProducto PRIMARY KEY(Codigo_producto)

);


CREATE TABLE CLIENTE(
Codigo_cliente VARCHAR2(4),
Nombre VARCHAR2(20),
Apellidos VARCHAR2(100),
Direccion VARCHAR2(100),
Telefono INT UNIQUE,
CONSTRAINT pk_codCliente PRIMARY KEY(Codigo_cliente)
);

CREATE TABLE PROVEEDOR(
Codigo_proveedor VARCHAR2(4),
Nombre VARCHAR2(20),
Apellidos VARCHAR2(100),
Direccion VARCHAR2(100),
Telefono INT,
CONSTRAINT pk_codProveedor PRIMARY KEY(Codigo_proveedor)
);

CREATE TABLE COMPRA(
Fecha_compra date,
Codigo_producto VARCHAR2(4),
Codigo_cliente VARCHAR2(4)
);

CREATE TABLE SUMINISTRA(
Codigo_producto VARCHAR2(4),
Codigo_proveedor VARCHAR2(4)

);
*/