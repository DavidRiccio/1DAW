    --Mostrar todos los clientes.
    SELECT * FROM clientes;
    /*
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
*/
    --Mostrar todas las órdenes.
/*
SELECT * FROM ordenes;
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
|        2 |          2 | 2024-03-02  |
|        3 |          3 | 2024-03-03  |
+----------+------------+-------------+
*/
    --Mostrar todos los productos.

SELECT * FROM productos;

/*

+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           1 | Producto A      |           50.00 |
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+


*/
    --Mostrar todos los detalles de las órdenes.


SELECT * FROM detalles_ordenes;

/*

+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          1 |        1 |           1 |        2 |
|          2 |        2 |           2 |        1 |
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+


*/
    --Mostrar los primeros 5 clientes ordenados por nombre.



SELECT * FROM clientes ORDER BY nombre_cliente LIMIT 5;
/*

+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+

*/

    --Mostrar los productos con un precio mayor a 50.

SELECT * FROM productos WHERE precio_producto > 50;
/*

+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+

*/


    --Mostrar todas las órdenes realizadas por el cliente con ID 1.
SELECT * FROM ordenes WHERE id_cliente = 1;
/*
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
+----------+------------+-------------+

*/
    --Mostrar los clientes cuyos nombres comienzan con la letra "A".
select * from clientes where nombre_cliente regexp '^A';
    --Mostrar las órdenes que contienen más de 2 productos
SELECT * FROM ordenes
WHERE id_orden IN (
    SELECT id_orden FROM detalles_ordenes
    GROUP BY id_orden
    HAVING COUNT(*) > 2
);
    --Mostrar los productos ordenados por precio de forma descendente.

SELECT * FROM productos ORDER BY precio_producto DESC;
/* +-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           3 | Producto C      |          100.00 |
|           2 | Producto B      |           75.00 |
|           1 | Producto A      |           50.00 |
+-------------+-----------------+-----------------+ */
    --Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes.
SELECT c.*, o.*
    -> FROM clientes c
    -> LEFT JOIN ordenes o ON c.id_cliente = o.id_cliente;
/* +------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+ */
    --Seleccionar todas las órdenes junto con los productos correspondientes.
SELECT o.*, p.*
    -> FROM ordenes o
    -> JOIN detalles_ordenes do ON o.id_orden = do.id_orden
    -> JOIN productos p ON do.id_producto = p.id_producto;
/* +----------+------------+-------------+-------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | id_producto | nombre_producto | precio_producto |
+----------+------------+-------------+-------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  |           1 | Producto A      |           50.00 |
|        2 |          2 | 2024-03-02  |           2 | Producto B      |           75.00 |
|        3 |          3 | 2024-03-03  |           3 | Producto C      |          100.00 |
+----------+------------+-------------+-------------+-----------------+-----------------+
 */
    --Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50.



SELECT DISTINCT c.nombre_cliente
    -> FROM clientes c
    -> JOIN ordenes o ON c.id_cliente = o.id_cliente
    -> JOIN detalles_ordenes do ON o.id_orden = do.id_orden
    -> JOIN productos p ON do.id_producto = p.id_producto
    -> WHERE p.precio_producto > 50;
/* +----------------+
| nombre_cliente |
+----------------+
| María          |
| Pedro          |
+----------------+
 */





    --Obtener el nombre de los productos que no se han ordenado aún.


SELECT nombre_producto
FROM productos
WHERE id_producto NOT IN (
    SELECT id_producto FROM detalles_ordenes
);


    
    --Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes.


SELECT c.nombre_cliente, p.nombre_producto, do.cantidad
    -> FROM clientes c
    -> JOIN ordenes o ON c.id_cliente = o.id_cliente
    -> JOIN detalles_ordenes do ON o.id_orden = do.id_orden
    -> JOIN productos p ON do.id_producto = p.id_producto;

/* +----------------+-----------------+----------+
| nombre_cliente | nombre_producto | cantidad |
+----------------+-----------------+----------+
| Juan           | Producto A      |        2 |
| María          | Producto B      |        1 |
| Pedro          | Producto C      |        3 |
+----------------+-----------------+----------+
 */




    --Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos.



 SELECT p.nombre_producto, c.nombre_cliente
    -> FROM productos p
    -> JOIN detalles_ordenes do ON p.id_producto = do.id_producto
    -> JOIN ordenes o ON do.id_orden = o.id_orden
    -> JOIN clientes c ON o.id_cliente = c.id_cliente;
