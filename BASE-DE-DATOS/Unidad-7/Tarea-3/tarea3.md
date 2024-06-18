## Crea una base de datos que tendrá por nombre Base_Indices

```sql
Create database Base_indice;
Use Base_indice
```
## En la BD crea una tabla de nombre MOVIMIENTO con la siguiente estructura:
```sql
create table MOVIMIENTO ( 
Identificador int auto_increment primary key, 
Articulo varchar(50) not null, 
Fecha date not null, 
Cantidad int not null);
```
## Con la cláusula DESCRIBE observa cuál es la situación de la tabla clonada, ¿Qué le pasa al índice y a la propiedad AUTO_INCREMENT?
```sql
describe MOVIMIENTO_BIS;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Identificador | int         | NO   |     | 0       |       |
| Articulo      | varchar(50) | NO   |     | NULL    |       |
| Fecha         | date        | NO   |     | NULL    |       |
| Cantidad      | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
-- NO SE COPIA LA PRIMARY KEY NI LA PROPIEDAD AUTO_INCREMENT
```

## Utilizando EXPLAIN observa el plan de ejecución de la consulta que devuelve toda la información de los movimientos con identificador=3. Tanto en la tabla MOVIMIENTOS como en la tabla MOVIMIENTOS_bis. Escribe tus conclusiones al respecto
```sql

EXPLAIN select * from MOVIMIENTO where Identificador=3;
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+




EXPLAIN select * from MOVIMIENTO_BIS where Identificador=3;
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3594 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
/*

Se ve que en possible_keys en la tabla 1 se utiliza la primary en cambio en la 2 no hay ninguna, en key pasa lo mismo y el apartado ref en la tabla 1 pone const en la 2 no pone nada, en rows mientras que en la tabla 1 pone 1 en la 2 3594 

*/


```

## Supongamos que las consultas de rango que se van a hacer en nuestra tabla son frecuentes y además no por el identificador, sino por la fecha. Este es motivo suficiente para que sea la fecha un índice de tabla y así mejorar el tiempo de respuesta de nuestras consultas. En la tabla MOVIMIENTO_BIS creamos un índice para la fecha (IX_FECHA_BIS) y otro índice para el identificador (IX_IDENTIFICADOR).
```sql
create index IX_FECHA_BIS on MOVIMIENTO_BIS(Fecha);
Query OK, 0 rows affected (0,16 sec)


 create index IX_IDENTIFICADOR on MOVIMIENTO_BIS(Identificador);
Query OK, 0 rows affected (0,09 sec)

describe MOVIMIENTO_BIS;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Identificador | int         | NO   | MUL | 0       |       |
| Articulo      | varchar(50) | NO   |     | NULL    |       |
| Fecha         | date        | NO   | MUL | NULL    |       |
| Cantidad      | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
```

## 8.- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia: Consulta1
```sql
-- CONSULTA 1


EXPLAIN select * from MOVIMIENTO_BIS where Identificador=3;
/*
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3594 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
*/
-- CONSULTA 2

EXPLAIN select identificador from MOVIMIENTO_BIS where identificador=3;
/*
+----+-------------+----------------+------------+------+----------------+----------------+---------+-------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys  | key            | key_len | ref   | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+----------------+----------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | iIdentificador | iIdentificador | 4       | const |    1 |   100.00 | Using index |
+----+-------------+----------------+------------+------+----------------+----------------+---------+-------+------+----------+-------------+
LA DIFERENCIA ES QUE EN LA 2 UTILIZA EL INDEX
```


## Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:
```sql

-- CONSULTA 1 EXPLAIN SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN ‘01/01/2012’ AND ‘01/03/2012’;

EXPLAIN Select Fecha from MOVIMIENTO where Fecha BETWEEN '01/01/2012' and '01/03/2012';
/*
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3594 |    11.11 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
*/
-- CONSULTA 2 EXPLAIN SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN ‘01/01/2012’ AND ‘01/03/2012’;
/*
EXPLAIN SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN '01/01/2012' AND '01/03/2012';
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3594 |    11.11 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
*/

-- CONSULTA 3 EXPLAIN SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '01/01/2012' AND '01/03/2012';

EXPLAIN SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '01/01/2012' AND '01/03/2012';
/*
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | iFecha        | NULL | NULL    | NULL | 3594 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 2 warnings (0,00 sec)
*/

-- CONSULTA 4 EXPLAIN SELECT Fecha FROM MOVIMIENTO_BIS WHERE Fecha BETWEEN '01/01/2012' AND '01/03/2012';

EXPLAIN SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '01/01/2012' AND '01/03/2012';/*
+----+-------------+----------------+------------+-------+---------------+--------+---------+------+------+----------+--------------------------+
| id | select_type | table          | partitions | type  | possible_keys | key    | key_len | ref  | rows | filtered | Extra                    |
+----+-------------+----------------+------------+-------+---------------+--------+---------+------+------+----------+--------------------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | index | iFecha        | iFecha | 3       | NULL | 3594 |    11.11 | Using where; Using index |
+----+-------------+----------------+------------+-------+---------------+--------+---------+------+------+----------+--------------------------+
*/
/*
DA ERROR PORQUE RECORRE LA LISTA DOS VECES UNA POR CADA FECHA

SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '01/01/2012' AND '01/03/2012';
Empty set, 7189 warnings (0,01 sec)
*/
```