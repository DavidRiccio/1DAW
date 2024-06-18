-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.
select cli.nombre, cli.Edad from clientes as cli, ventas as v, coches as c where cl.id_cliente=v.id_cliente and c.marca='Toyota' and c.id_coche=v.id_coche;
/**
┌────────────┬──────┐
│   nombre   │ edad │
├────────────┼──────┤
│ Juan Pérez │ 30   │
└────────────┴──────┘
**/
-- Consulta para calcular el precio promedio de los coches vendidos.
select ROUND(AVG(precio), 2) as "Precio Promedio" from coches as c, clientes as cli, ventas as v where cli.id_cliente=v.id_cliente and c.id_coche=v.id_coche;
/**
┌─────────────────┐
│ Precio Promedio │
├─────────────────┤
│ 28777.78        │
└─────────────────┘
**/
-- Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.
select c.modelo, c.marca from coches as c, ventas as v, clientes as cli where cli.edad<30 and cli.id_cliente=v.id_cliente and c.id_coche=v.id_coche;
/**
┌────────────────┬───────────┐
│     modelo     │   marca   │
├────────────────┼───────────┤
│ Hatchback 2021 │ Honda     │
│ Coupé 2022     │ Chevrolet │
│ Híbrido 2022   │ Hyundai   │
│ Eléctrico 2021 │ Tesla     │
└────────────────┴───────────┘
**/
-- Consulta para contar el número de coches vendidos de cada marca.
select c.marca, COUNT(v.id_coche) as "Ventas por marca" from ventas as v, coches as c where v.id_coche=c.id_coche group by v.id_coche;
/**
┌────────────┬──────────────────┐
│   marca    │ Ventas por marca │
├────────────┼──────────────────┤
│ Toyota     │ 1                │
│ Honda      │ 1                │
│ Ford       │ 1                │
│ Chevrolet  │ 1                │
│ Nissan     │ 1                │
│ Volkswagen │ 1                │
│ Hyundai    │ 1                │
│ Mazda      │ 1                │
│ Tesla      │ 1                │
└────────────┴──────────────────┘
**/
-- Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.
select cli.nombre, cli.direccion from clientes as cli, reparación as r where cli.id_cliente=r.id_cliente and r.fecha_reparación regexp '2024';
/**
┌─────────────────┬────────────────┐
│     nombre      │   direccion    │
├─────────────────┼────────────────┤
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
│ Juan Pérez      │ Calle A #123   │
│ María Gómez     │ Avenida B #456 │
│ Carlos López    │ Calle C #789   │
│ Ana Martínez    │ Avenida D #101 │
│ Pedro Rodríguez │ Calle E #234   │
│ Laura Sánchez   │ Avenida F #567 │
│ Miguel González │ Calle G #890   │
│ Isabel Díaz     │ Avenida H #111 │
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
└─────────────────┴────────────────┘
**/
-- Consulta para calcular el total gastado en reparaciones por cada cliente.
/**
???
**/
-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.
select cli.nombre, cli.edad from clientes as cli, ventas as v, coches as c where cli.id_cliente=v.id_cliente and c.precio>30000 and c.id_coche=v.id_coche;
/**
┌─────────────────┬──────┐
│     nombre      │ edad │
├─────────────────┼──────┤
│ Pedro Rodríguez │ 40   │
│ Isabel Díaz     │ 38   │
│ Elena Torres    │ 29   │
└─────────────────┴──────┘
**/
-- Consulta para calcular el precio medio de los coches vendidos en 2023.
select ROUND(AVG(precio), 2) as "Precio Promedio 2023" from coches as c, clientes as cli, ventas as v where cli.id_cliente=v.id_cliente and c.id_coche=v.id_coche and v.fecha_venta regexp '2023';
/**
┌──────────────────────┐
│ Precio Promedio 2023 │
├──────────────────────┤
│ 28777.78             │
└──────────────────────┘
**/
-- Consulta para obtener el nombre y la dirección de los cliientes que han comprado coches de la marca Ford.
select cli.nombre, cli.direccion from cliientes as cli, ventas as v, coches as c where cli.id_cliente=v.id_cliente and c.marca='Ford' and c.id_coche=v.id_coche;
/**
┌──────────────┬──────────────┐
│    nombre    │  direccion   │
├──────────────┼──────────────┤
│ Carlos López │ Calle C #789 │
└──────────────┴──────────────┘
**/
-- Consulta para contar el número de coches vendidos por año.
select strftime('%Y', fecha_venta) as año, COUNT(id_coche) as "Ventas por año" from ventas group by año order by año ASC;
/**
┌──────┬────────────────┐
│ año  │ Ventas por año │
├──────┼────────────────┤
│ 2023 │ 9              │
└──────┴────────────────┘
**/
-- Consulta para obtener el nombre y la edad de los cliientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.
select cli.nombre, cli.edad from cliientes as cli, ventas as v, coches as c, reparación as r where cli.id_cliente=v.id_cliente and c.precio>30000 and c.id_coche=v.id_coche and cli.id_cliente=r.id_cliente;
/**
┌─────────────────┬──────┐
│     nombre      │ edad │
├─────────────────┼──────┤
│ Pedro Rodríguez │ 40   │
│ Isabel Díaz     │ 38   │
│ Elena Torres    │ 29   │
│ Pedro Rodríguez │ 40   │
│ Isabel Díaz     │ 38   │
│ Elena Torres    │ 29   │
└─────────────────┴──────┘
**/
-- Consulta para calcular el precio total de los coches vendidos a cliientes menores de 30 años.
select SUM(c.precio) as "Precio total" from coches as c, ventas as v, cliientes as cli where cli.edad<30 and cli.id_cliente=v.id_cliente and c.id_coche=v.id_coche;
/**
┌───────────────┐
│ SUM(c.precio) │
├───────────────┤
│ 117000.0      │
└───────────────┘
**/
-- Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.
select c.modelo, c.marca from coches as c, ventas as v, reparación as r where c.id_coche=v.id_coche and c.id_coche=r.id_coche and v.fecha_venta regexp '2023';
/**
┌────────────────┬────────────┐
│     modelo     │   marca    │
├────────────────┼────────────┤
│ Sedán 2022     │ Toyota     │
│ SUV 2023       │ Ford       │
│ Camioneta 2023 │ Nissan     │
│ Hatchback 2021 │ Honda      │
│ Coupé 2022     │ Chevrolet  │
│ Híbrido 2022   │ Hyundai    │
│ Compacto 2021  │ Volkswagen │
│ Deportivo 2023 │ Mazda      │
│ Eléctrico 2021 │ Tesla      │
│ SUV 2023       │ Ford       │
│ Hatchback 2021 │ Honda      │
│ Coupé 2022     │ Chevrolet  │
│ Camioneta 2023 │ Nissan     │
│ Compacto 2021  │ Volkswagen │
│ Deportivo 2023 │ Mazda      │
│ Eléctrico 2021 │ Tesla      │
│ Sedán 2022     │ Toyota     │
│ SUV 2023       │ Ford       │
│ Coupé 2022     │ Chevrolet  │
└────────────────┴────────────┘
**/
-- Consulta para contar el número de coches vendidos por cliiente.
select v.id_cliente, COUNT(*) as "Coches vendidos" from coches as c, ventas as v where c.id_coche=v.id_coche group by v.id_cliente;
/**
┌────────────┬─────────────────┐
│ id_cliente │ Coches vendidos │
├────────────┼─────────────────┤
│ 1          │ 1               │
│ 2          │ 1               │
│ 3          │ 1               │
│ 4          │ 1               │
│ 5          │ 1               │
│ 6          │ 1               │
│ 7          │ 1               │
│ 8          │ 1               │
│ 10         │ 1               │
└────────────┴─────────────────┘
**/
-- Consulta para obtener el nombre y el precio de los coches vendidos a cliientes mayores de 35 años.
select cli.nombre, c.precio from coches as c, ventas as v, cliientes as cli where cli.edad>35 and cli.id_cliente=v.id_cliente and c.id_coche=v.id_coche;
/**
┌─────────────────┬─────────┐
│     nombre      │ precio  │
├─────────────────┼─────────┤
│ Pedro Rodríguez │ 32000.0 │
│ Isabel Díaz     │ 35000.0 │
└─────────────────┴─────────┘
**/
-- Consulta para calcular el precio total de los coches vendidos a cliientes que viven en una calle (en la dirección).
select SUM(c.precio) as "Precio total" from coches as c, ventas as v, cliientes as cli where cli.id_cliente=v.id_cliente and c.id_coche=v.id_coche and cli.direccion regexp '[cC]alle';
/**
┌──────────────┐
│ Precio total │
├──────────────┤
│ 114000.0     │
└──────────────┘
**/
-- Consulta para obtener el nombre y la dirección de los cliientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.
select cli.nombre, cli.direccion from coches as c, ventas as v, reparación as r, cliientes as cli 
where c.id_coche=v.id_coche 
and c.precio>30000 
and cli.id_cliente=v.id_cliente 
and c.id_coche=r.id_coche 
and r.fecha_reparación regexp '2024';
/**
┌─────────────────┬────────────────┐
│     nombre      │   direccion    │
├─────────────────┼────────────────┤
│ Elena Torres    │ Avenida J #333 │
│ Pedro Rodríguez │ Calle E #234   │
│ Isabel Díaz     │ Avenida H #111 │
│ Elena Torres    │ Avenida J #333 │
└─────────────────┴────────────────┘
**/
-- Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por cliientes menores de 30 años.
select ROUND(AVG(precio), 2) as "Precio medio" from coches as c, ventas as v, reparación as r, cliientes as cli 
where c.id_coche=v.id_coche 
and cli.edad<30 
and cli.id_cliente=v.id_cliente 
and c.id_coche=r.id_coche 
and v.fecha_venta regexp '2023';
/**
┌──────────────┐
│ Precio medio │
├──────────────┤
│ 29375.0      │
└──────────────┘
**/
-- Consulta para obtener el modelo y el año de los coches vendidos por cliientes que tienen una dirección que contiene la palabra "Avenida".
select c.modelo, c.año from coches as c, ventas as v, cliientes as cli where cli.id_cliente=v.id_cliente and c.id_coche=v.id_coche and cli.direccion regexp '[Aa]venida';
/**
┌────────────────┬──────┐
│     modelo     │ año  │
├────────────────┼──────┤
│ Hatchback 2021 │ 2021 │
│ Coupé 2022     │ 2022 │
│ Compacto 2021  │ 2021 │
│ Deportivo 2023 │ 2023 │
│ Eléctrico 2021 │ 2021 │
└────────────────┴──────┘
**/
-- Consulta para contar el número de reparaciones realizadas en 2024 por cada cliiente.
select cli.id_cliente, COUNT(*) as "Numero reparaciones" from cliientes as cli, reparación as r where cl.id_cliente=r.id_cliente and fecha_reparación regexp '2024' group by r.id_cliente;
/**
┌────────────┬─────────────────────┐
│ id_cliente │ Numero reparaciones │
├────────────┼─────────────────────┤
│ 1          │ 1                   │
│ 2          │ 1                   │
│ 3          │ 1                   │
│ 4          │ 1                   │
│ 5          │ 1                   │
│ 6          │ 1                   │
│ 7          │ 1                   │
│ 8          │ 1                   │
│ 9          │ 2                   │
│ 10         │ 2                   │
└────────────┴─────────────────────┘
**