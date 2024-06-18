-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?
select c.modelo, c.precio, cl.nombre from clientes as cl, coches as c, ventas as v where c.id_coche=cl.id_cliente=v.id_venta;
/*┌────────────────┬─────────┬─────────────────┐
│     modelo     │ precio  │     nombre      │
├────────────────┼─────────┼─────────────────┤
│ Sedán 2022     │ 25000.0 │ Juan Pérez      │
│ Hatchback 2021 │ 22000.0 │ María Gómez     │
│ SUV 2023       │ 30000.0 │ Carlos López    │
│ Coupé 2022     │ 28000.0 │ Ana Martínez    │
│ Camioneta 2023 │ 32000.0 │ Pedro Rodríguez │
│ Compacto 2021  │ 20000.0 │ Laura Sánchez   │
│ Híbrido 2022   │ 27000.0 │ Miguel González │
│ Deportivo 2023 │ 35000.0 │ Isabel Díaz     │
│ Pickup 2022    │ 31000.0 │ Francisco Ruiz  │
│ Eléctrico 2021 │ 40000.0 │ Elena Torres    │
└────────────────┴─────────┴─────────────────┘
*/

-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)
 select cl.nombre,c.precio from clientes as cl, coches as c where c.precio>(select avg(precio) from coches) and c.id_coche=cl.id_cliente;
 /*
┌─────────────────┬─────────┐
│     nombre      │ precio  │
├─────────────────┼─────────┤
│ Carlos López    │ 30000.0 │
│ Pedro Rodríguez │ 32000.0 │
│ Isabel Díaz     │ 35000.0 │
│ Francisco Ruiz  │ 31000.0 │
│ Elena Torres    │ 40000.0 │
└─────────────────┴─────────┘
*/
-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:
--NO VA
select c.modelo, c.precio from coches as c, ventas as v where c.id_coche not in ventas;

  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas

-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?
select cl.nombre, v.fecha_venta from clientes as cl, ventas as v where cl.id_cliente=v.id_cliente order by v.fecha_venta DESC;
/*
┌─────────────────┬─────────────┐
│     nombre      │ fecha_venta │
├─────────────────┼─────────────┤
│ Elena Torres    │ 2023-10-05  │
│ Isabel Díaz     │ 2023-08-25  │
│ Miguel González │ 2023-07-20  │
│ Laura Sánchez   │ 2023-06-15  │
│ Pedro Rodríguez │ 2023-05-05  │
│ Ana Martínez    │ 2023-04-10  │
│ Carlos López    │ 2023-03-25  │
│ María Gómez     │ 2023-02-20  │
│ Juan Pérez      │ 2023-01-15  │
└─────────────────┴─────────────┘
*/
-- Encontrar el modelo de coche más caro que ha sido reparado al menos una vez.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
 select c.nombre, c.id_cliente, v.id_coche from clientes as c, ventas as v where v.id_coche=1 and v.id_cliente=v.id_coche;
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio
