/* ----------------------------
 * -- TP03 DISE�O DB SQLITE---
 * ----------------------------
 * 
 * 
 * ========= JOINS =============
 */

/*
 
   1)Escribir el comando para listar los nombres de productos y sus cantidades de la 
   orden de compra 20008. Como ayuda, pueden combinar un JOIN con WHERE.

*/

-- TABLAS
select * from sqlite_master where type = "table";


--DESCRIPCION DE TABLA
select * from Orden_Items;
select * from Ordenes;
select * from Productos;

-- DESCRIPCION ESTRUCTURA DE TABLA
 pragma table_info([Orden_Items]);


-- Sin Join Query Explicita
select Productos.producto_nombre, Orden_Items.cantidad from Productos, Orden_Items 
where Orden_Items.orden_numero =20008;

-- Sin Join Query Implicita
select producto_nombre, cantidad from Productos, Orden_Items 
where orden_numero =20008;


-- Con Join Query Explicita
select Productos.producto_nombre, Orden_Items.cantidad from Productos join Orden_Items 
where orden_numero =20008;


-- Con Join Query Implicita
select producto_nombre, cantidad from Productos join Orden_Items 
where orden_numero =20008;




/*
 
   2)Escribir el comando para listar los nombres de los clientes, el n�mero de 
   orden y la fecha.

*/

-- TABLAS
select * from sqlite_master where type = "table";


--DESCRIPCION DE TABLA
select * from Clientes;
select * from Ordenes;


-- DESCRIPCION ESTRUCTURA DE TABLA
 pragma table_info([Ordenes]);

-- Sin Join Query Explicita
select Clientes.cliente_nombre, Ordenes.orden_numero, Ordenes.orden_fecha 
from Clientes, Ordenes 
where Clientes.cliente_ID = Ordenes.cliente_ID;

-- Sin Join Query Implicita
select cliente_nombre, orden_numero, orden_fecha 
from Clientes, Ordenes 
where Clientes.cliente_ID = Ordenes.cliente_ID;




-- Con Join Query Explicita
select Clientes.cliente_nombre, Ordenes.orden_numero, Ordenes.orden_fecha 
from Clientes join Ordenes 
where Clientes.cliente_ID = Ordenes.cliente_ID;


-- Con Join Query Implicita
select cliente_nombre, orden_numero, orden_fecha 
from Clientes join Ordenes 
using(cliente_ID);




/*
 
   3)Escribir el comando para listar los nombres de los proveedores con el total de 
   productos que tiene

*/

-- TABLAS
select * from sqlite_master where type = "table";


--DESCRIPCION DE TABLA
select * from Proveedores;
select * from Productos;


-- DESCRIPCION ESTRUCTURA DE TABLA
 -- pragma table_info([Ordenes]);

-- Sin Join Query Explicita
select proveedor_nombre, producto_ID, count(producto_ID) as cantidad_de_productos 
from Proveedores, Productos
where Proveedores.proveedor_ID = Productos.proveedor_ID 
group by proveedor_nombre ;

-- Con Join Query Implicita
select proveedor_nombre, producto_ID, count(producto_ID) as cantidad_de_productos
from Proveedores join Productos
using(proveedor_ID)
group by proveedor_nombre ;



/*

 	--Comando A--
 	
 	SELECT Cliente_nombre, (SELECT COUNT(*) FROM Ordenes WHERE 
	Clientes.cliente_id=ordenes.cliente_id) AS Ordenes FROM Clientes; 
 
 	--Comando B--
 	
 	SELECT Cliente_nombre, COUNT(*) AS Total_Ordenes FROM Clientes JOIN 
	Ordenes USING (cliente_id) GROUP BY cliente_id;


   4)Cu�l es la diferencia en el resultado de utilizar el comando A) y el B)? �Cu�l es m�s conveniente 
	utilizar?
	
	
*/

/*
 	En el comando A se acepta el Cero como contable y en B no, ya que se aplica el Group By.
	La conveniencia de uso est� directamente relacionado con el contexto aplicable.
*/





/*
  5) Reescribir el comando del punto 3 utilizando la CLAUSULA JOIN

*/

--  Join Query Implicita
select proveedor_nombre, producto_ID, count(producto_ID) as cantidad_de_productos
from Proveedores join Productos
using(proveedor_ID)
group by proveedor_nombre ;





/*
  6) �Cu�l es la diferencia en el resultado entre el comando B) y el comando C)

  
   	--Comando B--
 	
 	SELECT Cliente_nombre, COUNT(*) AS Total_Ordenes FROM Clientes JOIN 
	Ordenes USING (cliente_id) GROUP BY cliente_id;

  
	--Comando C--
	
	  SELECT Cliente_nombre, COUNT(*) AS Total_Ordenes FROM Clientes JOIN 
	  Ordenes USING (cliente_id) GROUP BY cliente_nombre;


�Por qu�?

*/

/*
El comando B aplica la agrupacion por id y el comando C por nombre. Si se
visualiza la descipcion de campos de la tabla Clientes se obtiene...

cid	name		type				notnull	pk	
0	cliente_ID	char(10)			1		1
1	cliente_nombre	char(50)		1		0
2	cliente_direccion	char(50)	0		0
3	cliente_ciudad	char(50)		0		0
4	Cliente_provincia	char(5)		0		0
5	cliente_CP	char(10)			0		0
6	Cliente_pais	char(50)		0		0
7	Cliente_contacto	char(50)	0		0
8	Cliente_email	char(255)		0		0

..que la PK es el id, por ende es condicion de arquitectura que la misma
no aplique duplicidad de valores. 

**/





/*
  7) Utilizando la bibliograf�a, describa las diferencias y similitudes entre 
  
  JOIN VS NATURAL JOIN
  
  JOIN VS LEFT JOIN
  
  
  
  
  T�cnicamente hablando ser�a el nombre de cla�sula INNER JOIN, ya que si se utiliza
  solo el JOIN sin un LEFT, RIGHT, ETC, por defecto se asigna INNER.
  NATURAL JOIN al igual que INNER JOIN son operaciones JOIN.
  
  
  --INNER JOIN VS NATURAL JOIN--
  
INNER JOIN: Devuelve las coincidencias entre 2 tablas(si existen), en funci�n a una columna
 que tienen en com�n.  De tal modo que s�lo la intersecci�n se mostrar� en los resultados.


 NATURAL JOIN: A diferencia del Inner Join, para esta variante la condici�n de uni�n est�
 implicita en la columna com�n de ambas tablas.
 Las columnas comunes son columnas que tienen el mismo nombre en ambas tablas.

  
 
 La similitud es el conjunto de datos intersecci�n que tienen en com�n aplicando Inner Join o
 Natural Join, la diferencia m�s notable es la declaraci�n de la consulta de forma impl�cita/expl�cita.
 
 
 
 Aplicando Natural Join --> select * from table1 natural join table2;
 
 Aplicando Inner Join --> select t1.* from table1 t1 inner join table2 t2 
 on t1.a = t2.a and t1.b = t2.b;
 
 
 

 
  
  --INNER JOIN VS LEFT JOIN--
  
  INNER JOIN: Devuelve las coincidencias entre 2 tablas(si existen), en funci�n a una columna
 que tienen en com�n.  De tal modo que s�lo la intersecci�n se mostrar� en los resultados.

  
  LEFT JOIN:A diferencia de un INNER JOIN, donde se busca una intersecci�n respetada por 
  ambas tablas, con LEFT JOIN damos prioridad a la tabla de la izquierda, y buscamos en la 
  tabla derecha.
Si no existe ninguna coincidencia para alguna de las filas de la tabla de la izquierda, de igual 
forma todos los resultados de la primera tabla se muestran. La similitud m�s notable es la igualdad 
de la declaraci�n de la consulta, sea semiExpl�cita o Expl�cita. La diferencia es la respuesta de la 
consulta junto con los registros deseados.

Aplicando Left Join --> select t1.* from table t1 left join table2 t2
on t1.a = t2.a and t1.b = t2.b;


Aplicando Inner Join --> select t1.* from table1 t1 inner join table2 t2 
 on t1.a = t2.a and t1.b = t2.b;

*/






