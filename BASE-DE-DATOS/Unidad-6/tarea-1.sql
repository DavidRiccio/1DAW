-- Muestra todos los usuarios

SELECT * FROM usuarios;
/**
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
**/

-- Muestra todos los productos

SELECT * FROM productos;
/**
+----+-----------+--------+----------+
| id | nombre    | precio | cantidad |
+----+-----------+--------+----------+
|  1 | Camisa    |  25.99 |      100 |
|  2 | Pantalón  |  35.50 |       80 |
|  3 | Zapatos   |  59.99 |       50 |
+----+-----------+--------+----------+
**/

-- Muestra todos los pedidos

SELECT * FROM pedidos;
/**
+----+------------+-------------+----------+--------------+
| id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+------------+-------------+----------+--------------+
|  1 |          1 |           1 |        2 | 2024-03-01   |
|  2 |          2 |           2 |        1 | 2024-03-02   |
|  3 |          3 |           3 |        3 | 2024-03-03   |
+----+------------+-------------+----------+--------------+
**/


-- Mostrar los usuarios que tienen más de 25 años.

SELECT * FROM usuarios 
    -> WHERE edad > 25;
/**
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
2 rows in set (0,00 sec)
**/

-- Mostrar los productos con un precio mayor a 50.

SELECT * FROM productos
    -> WHERE precio > 50;
/**
+----+---------+--------+----------+
| id | nombre  | precio | cantidad |
+----+---------+--------+----------+
|  3 | Zapatos |  59.99 |       50 |
+----+---------+--------+----------+
1 row in set (0,00 sec)
**/


-- Mostrar los pedidos realizados el día de hoy.

SELECT * FROM pedidos
    -> WHERE fecha_pedido = now();
Empty set (0,00 sec)


-- Mostrar el total de productos en stock.

SELECT * from pedidos 
    -> WHERE cantidad > 0;
/**
+----+------------+-------------+----------+--------------+
| id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+------------+-------------+----------+--------------+
|  1 |          1 |           1 |        2 | 2024-03-01   |
|  2 |          2 |           2 |        1 | 2024-03-02   |
|  3 |          3 |           3 |        3 | 2024-03-03   |
+----+------------+-------------+----------+--------------+
3 rows in set (0,00 sec)
**/

-- Mostrar el promedio de edades de los usuarios.


SELECT AVG(edad) from usuarios;
/**
+-----------+
| AVG(edad) |
+-----------+
|   27.6667 |
+-----------+
1 row in set (0,00 sec)
**/

-- Mostrar los usuarios que tienen la letra 'a' en su nombre
SELECT * FROM usuarios
    -> WHERE nombre REGEXP 'a';
/**
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
+----+--------+------+-------------------+
2 rows in set (0,00 sec)
**/

-- Mostrar los productos ordenados por precio de forma descendente.

SELECT * FROM productos
    -> ORDER BY nombre DESC;
/**
+----+-----------+--------+----------+
| id | nombre    | precio | cantidad |
+----+-----------+--------+----------+
|  3 | Zapatos   |  59.99 |       50 |
|  2 | Pantalón  |  35.50 |       80 |
|  1 | Camisa    |  25.99 |      100 |
+----+-----------+--------+----------+
3 rows in set (0,00 sec)
**/

-- Mostrar los pedidos realizados por el usuario con ID 2.

SELECT * FROM usuarios
    -> JOIN pedidos as p on p.usuario_id= usuarios.id
    -> WHERE usuarios.id = 2;
/**
+----+--------+------+-------------------+----+------------+-------------+----------+--------------+
| id | nombre | edad | correo            | id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+--------+------+-------------------+----+------------+-------------+----------+--------------+
|  2 | María  |   30 | maria@example.com |  2 |          2 |           2 |        1 | 2024-03-02   |
+----+--------+------+-------------------+----+------------+-------------+----------+--------------+
**/

-- Mostrar los usuarios ordenados por edad de forma ascendente.

SELECT * FROM usuarios
    -> ORDER BY nombre ASC;
/**
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
**/

-- Mostrar los productos con un precio entre 20 y 50.

SELECT * FROM productos
    -> WHERE precio BETWEEN 20 and 50;
/**
+----+-----------+--------+----------+
| id | nombre    | precio | cantidad |
+----+-----------+--------+----------+
|  1 | Camisa    |  25.99 |      100 |
|  2 | Pantalón  |  35.50 |       80 |
+----+-----------+--------+----------+
2 rows in set (0,00 sec)
**/

-- Mostrar los usuarios que tienen un correo de dominio 'example.com'.

SELECT * FROM usuarios
    -> WHERE correo REGEXP 'example.com';
/**
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
**/

-- Mostrar los pedidos con una cantidad mayor a 2
SELECT * FROM pedidos
    -> WHERE cantidad > 2;
/**
+----+------------+-------------+----------+--------------+
| id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+------------+-------------+----------+--------------+
|  3 |          3 |           3 |        3 | 2024-03-03   |
+----+------------+-------------+----------+--------------+
**/