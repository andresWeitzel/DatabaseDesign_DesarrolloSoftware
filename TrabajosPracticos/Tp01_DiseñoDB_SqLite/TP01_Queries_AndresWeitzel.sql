/* ----------------------------
 * -- TP01 DISEÑO DB SQLITE---
 * ----------------------------
 * 
 * 
 * ========= QUERIES =============
 */

/*
-- Tablas
SELECT * FROM sqlite_master WHERE type = "table";


-- 1) Escribir el comando para listar los nombres
-- de clientes y su dirección, ordenado por el nombre 
-- de cliente.

select * from Clientes;

select cliente_nombre, cliente_direccion from Clientes
order by cliente_nombre;


-- 2) Escribir el comando para listar los nombres 
-- de proveedores y su país, ordenado por el país.

select * from Proveedores;

select proveedor_nombre, proveedor_pais from Proveedores
order by proveedor_pais;


-- 3)Escribir el comando para listar, de la tabla 
-- Orden_Items, todos los Producto_ID y su precio 
-- donde la cantidad pedida sea mayor a 100
-- Tablas

SELECT * FROM sqlite_master WHERE type = "table";
select * from Orden_Items;

select producto_ID, item_precio from Orden_Items
where cantidad > 100;


-- 4) Escribir el comando para listar todos los
-- productos con un precio inferior a 3.

SELECT * FROM sqlite_master WHERE type = "table";
select * from Productos;

select * from Productos where producto_precio < 3.00;



-- 5) También puede utilizar los siguientes operadores. 
-- Identifique la función de cada uno: La Finalidad de 
-- cada uno??

-- = Asignación
-- != Diferente que..
-- < Menor que..
-- > Mayor que..
-- <= Menor Igual que..
 

-- ¿¿6) Listar los nombre de producto y precio del proveedor 
-- DLL01 y de precio menor a 4???

-- Enunciado mal redactado..

-- 6) Listar nombre y precio del producto cuyo id de proveedor
-- sea DLL01 y el precio del producto menor a 7.

SELECT * FROM sqlite_master WHERE type = "table";
select * from Proveedores;
select * from Productos;


select producto_nombre,producto_precio from Productos
where proveedor_ID = 'DLL01' and producto_precio < 4;





-- 7) Listar los nombre de producto y precio de los 
-- proveedores BRS01 y FNG01.

SELECT * FROM sqlite_master WHERE type = "table";
select * from Proveedores;
select * from Productos;


select producto_nombre,producto_precio from Productos
where proveedor_ID = 'DLL01' or proveedor_ID = 'FNG01';


-- 8) Listar los nombres de productos con un precio 
-- entre 4 y 10.

SELECT * FROM sqlite_master WHERE type = "table";
select * from Productos;


select producto_nombre from Productos
where producto_precio >= 4 and producto_precio <= 10;




--9) Investigar con la bibliografía recomendada o 
-- en internet las sentencias IN y BETWEEN.

-- Rescribir el comando de la respuesta 7) utilizando 
-- la sentencia IN.

SELECT * FROM sqlite_master WHERE type = "table";
select * from Productos;


select producto_nombre,producto_precio from Productos
where proveedor_ID in ('DLL01','FNG01');


-- Rescribir el comando de la respuesta 8) utilizando
-- la sentencia BETWEEN.

select producto_nombre from Productos
where producto_precio BETWEEN 4 and 10;


-- 10) Listar el nombre y precio de todos los productos
-- de peluche

SELECT * FROM sqlite_master WHERE type = "table";
select * from Productos;


select producto_nombre, producto_precio from Productos
where producto_nombre like '%peluche%'


*/

-- 11) Listar el nombre y precio de todos los osos de 
-- la tabla de productos.

SELECT * FROM sqlite_master WHERE type = "table";
select * from Productos;


select producto_nombre, producto_precio from Productos
where producto_nombre like '%oso%'










