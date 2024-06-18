<h1 align="center"> TAREA 4 </h1>

## Modelo E-R
<img src="https://github.com/DavidRiccio/base-datos/blob/main/tarea-sql-4/img/ER.png"> </img>

## Modelo Relacional
<img src="https://github.com/DavidRiccio/base-datos/blob/main/tarea-sql-4/img/MR.png"> </img>

## Normalizacion
 No está normalizado

## Consultas

- Mostrar todos los productos de la categoría "Bebidas".
```sql
select * from productos where categoria ='Bebidas';
┌────┬──────────────────┬───────────┬────────┐
│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
└────┴──────────────────┴───────────┴────────┘
```
- Listar los productos ordenados por precio de forma descendente.
```sql
select * from productos order by precio;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 6  │ Huevos             │ Lácteos   │ 1.0    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 18 │ Jabón de Baño      │ Higiene   │ 1.2    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 8  │ Tomates            │ Verduras  │ 2.2    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 1  │ Arroz              │ Alimentos │ 2.5    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 4  │ Manzanas           │ Frutas    │ 3.0    │
│ 10 │ Cereal             │ Desayuno  │ 3.5    │
│ 20 │ Cerveza            │ Bebidas   │ 3.8    │
│ 9  │ Queso              │ Lácteos   │ 4.0    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 16 │ Café               │ Bebidas   │ 5.0    │
│ 5  │ Pollo              │ Carnes    │ 5.5    │
└────┴────────────────────┴───────────┴────────┘
```
- Calcular el precio total de todos los productos en la tabla "productos".
```sql
SELECT SUM(precio) AS precio_total FROM productos;
┌──────────────┐
│ precio_total │
├──────────────┤
│ 52.5         │
└──────────────┘
```
- Encontrar los productos con un nombre que contenga la letra 'a'.
```sql
SELECT id, nombre FROM productos WHERE (nombre LIKE '%a%');
┌────┬──────────────────┐
│ id │      nombre      │
├────┼──────────────────┤
│ 1  │ Arroz            │
│ 3  │ Pan              │
│ 4  │ Manzanas         │
│ 8  │ Tomates          │
│ 10 │ Cereal           │
│ 11 │ Papel Higiénico  │
│ 14 │ Galletas         │
│ 15 │ Aceite de Oliva  │
│ 16 │ Café             │
│ 17 │ Sopa enlatada    │
│ 18 │ Jabón de Baño    │
│ 19 │ Botellas de Agua │
│ 20 │ Cerveza          │
└────┴──────────────────┘
```

- Obtener la cantidad total de productos vendidos en todas las fechas.
 ```sql
 select fecha, count(id_producto ) as total_ventas from ventas GROUP BY fecha;
┌────────────┬──────────────┐
│   fecha    │ total_ventas │
├────────────┼──────────────┤
│ 2024-01-17 │ 4            │
│ 2024-01-18 │ 3            │
│ 2024-01-19 │ 2            │
│ 2024-01-20 │ 1            │
└────────────┴──────────────┘
```
- Encontrar el producto más caro en cada categoría.
```sql
SELECT DISTINCT id, nombre, precio, categoria FROM productos GROUP BY categoria;
┌────┬────────────────────┬────────┬───────────┐
│ id │       nombre       │ precio │ categoria │
├────┼────────────────────┼────────┼───────────┤
│ 1  │ Arroz              │ 2.5    │ Alimentos │
│ 16 │ Café               │ 5.0    │ Bebidas   │
│ 5  │ Pollo              │ 5.5    │ Carnes    │
│ 15 │ Aceite de Oliva    │ 4.5    │ Cocina    │
│ 17 │ Sopa enlatada      │ 2.3    │ Conservas │
│ 10 │ Cereal             │ 3.5    │ Desayuno  │
│ 4  │ Manzanas           │ 3.0    │ Frutas    │
│ 12 │ Cepillo de Dientes │ 2.0    │ Higiene   │
│ 11 │ Papel Higiénico    │ 1.5    │ Hogar     │
│ 13 │ Detergente         │ 2.8    │ Limpieza  │
│ 2  │ Leche              │ 1.8    │ Lácteos   │
│ 3  │ Pan                │ 1.2    │ Panadería │
│ 14 │ Galletas           │ 1.7    │ Snacks    │
│ 8  │ Tomates            │ 2.2    │ Verduras  │
└────┴────────────────────┴────────┴───────────┘
```
- Listar los productos que no han sido vendidos.
```sql
SELECT * from productos where id not in (SELECT p.id from productos as p, ventas as v where p.id=v.id_producto);
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 9  │ Queso              │ Lácteos   │ 4.0    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
│ 20 │ Cerveza            │ Bebidas   │ 3.8    │
└────┴────────────────────┴───────────┴────────┘
```
- Calcular el precio promedio de los productos en la categoría "Snacks".
```sql
SELECT AVG(precio) FROM productos WHERE categoria='Snacks';
┌─────────────┐
│ AVG(precio) │
├─────────────┤
│ 1.7         │
└─────────────┘
```
- Encontrar los productos que han sido vendidos más de 5 veces.
```sql
SELECT p.nombre, v.cantidad FROM productos as p, ventas as v WHERE p.id=v.id_producto AND v.cantidad >=5;
┌───────────────┬──────────┐
│    nombre     │ cantidad │
├───────────────┼──────────┤
│ Arroz         │ 5        │
│ Huevos        │ 10       │
│ Galletas      │ 7        │
│ Jabón de Baño │ 6        │
└───────────────┴──────────┘
```

- Mostrar la fecha y la cantidad de ventas para cada producto.

```sql
SELECT p.nombre, v.cantidad, v.fecha FROM productos as p, ventas as v WHERE p.id = v.id_producto;
┌───────────────┬──────────┬────────────┐
│    nombre     │ cantidad │   fecha    │
├───────────────┼──────────┼────────────┤
│ Arroz         │ 5        │ 2024-01-17 │
│ Leche         │ 3        │ 2024-01-17 │
│ Manzanas      │ 2        │ 2024-01-17 │
│ Pollo         │ 1        │ 2024-01-17 │
│ Huevos        │ 10       │ 2024-01-18 │
│ Tomates       │ 4        │ 2024-01-18 │
│ Cereal        │ 2        │ 2024-01-18 │
│ Galletas      │ 7        │ 2024-01-19 │
│ Café          │ 3        │ 2024-01-19 │
│ Jabón de Baño │ 6        │ 2024-01-20 │
└───────────────┴──────────┴────────────┘
```
- Encontrar los productos que tienen un precio menor o igual a 2.
```sql
SELECT id, nombre, precio FROM productos WHERE precio <= 2;
┌────┬────────────────────┬────────┐
│ id │       nombre       │ precio │
├────┼────────────────────┼────────┤
│ 2  │ Leche              │ 1.8    │
│ 3  │ Pan                │ 1.2    │
│ 6  │ Huevos             │ 1.0    │
│ 7  │ Yogurt             │ 2.0    │
│ 11 │ Papel Higiénico    │ 1.5    │
│ 12 │ Cepillo de Dientes │ 2.0    │
│ 14 │ Galletas           │ 1.7    │
│ 18 │ Jabón de Baño      │ 1.2    │
│ 19 │ Botellas de Agua   │ 1.0    │
└────┴────────────────────┴────────┘
```
- Calcular la cantidad total de ventas para cada fecha.
```sql
SELECT DISTINCT fecha, SUM(cantidad) as total_ventas FROM ventas GROUP BY fecha; 
┌────────────┬──────────────┐
│   fecha    │ total_ventas │
├────────────┼──────────────┤
│ 2024-01-17 │ 11           │
│ 2024-01-18 │ 16           │
│ 2024-01-19 │ 10           │
│ 2024-01-20 │ 6            │
└────────────┴──────────────┘
```
- Listar los productos cuyo nombre comienza con la letra 'P'.
```sql
SELECT id, nombre FROM productos WHERE (nombre LIKE 'P%');
┌────┬─────────────────┐
│ id │     nombre      │
├────┼─────────────────┤
│ 3  │ Pan             │
│ 5  │ Pollo           │
│ 11 │ Papel Higiénico │
└────┴─────────────────┘
```

- Obtener el producto más vendido en términos de cantidad.
```sql
SELECT p.nombre, MAX(v.cantidad) as producto_mas_vendido FROM productos as p, ventas as v WHERE p.id = v.id_producto; 
┌────────┬──────────────────────┐
│ nombre │ producto_mas_vendido │
├────────┼──────────────────────┤
│ Huevos │ 10                   │
└────────┴──────────────────────┘
```
- Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.
```sql
SELECT p.id, p.nombre, v.fecha FROM productos as p, ventas as v WHERE v.fecha = '2024-01-18' AND p.id = v.id_producto;
┌────┬─────────┬────────────┐
│ id │ nombre  │   fecha    │
├────┼─────────┼────────────┤
│ 6  │ Huevos  │ 2024-01-18 │
│ 8  │ Tomates │ 2024-01-18 │
│ 10 │ Cereal  │ 2024-01-18 │
└────┴─────────┴────────────┘
```

