

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda;
SHOW DATABASES;

CREATE TABLE fabricante(
  id int PK,
  nombre varchar
);

Select * from fabricante

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

CREATE TABLE producto(
  id number,
  nombre VARCHAR,
  precio FLOAT,
  id_fabricante INT FK
);

Select * from producto;

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

CREATE TABLE public.fabricante (
id_fabricante bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
-- id_fabricante int8 NOT NULL,
nombre_fabricante varchar NOT NULL,
CONSTRAINT fabricante_pk PRIMARY KEY (id_fabricante)
);

CREATE TABLE public.producto (
id_producto bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
-- id_producto int8 NOT NULL,
nombre_producto varchar NOT NULL,
precio numeric NOT NULL,
id_fabricante int8 NOT NULL,
CONSTRAINT producto_pk PRIMARY KEY (id_producto),
CONSTRAINT producto_fk FOREIGN KEY (id_fabricante) REFERENCES public.fabricante(id_fabricante) ON DELETE CASCADE ON UPDATE CASCADE
);

--Ejercicios:
--1 -Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto

--2 -Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre, precio from producto

--3 -Lista todas las columnas de la tabla producto.
select * from producto

--4 -Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).

/*
5 -Lista el nombre de los productos, el precio en euros y el precio en dólares 
estadounidenses (USD). 
Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
*/
SELECT nombre as Nombre_de_Producto, precio as "USD", (precio * 1,09) AS "EUR" 
FROM producto;

--6 -Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio FROM producto

--7 -Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio FROM producto

--8 -Lista el nombre de todos los fabricantes en una columna, y en otra columna 
--obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre AS nombre_fabricante,
UPPER(SUBSTRING(nombre, 1, 2)) mayuscula_caracter
FROM fabricante

--9 -Lista los nombres y los precios de todos los productos de la tabla producto, 
--redondeando el valor del precio.
SELECT nombre, ROUND(precio) 
FROM producto

/*
10 -Lista los nombres y los precios de todos los productos de la tabla producto, 
truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
*/

SELECT nombre, TRUNC(precio) AS precio_truncado FROM producto;


--11 -Lista el identificador de los fabricantes que tienen productos en la tabla producto.
SELECT fabricante.id FROM fabricante as fabricante
LEFT JOIN producto p
on fabricante.id = producto.id_fabricante


--12 -Lista el identificador de los fabricantes que tienen productos en la tabla producto, 
--eliminando los identificadores que aparecen repetidos.
SELECT DISTINCT fabricante.id as id_unico
FROM fabricante as f
INNER JOIN producto p
on f.id = p.id_fabricante

--13 -Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante
ORDER BY nombre ASC

--14 -Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante
ORDER BY nombre desc

/*
15 -Lista los nombres de los productos ordenados en primer lugar por el nombre 
de forma ascendente y en segundo lugar por el precio de forma descendente.
*/
SELECT nombre AS Nombre_Producto,
	   precio AS precio_producto
FROM producto
ORDER BY nombre_Producto ASC, precio_producto DESC 

--16 -Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT nombre AS "Nombre Fabricante"
FROM fabricante
LIMIT 5

/*
17 -Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. 
La cuarta fila también se debe incluir en la respuesta.
*/
SELECT id, nombre AS "Nombre Fabricante"
FROM fabricante
LIMIT 2 OFFSET 3

/*
18 -Lista el nombre y el precio del producto más barato. 
(Utilice solamente las cláusulas ORDER BY y LIMIT)
*/
SELECT nombre AS "Nombre Producto", precio
FROM producto
ORDER BY precio ASC
LIMIT 1

/*
19 -Lista el nombre y el precio del producto más caro. 
(Utilice solamente las cláusulas ORDER BY y LIMIT)
*/
SELECT nombre AS "Nombre Producto", 
	   precio
FROM producto
ORDER BY precio DESC
LIMIT 1

/*
20 -Lista el nombre de todos los productos del fabricante cuyo identificador 
de fabricante es igual a 2.
*/
SELECT nombre
FROM producto p
WHERE id_fabricante = 2

--21 -Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre, as precio
FROM producto
WHERE (precio * 1.09) <= 120

--22 -Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre, precio
FROM producto
WHERE (precio * 1.09) >= 400


--23 -Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre, precio
FROM producto
WHERE precio <= 400

/*
24 -Lista todos los productos que tengan un precio entre 80€ y 300€. 
Sin utilizar el operador BETWEEN.
*/
SELECT nombre, precio
FROM producto
WHERE precio >= 80 AND precio <= 300

/*
25 -Lista todos los productos que tengan un precio entre 60€ y 200€. 
Utilizando el operador BETWEEN.
*/
SELECT nombre, precio
FROM producto
WHERE (precio * 1.09) BETWEEN 60 AND 200

/*
26 -Lista todos los productos que tengan un precio mayor que 200€ y 
que el identificador de fabricante sea igual a 6.
*/
SELECT nombre, precio, id_fabricante
FROM producto
WHERE (precio * 1.09) > 200 AND id_fabricante = 6

/*
27 -Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. 
Sin utilizar el operador IN.
*/
SELECT * 
FROM producto
WHERE (id_fabricante = 1) OR (id_fabricante = 3) OR (id_fabricante = 5)
ORDER  BY id_fabricante ASC

/*
28 -Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. 
Utilizando el operador IN.
*/
SELECT * FROM producto
WHERE id_fabricante IN (1, 3, 5)

/*
29 -Lista el nombre y el precio de los productos en céntimos 
(Habrá que multiplicar por 100 el valor del precio). 
Cree un alias para la columna que contiene el precio que se llame céntimos.
*/
SELECT nombre, (precio*100) as precio_centimos
FROM producto


--30 -Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante
WHERE nombre LIKE 'S%' 

--31 -Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante
WHERE nombre LIKE '%e'


--32 -Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante
WHERE nombre LIKE '%w%'

--33 -Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante
WHERE CHAR_LENGTH(nombre) = 4
 
/*
34 -Devuelve una lista con el nombre de todos los productos que contienen la cadena 
Portátil en el nombre.
*/
SELECT nombre FROM producto
WHERE nombre LIKE '%Portátil%'

/*
35 -Devuelve una lista con el nombre de todos los productos que contienen la cadena 
Monitor en el nombre y tienen un precio inferior a 215 €.
*/
SELECT nombre, precio 
FROM producto
WHERE nombre LIKE '%Monitor%' AND (precio * 1.09) < 215

/*
36 -Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
Ordene el resultado en primer lugar por el precio (en orden descendente) 
y en segundo lugar por el nombre (en orden ascendente).
*/

SELECT nombre, precio
FROM producto
WHERE (precio * 1.09) >= 180
ORDER BY precio DESC, nombre;