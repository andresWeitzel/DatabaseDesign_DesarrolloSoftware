/* ----------------------------
 * -- TP02 DISE�O DB SQLITE---
 * ----------------------------
 * 
 * 
 * ========= QUERIES =============
 */

/*
-- Tablas
SELECT * FROM sqlite_master WHERE type = "table";


-- 1) Escribir el comando para listar los nombres
-- de clientes y su direcci�n, ordenado por el nombre 
-- de cliente.

select * from Clientes;

select cliente_nombre, cliente_direccion from Clientes
order by cliente_nombre;


-- 2) Escribir el comando para listar los nombres 
-- de proveedores y su pa�s, ordenado por el pa�s.

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



-- 5) Tambi�n puede utilizar los siguientes operadores. 
-- Identifique la funci�n de cada uno: La Finalidad de 
-- cada uno??

-- = Asignaci�n
-- != Diferente que..
-- < Menor que..
-- > Mayor que..
-- <= Menor Igual que..
 

*/