- Calcular el total de ventas para cada producto. 
```sql 
SELECT p.id, nombre, v.cantidad from productos as p, ventas as v WHERE p.id = v.id_producto;
┌────┬───────────────┬──────────┐
│ id │    nombre     │ cantidad │
├────┼───────────────┼──────────┤
│ 1  │ Arroz         │ 5        │
│ 2  │ Leche         │ 3        │
│ 4  │ Manzanas      │ 2        │
│ 5  │ Pollo         │ 1        │
│ 6  │ Huevos        │ 10       │
│ 8  │ Tomates       │ 4        │
│ 10 │ Cereal        │ 2        │
│ 14 │ Galletas      │ 7        │
│ 16 │ Café          │ 3        │
│ 18 │ Jabón de Baño │ 6        │
└────┴───────────────┴──────────┘
```

- Encontrar los productos con un precio entre 3 y 4.
```sql
SELECT * from productos WHERE precio BETWEEN 3 and 4;
┌────┬──────────┬───────────┬────────┐
│ id │  nombre  │ categoria │ precio │
├────┼──────────┼───────────┼────────┤
│ 4  │ Manzanas │ Frutas    │ 3.0    │
│ 9  │ Queso    │ Lácteos   │ 4.0    │
│ 10 │ Cereal   │ Desayuno  │ 3.5    │
│ 20 │ Cerveza  │ Bebidas   │ 3.8    │
└────┴──────────┴───────────┴────────┘
```

- Listar los productos y sus categorías ordenados alfabéticamente por categoría.
```sql
SELECT * FROM productos GROUP BY categoria;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 1  │ Arroz              │ Alimentos │ 2.5    │
│ 16 │ Café               │ Bebidas   │ 5.0    │
│ 5  │ Pollo              │ Carnes    │ 5.5    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 10 │ Cereal             │ Desayuno  │ 3.5    │
│ 4  │ Manzanas           │ Frutas    │ 3.0    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 8  │ Tomates            │ Verduras  │ 2.2    │
└────┴────────────────────┴───────────┴────────┘
```

-  Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.

```sql
SELECT v.fecha, SUM(p.precio) as precio_total FROM productos as p, ventas as v WHERE v.fecha='2024-01-19' AND p.id = v.id_producto;
┌────────────┬──────────────┐
│   fecha    │ precio_total │
├────────────┼──────────────┤
│ 2024-01-19 │ 6.7          │
└────────────┴──────────────┘
```
- Mostrar los productos que no pertenecen a la categoría "Higiene".
```sql
SELECT * FROM productos WHERE categoria != 'Higiene';
┌────┬──────────────────┬───────────┬────────┐
│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 1  │ Arroz            │ Alimentos │ 2.5    │
│ 2  │ Leche            │ Lácteos   │ 1.8    │
│ 3  │ Pan              │ Panadería │ 1.2    │
│ 4  │ Manzanas         │ Frutas    │ 3.0    │
│ 5  │ Pollo            │ Carnes    │ 5.5    │
│ 6  │ Huevos           │ Lácteos   │ 1.0    │
│ 7  │ Yogurt           │ Lácteos   │ 2.0    │
│ 8  │ Tomates          │ Verduras  │ 2.2    │
│ 9  │ Queso            │ Lácteos   │ 4.0    │
│ 10 │ Cereal           │ Desayuno  │ 3.5    │
│ 11 │ Papel Higiénico  │ Hogar     │ 1.5    │
│ 13 │ Detergente       │ Limpieza  │ 2.8    │
│ 14 │ Galletas         │ Snacks    │ 1.7    │
│ 15 │ Aceite de Oliva  │ Cocina    │ 4.5    │
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 17 │ Sopa enlatada    │ Conservas │ 2.3    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
└────┴──────────────────┴───────────┴────────┘
```

- Encontrar la cantidad total de productos en cada categoría.

