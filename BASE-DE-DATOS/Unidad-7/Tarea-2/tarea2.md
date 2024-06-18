## Elimine la tabla "cliente" si existe. 

```mysql
 drop table if exists cliente;
Query OK, 0 rows affected, 1 warning (0,00 sec)


describe cliente;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| documento | char(8)     | NO   |     | NULL    |       |
| nombre    | varchar(30) | NO   |     | NULL    |       |
| domicilio | varchar(30) | YES  |     | NULL    |       |
| ciudad    | varchar(20) | YES  |     | NULL    |       |
| telefono  | varchar(11) | YES  |     | NULL    |       |
| provincia | varchar(20) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0,01 sec)
```

## Cree la tabla si clave primaria y incluye a posteriori esta.  
```
create table cliente (
	documento char(8) not null,
	nombre varchar(30) not null,
	domicilio varchar(30),
	ciudad varchar(20),
	telefono varchar(11), 
	provincia varchar(20));

	ALTER TABLE cliente  MODIFY documento VARCHAR(8) NOT NULL, ADD PRIMARY KEY(documento);

	describe cliente;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| documento | varchar(8)  | NO   | PRI | NULL    |       |
| nombre    | varchar(30) | NO   |     | NULL    |       |
| domicilio | varchar(30) | YES  |     | NULL    |       |
| ciudad    | varchar(20) | YES  |     | NULL    |       |
| telefono  | varchar(11) | YES  |     | NULL    |       |
| provincia | varchar(20) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

```

## Un índice único por el campo "documento" y un índice común por ciudad y provincia. 
```mysql
create index index_location ON cliente (ciudad, provincia);

create unique index idoc on cliente(documento);
Query OK, 0 rows affected (0,07 sec)
Records: 0  Duplicates: 0  Warnings: 0

show index from cliente;
+---------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name       | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | idoc           |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | index_location |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | index_location |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0,02 sec)
```
## Vea los índices de la tabla.
```mysql
show index from cliente;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | idoc     |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

## Agregue un índice único por el campo "telefono".
```mysql
create unique index itelefono on cliente(telefono);
Query OK, 0 rows affected (0,04 sec)
```
## Elimina los índices. 
```mysql
ALTER TABLE cliente DROP INDEX index_location, DROP INDEX idoc;

show index from cliente;
Empty set (0,00 sec)
```
