<h1 align="center">Creacionde base de datos en SQLITE3 </h1>

## Comandos de creacion

Con este comando creamos la tabla y establecemos todos sus campos
```
CREATE TABLE Ejemplo (
   ...> id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   ...> texto TEXT NOT NULL,
   ...> ENTERO INTEGER NOT NULL,
   ...> decimal REAL NOT NULL,
   ...> fecha DATE NOT NULL,
   ...> booleano BOOLEAN NOT NULL);

   ```

   Posteriormente añadimos toda la informacion que necesitemos con el comando 'INSTERT'
``` 
INSERT INTO Ejemplo (texto,ENTERO,decimal,fecha,booleano)
values ('Ejemplo 1','28','50.0','2026-05-25','0');
```
``` 
INSERT INTO Ejemplo (texto,ENTERO,decimal,fecha,booleano)
values ('Ejemplo 2','28','50.0','2026-05-25','0');
```

...

``` 
INSERT INTO Ejemplo (texto,ENTERO,decimal,fecha,booleano)
values ('Ejemplo 49','28','50.0','2026-05-25','0');
```

``` 
INSERT INTO Ejemplo (texto,ENTERO,decimal,fecha,booleano)
values ('Ejemplo 50','75','85.3','2026-06-11','1');
```





## Comandos de consuta
- Consultar todos los datos de la tabla 
```
select * from Ejemplo
```
- Aqui consultamos todos los ejemplos donde el numero entero es mayor que 50


```sqlite
select * from Ejemplo
   ...> where ENTERO > 50;
```

## Comandos de modificación y eliminación

- Eliminamos todos los booleanos que sean True

```
delete from Ejemplo where booleano='1';
```

```
update ejemplo set texto='Modificado'
   ...> where ENTERO < 30;
```
