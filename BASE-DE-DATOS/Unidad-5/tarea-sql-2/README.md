<h1 align="Center">Consultas SQL</h1>

## Creacion de tablas 

En primer lugar creamos las tablas de Propietarios y la tablas de vehiculos

- TABLA DE PROPIETARIOS

```sql
CREATE TABLE Propietarios (
id INTEGER PRIMARY KEY AUTOINCREMENT,
nombre TEXT NOT NULL,
apellido TEXT NOT NULL,
dni TEXT UNICODE);
```
- TABLA DE VEHICULOS 

```sql
CREATE TABLE Vehiculos (
id INTEGER PRIMARY KEY AUTOINCREMENT,
marca TEXT NOT NULL,
modelo TEXT NOT NULL,
anio INTEGER NOT NULL,
id_propietario INTEGER   references Propietarios(id));
```
:warning: Relacionar la id_propietario como FK en la tabala Propietario

## Insercion de Informacion 

Añadimos la informacion de todos los Propietarios

```sql
INSERT INTO Propietarios (nombre,apellido,dni) 
VALUES('Juan','Perez','12345678A');

INSERT INTO Propietarios (nombre,apellido,dni) 
VALUES('Maria','Lopez','87654321B');

INSERT INTO Propietarios (nombre,apellido,dni) 
VALUES('Carlos','Ruiz','11111111C');

INSERT INTO Propietarios (nombre,apellido,dni)
VALUES ('Laura','Gomez','22222222D');

INSERT INTO Propietarios (nombre,apellido,dni)
VALUES('Pedro','Martinez','33333333E');

...

```

Y añadimos la informacion de los Vehículos 

```sql
INSERT INTO Vehiculos (marca,modelo,anio,id_propietario) 
VALUES('Ford','Fiesta',2019,1);

INSERT INTO Vehiculos(marca,modelo,anio,id_propietario) 
VALUES('Toyota','Corolla',2018,2);

INSERT INTO Vehiculos(marca,modelo,anio,id_propietario) 
VALUES('Nissan','Sentra',2020,3);

INSERT INTO Vehiculos(marca,modelo,anio,id_propietario)
VALUES('Chevrolet','Spark',2017,4);

INSERT INTO Vehiculos(marca,modelo,anio,id_propietario) 
VALUES('Honda','Civic',2016,5);

...
```

## Búsquedas en SQL



- Seleccionar todos los propietarios

Entrada:
```sql
select * from Propietarios;
```
Salida:
```sql
+----+----------+-----------+-----------+
| id |  nombre  | apellido  |    dni    |
+----+----------+-----------+-----------+
| 1  | Juan     | Perez     | 12345678A |
| 2  | Maria    | Lopez     | 87654321B |
| 3  | Carlos   | Ruiz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Sanchez   | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | Gonzalez  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112M |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 16 | Natalia  | Paredes   | 14141414P |
| 17 | Fernando | Herrera   | 15151515Q |
| 18 | Clara    | Soto      | 16161616R |
| 19 | Sergio   | Mendoza   | 17171717S |
| 20 | Patricia | Navarro   | 18181818T |
+----+----------+-----------+-----------+
```

- Listar todos los vehículos.
Entrada:
```sql
select * from Vehiculos ;
```
Salida:
```sql
+----+------------+------------+------+----------------+
| id |   marca    |   modelo   | anio | id_propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Sentra     | 2020 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkwagen  | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Altima     | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | HondH      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Rogue      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | HOnda      | Odyssey    | 2016 | 19             |
| 20 | NIssan     | Murano     | 2019 | 20             |
+----+------------+------------+------+----------------+

```
- Seleccionar solo los nombres y apellidos de los propietarios.
Entrada:
```sql
select nombre , apellido from Propietarios ;
```
Salida:
```sql
+----------+-----------+
|  nombre  | apellido  |
+----------+-----------+
| Juan     | Perez     |
| Maria    | Lopez     |
| Carlos   | Ruiz      |
| Laura    | Gomez     |
| Pedro    | Martinez  |
| Ana      | Fernandez |
| Diego    | Sanchez   |
| Sofia    | Torres    |
| Javier   | Leon      |
| Lucia    | Castillo  |
| Luis     | Gonzalez  |
| Marta    | Diaz      |
| Victor   | Vargas    |
| Elena    | Castro    |
| Roberto  | Blanco    |
| Natalia  | Paredes   |
| Fernando | Herrera   |
| Clara    | Soto      |
| Sergio   | Mendoza   |
| Patricia | Navarro   |
+----------+-----------+

```
- Listar todas las marcas y modelos de los vehículos.
Entrada:
```sql
select marca, modelo from Vehiculos ;
```
Salida:
```sql
+------------+------------+
|   marca    |   modelo   |
+------------+------------+
| Ford       | Fiesta     |
| Toyota     | Corolla    |
| Nissan     | Sentra     |
| Chevrolet  | Spark      |
| Honda      | Civic      |
| Ford       | Mustang    |
| Toyota     | RAV4       |
| Volkwagen  | Golf       |
| Honda      | CR-V       |
| Nissan     | Altima     |
| Chevrolet  | Malibu     |
| Toyota     | Camry      |
| HondH      | Accord     |
| Ford       | Explorer   |
| Nissan     | Rogue      |
| Volkswagen | Jetta      |
| Chevrolet  | Equinox    |
| Toyota     | Highlander |
| HOnda      | Odyssey    |
| NIssan     | Murano     |
+------------+------------+

```
- Seleccionar solo los 
propietarios con apellido "Perez".
Entrada:
```sql
 select * from Propietarios where apellido ='Perez';
```
Salida:
```sql
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 1  | Juan   | Perez    | 12345678A |
+----+--------+----------+-----------+

```
- Listar todos los vehículos con año 2019.
Entrada:
```sql
 select * from Vehiculos where anio='2019';
```
Salida:
```sql
+----+------------+--------+------+----------------+
| id |   marca    | modelo | anio | id_propietario |
+----+------------+--------+------+----------------+
| 1  | Ford       | Fiesta | 2019 | 1              |
| 7  | Toyota     | RAV4   | 2019 | 7              |
| 11 | Chevrolet  | Malibu | 2019 | 11             |
| 16 | Volkswagen | Jetta  | 2019 | 16             |
| 20 | NIssan     | Murano | 2019 | 20             |
+----+------------+--------+------+----------------+

```
- Seleccionar propietarios que tienen vehículos de la marca "Toyota".
Entrada:
```sql
select * from Vehiculos where marca = 'Toyota';

select * from Propietarios where id='2' or id='7' or id='12' or id='18'; 

```
Salida:
```sql
+----+--------+------------+------+----------------+
| id | marca  |   modelo   | anio | id_propietario |
+----+--------+------------+------+----------------+
| 2  | Toyota | Corolla    | 2018 | 2              |
| 7  | Toyota | RAV4       | 2019 | 7              |
| 12 | Toyota | Camry      | 2020 | 12             |
| 18 | Toyota | Highlander | 2020 | 18             |
----+--------+------------+------+-----------------+
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 2  | Maria  | Lopez    | 87654321B |
| 7  | Diego  | Sanchez  | 55555555G |
| 12 | Marta  | Diaz     | 10101010L |
| 18 | Clara  | Soto     | 16161616R |
+----+--------+----------+-----------+


```

- Listar vehículos con marca " Ford" y modelo "Fiesta".
Entrada:
```sql
select * from Vehiculos where marca ='Ford' and modelo='Fiesta';
```
Salida:
```sql
+----+-------+--------+------+----------------+
| id | marca | modelo | anio | id_propietario |
+----+-------+--------+------+----------------+
| 1  | Ford  | Fiesta | 2019 | 1              |
+----+-------+--------+------+----------------+
```
- Seleccionar propietarios con DNI "12345678A".
Entrada:
```sql
select * from Propietarios where dni='12345678A';
```
Salida:
```sql
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 1  | Juan   | Perez    | 12345678A |
+----+--------+----------+-----------+

```
- Listar vehículos que pertenecen al propietario con ID 5.
Entrada:
```sql
+----+-------+--------+------+----------------+
| id | marca | modelo | anio | id_propietario |
+----+-------+--------+------+----------------+
| 5  | Honda | Civic  | 2016 | 5              |
+----+-------+--------+------+----------------+

```
Salida:
```sql
+----+-------+--------+------+----------------+
| id | marca | modelo | anio | id_propietario |
+----+-------+--------+------+----------------+
| 5  | Honda | Civic  | 2016 | 5              |
+----+-------+--------+------+----------------+

```


## Actualizaciones en SQL



Actualizar el nombre de un propietario con DNI "12345678A".
Entrada:
```sql
update Propietarios set nombre='Pepe' where dni='12345678A';
```
salida:
```sql
+----+----------+-----------+-----------+
| id |  nombre  | apellido  |    dni    |
+----+----------+-----------+-----------+
| 1  | Pepe     | Perez     | 12345678A |
```
Modificar el año de un vehículo con ID 3 a 2022.
Entrada:
```sql
update Vehiculos set anio='2022' where id='3';
```
salida:
```sql
+----+------------+------------+------+----------------+
| id |   marca    |   modelo   | anio | id_propietario |
+----+------------+------------+------+----------------+
| 3  | Nissan     | Sentra     | 2022 | 3              |

```
- Cambiar el modelo de todos los vehículos Nissan a "Micra".
```sql
 update Vehiculos set modelo='Micra' where marca='Nissan';
```
salida:
```sql
+----+------------+------------+------+----------------+
| id |   marca    |   modelo   | anio | id_propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Micra      | 2022 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkwagen  | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Micra      | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | HondH      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Micra      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | HOnda      | Odyssey    | 2016 | 19             |
| 20 | NIssan     | Murano     | 2019 | 20             |
+----+------------+------------+------+----------------+

```
Actualizar el apellido de un propietario con ID 7 a "Gomez".
Entrada:
```sql
update Propietarios set apellido='Gomez' where id='7';
```
salida:
```sql
| 7  | Diego    | Gomez     | 55555555G |
```
Modificar la marca de un vehículo con modelo "Fiesta" a "Renault".
Entrada:
```sql
update Vehiculos set marca='Renault' where modelo='Fiesta';
```
salida:
```sql
| id |   marca    |   modelo   | anio | id_propietario |
+----+------------+------------+------+----------------+
| 1  | Renault    | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |

```

AUTOR: David Riccio