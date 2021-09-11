/* ----------------------------
 * -- TP01 DISEÑO DB SQLITE---
 * ----------------------------
 * 
 * 
 * ========= QUERIES =============
 */


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

-- Inciso poco entendible..

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
where producto_nombre like '%peluche%';



-- 11) Listar el nombre y precio de todos los osos de 
-- la tabla de productos.

SELECT * FROM sqlite_master WHERE type = "table";
select * from Productos;


select producto_nombre, producto_precio from Productos
where producto_nombre like '%oso%';



-- 12)Ahora nos solicitan hacer una lista de precios de 
-- los productos con el precio por menor y por mayor. 
-- El precio por menor es el cargado en la base de datos, 
-- y el precio por mayor tiene un descuento del 10%. Listar
-- todos los productos con su nombre, precio por menor y precio por 
-- mayor, nombrar el campo precio por menor: precio_menor y el precio
-- por mayor: precio_mayor.

SELECT * FROM sqlite_master WHERE type = "table";
select * from Productos;


select *
, producto_precio as precio_por_menor
, (producto_precio - (producto_precio * 10)/100) as precio_por_mayor 
from Productos;


-- 13) Ahora nos solicitan realizar la misma lista, pero el precio
 -- de la base de datos es el precio por mayor,y el precio por menor es un 25% mayor.

SELECT * FROM sqlite_master WHERE type = "table";
select * from Productos;


select *
, producto_precio as precio_por_mayor
, (producto_precio + (producto_precio * 25)/100) as precio_por_menor 
from Productos;


-- 14) 
-- max() --> Valor Máximo
-- min() --> Valor Mínimo
-- count() --> Cantidad de Valores
-- sum() --> Suma de Valores
-- avg() --> Promedio de Valores



-- 15) Contar la cantidad de ítems pedidos de la orden de compra 
-- nro. 20005. Para esto van a tener que buscar en la tabla Orden_Items 
-- y sumar todos los campos cantidad de la orden de compra 20005 
-- (van a tener que combinar el comando SELECT con WHERE).

-- sumar todos los campos cantidad?? Poco entendible este inciso, anexo 2 respuestas...

SELECT * FROM sqlite_master WHERE type = "table";
select * from Orden_Items;



-- 15) Cantidad de Registros cuyo numero de orden sea el 20005    

select count(cantidad) as cantidad_registros from Orden_Items where orden_numero=20005;


-- 15) Cantidad de Ordenes cuyo numero de orden sea el 20005    

select sum(cantidad) as cantidad_ordenes from Orden_Items where orden_numero=20005;




-- 16) Calcular el precio total de la orden de compra Nro. 20005. Recordar que para 
-- calcular el precio total van a tener que hacer la suma de todos los productos de 
-- cantidad por Item_Precio .

SELECT * FROM sqlite_master WHERE type = "table";
select * from Orden_Items;


select * , (cantidad * item_precio) as precio_total_item   
from Orden_Items where orden_numero = 20005;



select orden_numero, sum(cantidad * item_precio) as precio_total_numero_orden   
from Orden_Items 
where orden_numero = 20005;



-- 17) Calcular la cantidad total a pedir (entre todas las órdenes de compra) 
-- del producto BNBG01.

SELECT * FROM sqlite_master WHERE type = "table";
select * from Orden_Items;

select producto_ID, sum(cantidad) from Orden_Items where producto_ID = 'BNBG01';