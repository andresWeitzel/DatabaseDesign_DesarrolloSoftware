/* ----------------------------
 * -- TP02 DISEÑO DB SQLITE---
 * ----------------------------
 * 
 * 
 * ========= DML =============
 */

/*

1) Se comunica un nuevo cliente, y deben agregarlo a la base de datos. Les envía la siguiente 
información. Escribir el (o los) comando(s) de SQL para ingresar al cliente en la base de datos.

Nombre: Star Toys Express
Dirección: 223 Main St, Auburndale, FL
CP: 33823
País: USA
Contacto: Jessie Wayland

*/

-- TABLAS
select * from sqlite_master where type = "table";

-- DESCRIPCION ESTRUCTURA DE TABLA
pragma table_info([Clientes]) ;

--DESCRIPCION DE TABLA
select * from Clientes;


insert into Clientes(cliente_ID, cliente_nombre, cliente_direccion, cliente_CP, Cliente_pais, Cliente_contacto) values
(
"1000000006","Star Toys Express", "223 Main St, Auburndale, FL", "33823", "USA", "Jessie Wayland"

);


/*

2) Acaba de llamar Kim Howard para realizar un pedido. Incorporar ala la base de datos el nuevo pedido. 
Escribir los comandos de SQL para incorporar el pedido a la base de datos. Los datos son los siguientes:

Contacto: Kim Howard
Fecha del pedido: 10/09/2021 (10 de septiembre de 2021)
Pedido: 
Producto: RYL01 Precio: 19.49 Cantidad: 10
Producto: RYL02 (ver el precio en la base de datos) Cantidad: 5
Producto: Camion de bombero (ver el código de la base de datos) Precio: 4.99 Cantidad: 10

*/


-- TABLAS
select * from sqlite_master where type = "table";

-- DESCRIPCION ESTRUCTURA DE TABLA
pragma table_info([Ordenes]) ;

pragma table_info([Orden_Items]) ;


--DESCRIPCION DE TABLA
select * from Productos;
select * from Orden_Items;
select * from Ordenes;
select * from Clientes;

select * from Clientes where Cliente_contacto = 'Kim Howard' ;

select * from Productos where producto_id ='RYL02';

select * from Productos where producto_nombre like '%Cam%';



-- El campo orden_item lleva mas a una confusion que eficiencia de administracion . Rompe todo paradigma y normalizacion
-- Si se modifica el id del producto u orden quien va a depurar estos registros? 
-- Ademas tiene declarada una constraint supongo de tipo check, asignare numeros grandes 
-- "para que el dba tome en cuenta esto..(guiño, guiño)"...quien diseño esta db??

insert into Orden_Items (orden_numero, orden_item, producto_ID, cantidad, item_precio) values
(20010, 1111111, "RYL01", 10, 19.49),
(20010, 11111112, "RYL02", 5, 19.49),
(20010, 111111114, "RGAN01", 10, 4.99);


select * from Orden_Items;