/*
 
   8) Escribir el comando para listar Nombre del cliente, 
   N�mero de Orden y el Precio total de la orden (la suma de Item_precio por cantidad)
 
*/

-- TABLAS
select * from sqlite_master where type = "table";


--DESCRIPCION DE TABLA
select * from Clientes;
select * from Ordenes;
select * from Orden_Items;


-- DESCRIPCION ESTRUCTURA DE TABLA
 -- pragma table_info([Ordenes]);


select Clientes.cliente_nombre, Ordenes.orden_numero
, SUM(Orden_Items.item_precio * Orden_Items.cantidad) as precio_total_por_orden
from Clientes
join Ordenes on Clientes.cliente_ID = Ordenes.cliente_ID 
join Orden_Items on Ordenes.orden_numero = Orden_Items.orden_numero
group by Clientes.cliente_ID ;






/*
 
   9) Escribir el comando para listar Nombre del proveedor, nombre del producto y la cantidad total a 
pedir entre todas las �rdenes de compra. Si se animan, ordenar el listado por proveedor.
 
*/


-- TABLAS
select * from sqlite_master where type = "table";


--DESCRIPCION DE TABLA
select * from Proveedores;
select * from Productos;
select * from Ordenes;
select * from Orden_Items;


-- DESCRIPCION ESTRUCTURA DE TABLA
 -- pragma table_info([Ordenes]);


select Proveedores.proveedor_nombre, Productos.producto_nombre 
, SUM(Orden_Items.cantidad)as cantidad_total_por_orden
from Proveedores
join Productos on Proveedores.proveedor_ID = Productos.proveedor_ID 
join Orden_Items on Productos.producto_ID = Orden_Items.producto_ID 
group by Proveedores.proveedor_nombre ;


/*
 
   10)  Escribir el comando para listar Fecha de la orden, Numero de orden,
    Numero de �tem, Nombre del producto y cantidad
 
*/

-- TABLAS
select * from sqlite_master where type = "table";


--DESCRIPCION DE TABLA
select * from Productos;
select * from Ordenes;
select * from Orden_Items;


-- DESCRIPCION ESTRUCTURA DE TABLA
 -- pragma table_info([Ordenes]);


select Ordenes.orden_numero, Ordenes.orden_fecha, Orden_Items.orden_item, Orden_Items.cantidad 
, Productos.producto_nombre 
from Ordenes 
join Orden_Items on Ordenes.orden_numero = Orden_Items.orden_numero 
join Productos on Productos.producto_ID = Orden_Items.producto_ID;


/*
 
   11) El producto con ID BR03 no est� disponible. Necesitamos un listado del nombre,
    contacto y mail de todos los clientes que hayan pedido el producto BR03
 
*/


-- TABLAS
select * from sqlite_master where type = "table";


--DESCRIPCION DE TABLA
select * from Productos;
select * from Clientes;
select * from Ordenes;
select * from Orden_Items;


-- DESCRIPCION ESTRUCTURA DE TABLA
 -- pragma table_info([Ordenes]);


select Clientes.cliente_nombre, Clientes.Cliente_contacto, Clientes.Cliente_email 
from Clientes 
join Ordenes on Ordenes.cliente_ID = Clientes.cliente_ID 
join Orden_Items on Orden_Items.orden_numero = Ordenes.orden_numero 
where Orden_Items.producto_ID = 'BR03';
