

## Eliminar la tabla alumno "si existe"
```sql
drop table IF EXISTS alumno;
-- Query OK, 0 rows affected, 1 warning (0,01 sec)
```

## Crear la tabla definiendo una clave primaria compuesta(año de inscripción y número de inscripción)
```sql
create table alumno (
    numero_inscripcion INT AUTO_INCREMENT,
    año_inscripcion INT,
    nombre VARCHAR(50),
    documento VARCHAR(10),
    domicilio VARCHAR(100),
    ciudad VARCHAR(50),
    provincia VARCHAR(50),
    PRIMARY KEY(numero_inscripcion, año_inscripcion)
);
/**
+--------------------+--------------+------+-----+---------+----------------+
| Field              | Type         | Null | Key | Default | Extra          |
+--------------------+--------------+------+-----+---------+----------------+
| numero_inscripcion | int          | NO   | PRI | NULL    | auto_increment |
| año_inscripcion    | int          | NO   | PRI | NULL    |                |
| nombre             | varchar(50)  | YES  |     | NULL    |                |
| documento          | varchar(10)  | YES  |     | NULL    |                |
| domicilio          | varchar(100) | YES  |     | NULL    |                |
| ciudad             | varchar(50)  | YES  |     | NULL    |                |
| provincia          | varchar(50)  | YES  |     | NULL    |                |
+--------------------+--------------+------+-----+---------+----------------+
**/
```

## Un índice único por el campo "documento" y un índice común por ciudad y provincia
```sql
create UNIQUE index idx_doc ON alumno (documento);
-- Query OK, 0 rows affected (0,01 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

create index idx_location ON alumno (ciudad, provincia);
-- Query OK, 0 rows affected (0,01 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

```

## Mostrar los indices
```sql
show index from alumno;
/**
+--------+------------+--------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name     | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+--------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY      |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY      |            2 | año_inscripcion    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | idx_doc      |            1 | documento          | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_location |            1 | ciudad             | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_location |            2 | provincia          | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+--------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/
```

## Intente ingresar un alumno con clave primaria repetida
```sql
insert into alumno (numero_inscripcion, año_inscripcion, nombre, documento, domicilio, ciudad, provincia) VALUES
(1, 2020, 'roberto', '1111111A', 'españa 10', 'Madrid', 'Madrid'),
(1, 2020, 'antonio', '2222222B', 'españa 10', 'Madrid', 'Madrid');
-- ERROR 1062 (23000): Duplicate entry '1-2020' for key 'alumno.PRIMARY'

```

## Intente ingresar un alumno con documento repetido
```sql
insert into alumno (numero_inscripcion, año_inscripcion, nombre, documento, domicilio, ciudad, provincia) VALUES
(1, 2020, 'juan', '11111111A', 'españa 10', 'Madrid', 'Madrid'),
(1, 2021, 'juanete', '11111111A', 'españa 10', 'Madrid', 'Madrid');
-- ERROR 1062 (23000): Duplicate entry '11111111A' for key 'alumno.idx_doc'

```

## Ingrese varios alumnos de la misma ciudad y provincia
```sql
insert into alumno (numero_inscripcion, año_inscripcion, nombre, documento, domicilio, ciudad, provincia) VALUES
(1, 2020, 'pepe', '11111111A', 'girona 23', 'girona', 'girona'),
(2, 2020, 'Miguel', '22222222A', 'cataluña 12', 'Barcelona', 'Barcelona'),
(1, 2021, 'pepe2', '11111111B', 'españa 12', 'Madrid', 'Madrid'),
(2, 2021, 'Miguel2', '22222222B', 'españa 15', 'canarias', 'canarias');
-- Query OK, 4 rows affected (0,00 sec)
-- Records: 4  Duplicates: 0  Warnings: 0

```

## Elimina los indices creados, y muestra que ya no se encuentran
```sql
ALTER TABLE alumno DROP INDEX idx_location, DROP INDEX idx_doc;
/**
Query OK, 0 rows affected (0,02 sec)
Records: 0  Duplicates: 0  Warnings: 0
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY  |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY  |            2 | año_inscripcion    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/
```