/* +-----------------+----------------+
| nombre_producto | nombre_cliente |
+-----------------+----------------+
| Producto A      | Juan           |
| Producto B      | María          |
| Producto C      | Pedro          |
+-----------------+----------------+ */




    --Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes.



 SELECT o.id_orden, c.nombre_cliente, p.nombre_producto
    -> FROM ordenes o
    -> LEFT JOIN clientes c ON o.id_cliente = c.id_cliente
    -> LEFT JOIN detalles_ordenes do ON o.id_orden = do.id_orden
    -> LEFT JOIN productos p ON do.id_producto = p.id_producto;
    /* 
+----------+----------------+-----------------+
| id_orden | nombre_cliente | nombre_producto |
+----------+----------------+-----------------+s
|        1 | Juan           | Producto A      |
|        2 | María          | Producto B      |
|        3 | Pedro          | Producto C      |
+----------+----------------+-----------------+ */





    --Obtener el nombre de los clientes junto con el número total de órdenes que han realizado.


SELECT c.nombre_cliente, COUNT(o.id_orden) AS total_ordenes
    -> FROM clientes c
    -> LEFT JOIN ordenes o ON c.id_cliente = o.id_cliente
    -> GROUP BY c.nombre_cliente;
/* +----------------+---------------+
| nombre_cliente | total_ordenes |
+----------------+---------------+
| Juan           |             1 |
| María          |             1 |
| Pedro          |             1 |
+----------------+---------------+
 */






    --Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto.





SELECT o.id_orden, c.nombre_cliente, p.nombre_producto
    -> FROM ordenes o
    -> JOIN clientes c ON o.id_cliente = c.id_cliente
    -> JOIN detalles_ordenes do ON o.id_orden = do.id_orden
    -> JOIN productos p ON do.id_producto = p.id_producto;
/* +----------+----------------+-----------------+
| id_orden | nombre_cliente | nombre_producto |
+----------+----------------+-----------------+
|        1 | Juan           | Producto A      |
|        2 | María          | Producto B      |
|        3 | Pedro          | Producto C      |
+----------+----------------+-----------------+ */





    --Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.



SELECT do.*, c.nombre_cliente, p.nombre_producto FROM ordenes as o  
RIGHT JOIN clientes as c on c.id_cliente=o.id_cliente 
JOIN detalles_ordenes as do on do.id_orden=o.id_orden 
JOIN productos as p on p.id_producto=do.id_producto;
/**
+------------+----------+-------------+----------+----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | nombre_cliente | nombre_producto |
+------------+----------+-------------+----------+----------------+-----------------+
|          1 |        1 |           1 |        2 | Juan           | Producto A      |
|          2 |        2 |           2 |        1 | María          | Producto B      |
|          3 |        3 |           3 |        3 | Pedro          | Producto C      |
+------------+----------+-------------+----------+----------------+-----------------+
3 rows in set (0,00 sec)
**/






    --Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados.



SELECT do.*, c.nombre_cliente, p.nombre_producto FROM ordenes as o  
    ->     JOIN clientes as c on c.id_cliente=o.id_cliente 
    ->     LEFT JOIN detalles_ordenes as do on do.id_orden=o.id_orden 
    ->     JOIN productos as p on p.id_producto=do.id_producto;
/**
+------------+----------+-------------+----------+----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | nombre_cliente | nombre_producto |
+------------+----------+-------------+----------+----------------+-----------------+
|          1 |        1 |           1 |        2 | Juan           | Producto A      |
|          2 |        2 |           2 |        1 | María          | Producto B      |
|          3 |        3 |           3 |        3 | Pedro          | Producto C      |
+------------+----------+-------------+----------+----------------+-----------------+
3 rows in set (0,00 sec)
**/






    --Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos.





SELECT o.*, c.*, p.* from clientes as c 
    -> RIGHT JOIN ordenes as o ON c.id_cliente=o.id_cliente
    -> RIGHT JOIN detalles_ordenes as do ON o.id_orden=do.id_orden
    -> RIGHT JOIN productos as p ON do.id_producto=p.id_producto;
/**
+----------+------------+-------------+------------+----------------+----------------+-------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | id_cliente | nombre_cliente | ciudad_cliente | id_producto | nombre_producto | precio_producto |
+----------+------------+-------------+------------+----------------+----------------+-------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  |          1 | Juan           | Ciudad A       |           1 | Producto A      |           50.00 |
|        2 |          2 | 2024-03-02  |          2 | María          | Ciudad B       |           2 | Producto B      |           75.00 |
|        3 |          3 | 2024-03-03  |          3 | Pedro          | Ciudad C       |           3 | Producto C      |          100.00 |
+----------+------------+-------------+------------+----------------+----------------+-------------+-----------------+-----------------+
3 rows in set (0,00 sec)
**/






    --Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.