```sql
SELECT categoria, COUNT(*) as cantidad_total
   ...> FROM productos
   ...> GROUP BY categoria;
┌───────────┬────────────────┐
│ categoria │ cantidad_total │
├───────────┼────────────────┤
│ Alimentos │ 1              │
│ Bebidas   │ 3              │
│ Carnes    │ 1              │
│ Cocina    │ 1              │
│ Conservas │ 1              │
│ Desayuno  │ 1              │
│ Frutas    │ 1              │
│ Higiene   │ 2              │
│ Hogar     │ 1              │
│ Limpieza  │ 1              │
│ Lácteos   │ 4              │
│ Panadería │ 1              │
│ Snacks    │ 1              │
│ Verduras  │ 1              │
└───────────┴────────────────┘
```
- Listar los productos que tienen un precio igual a la media de precios.
NO HAY RESULTADo

- Calcular el precio total de los productos vendidos en cada fecha.

```sql
SELECT v.fecha, SUM(p.precio) as precio_total from productos as p , ventas as v  GROUP BY fecha;
┌────────────┬──────────────┐
│   fecha    │ precio_total │
├────────────┼──────────────┤
│ 2024-01-17 │ 210.0        │
│ 2024-01-18 │ 157.5        │
│ 2024-01-19 │ 105.0        │
│ 2024-01-20 │ 52.5         │
└────────────┴──────────────┘
```

- Mostrar los productos con un nombre que termina con la letra 'o'.
```sql
SELECT * FROM productos WHERE (nombre LIKE '%o');
┌────┬─────────────────┬───────────┬────────┐
│ id │     nombre      │ categoria │ precio │
├────┼─────────────────┼───────────┼────────┤
│ 5  │ Pollo           │ Carnes    │ 5.5    │
│ 9  │ Queso           │ Lácteos   │ 4.0    │
│ 11 │ Papel Higiénico │ Hogar     │ 1.5    │
│ 18 │ Jabón de Baño   │ Higiene   │ 1.2    │
└────┴─────────────────┴───────────┴────────┘
```
- Encontrar los productos que han sido vendidos en más de una fecha.
NO HAY RESULTADO

- Listar los productos cuya categoría comienza con la letra 'L'.
```sql

SELECT * FROM productos WHERE (categoria LIKE 'L%');
┌────┬────────────┬───────────┬────────┐
│ id │   nombre   │ categoria │ precio │
├────┼────────────┼───────────┼────────┤
│ 2  │ Leche      │ Lácteos   │ 1.8    │
│ 6  │ Huevos     │ Lácteos   │ 1.0    │
│ 7  │ Yogurt     │ Lácteos   │ 2.0    │
│ 9  │ Queso      │ Lácteos   │ 4.0    │
│ 13 │ Detergente │ Limpieza  │ 2.8    │
└────┴────────────┴───────────┴────────┘
```
-  Mostrar los productos cuyo nombre tiene al menos 5 caracteres.

```sql
SELECT * FROM productos WHERE LENGTH(nombre) >= 5;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 1  │ Arroz              │ Alimentos │ 2.5    │
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 4  │ Manzanas           │ Frutas    │ 3.0    │
│ 5  │ Pollo              │ Carnes    │ 5.5    │
│ 6  │ Huevos             │ Lácteos   │ 1.0    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 8  │ Tomates            │ Verduras  │ 2.2    │
│ 9  │ Queso              │ Lácteos   │ 4.0    │
│ 10 │ Cereal             │ Desayuno  │ 3.5    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 18 │ Jabón de Baño      │ Higiene   │ 1.2    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
│ 20 │ Cerveza            │ Bebidas   │ 3.8    │
└────┴────────────────────┴───────────┴────────┘
```

-  Encontrar los productos que tienen un precio superior a la media en la tabla "productos".
```sql 
SELECT * from productos as p  WHERE p.precio > (SELECT AVG(precio) as precio_media FROM productos);
┌────┬─────────────────┬───────────┬────────┐
│ id │     nombre      │ categoria │ precio │
├────┼─────────────────┼───────────┼────────┤
│ 4  │ Manzanas        │ Frutas    │ 3.0    │
│ 5  │ Pollo           │ Carnes    │ 5.5    │
│ 9  │ Queso           │ Lácteos   │ 4.0    │
│ 10 │ Cereal          │ Desayuno  │ 3.5    │
│ 13 │ Detergente      │ Limpieza  │ 2.8    │
│ 15 │ Aceite de Oliva │ Cocina    │ 4.5    │
│ 16 │ Café            │ Bebidas   │ 5.0    │
│ 20 │ Cerveza         │ Bebidas   │ 3.8    │
└────┴─────────────────┴───────────┴────────┘
```