SELECT c.nombre_cliente, COUNT(o.id_orden) AS total_ordenes
    -> FROM clientes c
    -> LEFT JOIN ordenes o ON c.id_cliente = o.id_cliente
    -> GROUP BY c.nombre_cliente;
/* +----------------+---------------+
| nombre_cliente | total_ordenes |
+----------------+---------------+
| Juan           |             1 |
| María          |             1 |
| Pedro          |             1 |
+----------------+---------------+ */






    --Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.






SELECT o.*, c.*, p.* from clientes as c 
    -> RIGHT JOIN ordenes as o ON c.id_cliente=o.id_cliente
    -> RIGHT JOIN detalles_ordenes as do ON o.id_orden=do.id_orden
    -> RIGHT JOIN productos as p ON do.id_producto=p.id_producto;
/**
+----------+------------+-------------+------------+----------------+----------------+-------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | id_cliente | nombre_cliente | ciudad_cliente | id_producto | nombre_producto | precio_producto |
+----------+------------+-------------+------------+----------------+----------------+-------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  |          1 | Juan           | Ciudad A       |           1 | Producto A      |           50.00 |
|        2 |          2 | 2024-03-02  |          2 | María          | Ciudad B       |           2 | Producto B      |           75.00 |
|        3 |          3 | 2024-03-03  |          3 | Pedro          | Ciudad C       |           3 | Producto C      |          100.00 |
+----------+------------+-------------+------------+----------------+----------------+-------------+-----------------+-----------------+
3 rows in set (0,00 sec)
**/





    --Realizar un inner join entre clientes y órdenes.




SELECT *
    -> FROM clientes c
    -> JOIN ordenes o ON c.id_cliente = o.id_cliente;
/* +------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
 */







    --Realizar un left join entre órdenes y detalles de órdenes.



 SELECT *
    -> FROM ordenes o
    -> LEFT JOIN detalles_ordenes do ON o.id_orden = do.id_orden;
/* +----------+------------+-------------+------------+----------+-------------+----------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad |
+----------+------------+-------------+------------+----------+-------------+----------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 |        2 |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 |        1 |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |
+----------+------------+-------------+------------+----------+-------------+----------+ */





    --Realizar un right join entre productos y detalles de órdenes.


 SELECT *
    -> FROM productos p
    -> RIGHT JOIN detalles_ordenes do ON p.id_producto = do.id_producto;
/* +-------------+-----------------+-----------------+------------+----------+-------------+----------+
| id_producto | nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
|           1 | Producto A      |           50.00 |          1 |        1 |           1 |        2 |
|           2 | Producto B      |           75.00 |          2 |        2 |           2 |        1 |
|           3 | Producto C      |          100.00 |          3 |        3 |           3 |        3 |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+ */










    --Realizar un full join entre clientes y órdenes.

SELECT *
    -> FROM clientes c
    -> LEFT JOIN ordenes o ON c.id_cliente = o.id_cliente
    -> UNION
    -> SELECT *
    -> FROM clientes c
    -> RIGHT JOIN ordenes o ON c.id_cliente = o.id_cliente;
/* +------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+ */






    --Realizar un full join entre órdenes y detalles de órdenes.


SELECT *
    -> FROM ordenes o
    -> LEFT JOIN detalles_ordenes do ON o.id_orden = do.id_orden
    -> UNION
    -> SELECT *
    -> FROM ordenes o
    -> RIGHT JOIN detalles_ordenes do ON o.id_orden = do.id_orden;
/* +----------+------------+-------------+------------+----------+-------------+----------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad |
+----------+------------+-------------+------------+----------+-------------+----------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 |        2 |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 |        1 |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |
+----------+------------+-------------+------------+----------+-------------+----------+ */






    
    --Realizar un full join entre productos y detalles de órdenes.

    SELECT *
    -> FROM productos p
    -> LEFT JOIN detalles_ordenes do ON p.id_producto = do.id_producto
    -> UNION
    -> SELECT *
    -> FROM productos p
    -> RIGHT JOIN detalles_ordenes do ON p.id_producto = do.id_producto;
/* +-------------+-----------------+-----------------+------------+----------+-------------+----------+
| id_producto | nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
|           1 | Producto A      |           50.00 |          1 |        1 |           1 |        2 |
|           2 | Producto B      |           75.00 |          2 |        2 |           2 |        1 |
|           3 | Producto C      |          100.00 |          3 |        3 |           3 |        3 |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+ */
