 --Consultas sobre una tabla

    --Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select * from pedido order by fecha desc;
/*
┌───────────┬─────────┬────────────┬────────────┬──────────────┐
│ id_pedido │  total  │   fecha    │ id_cliente │ id_comercial │
├───────────┼─────────┼────────────┼────────────┼──────────────┤
│ 15        │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 16        │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 13        │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 8         │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 1         │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 3         │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 5         │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 12        │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 14        │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 9         │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 2         │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 4         │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 11        │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 6         │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 7         │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 10        │ 250.45  │ 2015-06-27 │ 8          │ 2            │
└───────────┴─────────┴────────────┴────────────┴──────────────┘
*/
    --Devuelve todos los datos de los dos pedidos de mayor valor.
select * from pedido order by total desc limit 2;
/*
┌───────────┬────────┬────────────┬────────────┬──────────────┐
│ id_pedido │ total  │   fecha    │ id_cliente │ id_comercial │
├───────────┼────────┼────────────┼────────────┼──────────────┤
│ 7         │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12        │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└───────────┴────────┴────────────┴────────────┴──────────────┘
*/
    --Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
 select DISTINCT id_cliente from pedido ;
 /*
┌────────────┐
│ id_cliente │
├────────────┤
│ 5          │
│ 1          │
│ 2          │
│ 8          │
│ 7          │
│ 4          │
│ 3          │
│ 6          │
└────────────┘
*/
    --Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
    SELECT * FROM PEDIDO WHERE fecha REGEXP '2017' and total > 500;
    /*
┌───────────┬─────────┬────────────┬────────────┬──────────────┐
│ id_pedido │  total  │   fecha    │ id_cliente │ id_comercial │
├───────────┼─────────┼────────────┼────────────┼──────────────┤
│ 5         │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 8         │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 12        │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└───────────┴─────────┴────────────┴────────────┴──────────────┘
*/

    --Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
select nombre, apellido1 from comercial where categoria BETWEEN 0.05 and 0.11;
/*
┌─────────┬───────────┐
│ nombre  │ apellido1 │
├─────────┼───────────┤
│ Diego   │ Flores    │
│ Antonio │ Vega      │
│ Alfredo │ Ruiz      │
└─────────┴───────────┘

*/

    --Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
    select max(categoria) as comision_maxima from comercial ;
    /*
    ┌─────────────────┐
    │ comision_maxima │
    ├─────────────────┤
    │ 0.15            │
    └─────────────────┘
*/
    --Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
select id, nombre, apellido1 from cliente where apellido2 is not null order by nombre;
/*
┌────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 1  │ Aarón     │ Rivero    │
│ 2  │ Adela     │ Salas     │
│ 3  │ Adolfo    │ Rubio     │
│ 10 │ Daniel    │ Santana   │
│ 9  │ Guillermo │ López     │
│ 5  │ Marcos    │ Loyola    │
│ 6  │ María     │ Santana   │
│ 8  │ Pepe      │ Ruiz      │
└────┴───────────┴───────────┘
*/
    --Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
 select * from cliente where nombre REGEXP '^A' and nombre REGEXP 'n$' or nombre REGEXP '^P' order by nombre;
 /*
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘
*/
    --Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
select * from cliente where nombre not REGEXP '^A' order by nombre;
/*
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │
│ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 7  │ Pilar     │ Ruiz      │           │ Sevilla │ 300       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
*/
    --Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
select DISTINCT nombre from comercial where nombre REGEXP 'o$';
/*
┌─────────┐
│ nombre  │
├─────────┤
│ Diego   │
│ Antonio │
│ Alfredo │
└─────────┘
*/
--Consultas multitabla

   -- Nota: Resuelva todas las consultas utilizando las cláusulas INNER JOIN.

    --Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
    select DISTINCT c.id,c.nombre,c.apellido1,c.apellido2 from cliente as c join pedido as p on p.id_cliente=c.id order by nombre;
    /*
┌────┬────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │
├────┼────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │
│ 2  │ Adela  │ Salas     │ Díaz      │
│ 3  │ Adolfo │ Rubio     │ Flores    │
│ 4  │ Adrián │ Suárez    │           │
│ 5  │ Marcos │ Loyola    │ Méndez    │
│ 6  │ María  │ Santana   │ Moreno    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │
│ 7  │ Pilar  │ Ruiz      │           │
└────┴────────┴───────────┴───────────┘
*/
    --Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
elect p.*, c.* from pedido as p join cliente as c on p.id_cliente=c.id order by c.nombre;
/*
┌───────────┬─────────┬────────────┬────────────┬──────────────┬────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id_pedido │  total  │   fecha    │ id_cliente │ id_comercial │ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├───────────┼─────────┼────────────┼────────────┼──────────────┼────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 2         │ 270.65  │ 2016-09-10 │ 1          │ 5            │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
│ 15        │ 370.85  │ 2019-03-11 │ 1          │ 5            │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
│ 16        │ 2389.23 │ 2019-03-11 │ 1          │ 5            │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
│ 3         │ 65.26   │ 2017-10-05 │ 2          │ 1            │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │
│ 7         │ 5760.0  │ 2015-09-10 │ 2          │ 1            │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │
│ 12        │ 3045.6  │ 2017-04-25 │ 2          │ 1            │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │
│ 11        │ 75.29   │ 2016-08-17 │ 3          │ 7            │ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │
│ 8         │ 1983.43 │ 2017-10-10 │ 4          │ 6            │ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │
│ 1         │ 150.5   │ 2017-10-05 │ 5          │ 2            │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
│ 5         │ 948.5   │ 2017-09-10 │ 5          │ 2            │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
│ 13        │ 545.75  │ 2019-01-25 │ 6          │ 1            │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 14        │ 145.82  │ 2017-02-02 │ 6          │ 1            │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 4         │ 110.5   │ 2016-08-17 │ 8          │ 3            │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 9         │ 2480.4  │ 2016-10-10 │ 8          │ 3            │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 10        │ 250.45  │ 2015-06-27 │ 8          │ 2            │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 6         │ 2400.6  │ 2016-07-27 │ 7          │ 1            │ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │
└───────────┴─────────┴────────────┴────────────┴──────────────┴────┴────────┴───────────┴───────────┴─────────┴───────────┘
*/
    --Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
select c.id_comercial,c.nombre,c.apellido1,c.apellido2 from comercial as c join pedido as p on p.id_comercial=c.id_comercial order by c.nombre;/*
┌──────────────┬─────────┬───────────┬───────────┐
│ id_comercial │ nombre  │ apellido1 │ apellido2 │
├──────────────┼─────────┼───────────┼───────────┤
│ 5            │ Antonio │ Carretero │ Ortega    │
│ 7            │ Antonio │ Vega      │ Hernández │
│ 5            │ Antonio │ Carretero │ Ortega    │
│ 5            │ Antonio │ Carretero │ Ortega    │
│ 1            │ Daniel  │ Sáez      │ Vega      │
│ 1            │ Daniel  │ Sáez      │ Vega      │
│ 1            │ Daniel  │ Sáez      │ Vega      │
│ 1            │ Daniel  │ Sáez      │ Vega      │
│ 1            │ Daniel  │ Sáez      │ Vega      │
│ 1            │ Daniel  │ Sáez      │ Vega      │
│ 3            │ Diego   │ Flores    │ Salas     │
│ 3            │ Diego   │ Flores    │ Salas     │
│ 2            │ Juan    │ Gómez     │ López     │
│ 2            │ Juan    │ Gómez     │ López     │
│ 2            │ Juan    │ Gómez     │ López     │
│ 6            │ Manuel  │ Domínguez │ Hernández │
└──────────────┴─────────┴───────────┴───────────┘
*/
    --Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
select c.id, c.nombre,p.id_pedido, co.* from cliente as c, comercial as co join pedido as p on c.id=p.id_cliente and co.id_comercial=p.id_comercial;/*
┌────┬────────┬───────────┬──────────────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre │ id_pedido │ id_comercial │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼────────┼───────────┼──────────────┼─────────┼───────────┼───────────┼───────────┤
│ 5  │ Marcos │ 1         │ 2            │ Juan    │ Gómez     │ López     │ 0.13      │
│ 1  │ Aarón  │ 2         │ 5            │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 2  │ Adela  │ 3         │ 1            │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 8  │ Pepe   │ 4         │ 3            │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 5  │ Marcos │ 5         │ 2            │ Juan    │ Gómez     │ López     │ 0.13      │
│ 7  │ Pilar  │ 6         │ 1            │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 2  │ Adela  │ 7         │ 1            │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 4  │ Adrián │ 8         │ 6            │ Manuel  │ Domínguez │ Hernández │ 0.13      │
│ 8  │ Pepe   │ 9         │ 3            │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 8  │ Pepe   │ 10        │ 2            │ Juan    │ Gómez     │ López     │ 0.13      │
│ 3  │ Adolfo │ 11        │ 7            │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 2  │ Adela  │ 12        │ 1            │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ María  │ 13        │ 1            │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ María  │ 14        │ 1            │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 1  │ Aarón  │ 15        │ 5            │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 1  │ Aarón  │ 16        │ 5            │ Antonio │ Carretero │ Ortega    │ 0.12      │
└────┴────────┴───────────┴──────────────┴─────────┴───────────┴───────────┴───────────┘
*/
    --Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
select c.nombre,p.total,p.fecha from cliente as c join pedido as p on c.id=p.id_cliente and fecha REGEXP '2017' and total BETWEEN 300 and 1000; /*
┌────────┬───────┬────────────┐
│ nombre │ total │   fecha    │
├────────┼───────┼────────────┤
│ Marcos │ 948.5 │ 2017-09-10 │
└────────┴───────┴────────────┘
*/
    --Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.

    --Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.

--Consultas resumen (Funciones)

    --Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select sum(total) from pedido ;/*
┌────────────┐
│ sum(total) │
├────────────┤
│ 20992.83   │
└────────────┘
*/
    --Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select avg(total) from pedido ;/*
┌─────────────┐
│ avg(total)  │
├─────────────┤
│ 1312.051875 │
└─────────────┘
*/
    --Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
select count(DISTINCT id_comercial) as comerciales_distintos from pedido;/*
┌───────────────────────┐
│ comerciales_distintos │
├───────────────────────┤
│ 6                     │
└───────────────────────┘
*/
    --Calcula el número total de clientes que aparecen en la tabla cliente.
select count(id) from cliente;/*
┌───────────┐
│ count(id) │
├───────────┤
│ 10        │
└───────────┘
*/
    --Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
 select max(total) from pedido;/*
┌────────────┐
│ max(total) │
├────────────┤
│ 5760.0     │
└────────────┘
*/
    --Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select min(total) from pedido;/*
┌────────────┐
│ min(total) │
├────────────┤
│ 65.26      │
└────────────┘
*/
    --Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
select ciudad,max(categoria) from cliente group by ciudad;/*
┌─────────┬────────────────┐
│ ciudad  │ max(categoria) │
├─────────┼────────────────┤
│ Almería │ 200            │
│ Cádiz   │ 100            │
│ Granada │ 225            │
│ Huelva  │ 200            │
│ Jaén    │ 300            │
│ Sevilla │ 300            │
└─────────┴────────────────┘
*/
    --Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.

SELECT c.nombre, c.apellido1 || ' ' || c.apellido2 as apellidos, p.fecha, p.total, MAX(p.total) from cliente c  JOIN pedido p on p.id_cliente=c.id GROUP BY fecha;
   /*
┌────────┬────────────────┬────────────┬─────────┬──────────────┐
│ nombre │   apellidos    │   fecha    │  total  │ MAX(p.total) │
├────────┼────────────────┼────────────┼─────────┼──────────────┤
│ Pepe   │ Ruiz Santana   │ 2015-06-27 │ 250.45  │ 250.45       │
│ Adela  │ Salas Díaz     │ 2015-09-10 │ 5760.0  │ 5760.0       │
│ Pilar  │                │ 2016-07-27 │ 2400.6  │ 2400.6       │
│ Pepe   │ Ruiz Santana   │ 2016-08-17 │ 110.5   │ 110.5        │
│ Aarón  │ Rivero Gómez   │ 2016-09-10 │ 270.65  │ 270.65       │
│ Pepe   │ Ruiz Santana   │ 2016-10-10 │ 2480.4  │ 2480.4       │
│ María  │ Santana Moreno │ 2017-02-02 │ 145.82  │ 145.82       │
│ Adela  │ Salas Díaz     │ 2017-04-25 │ 3045.6  │ 3045.6       │
│ Marcos │ Loyola Méndez  │ 2017-09-10 │ 948.5   │ 948.5        │
│ Marcos │ Loyola Méndez  │ 2017-10-05 │ 150.5   │ 150.5        │
│ Adrián │                │ 2017-10-10 │ 1983.43 │ 1983.43      │
│ María  │ Santana Moreno │ 2019-01-25 │ 545.75  │ 545.75       │
│ Aarón  │ Rivero Gómez   │ 2019-03-11 │ 2389.23 │ 2389.23      │
└────────┴────────────────┴────────────┴─────────┴──────────────┘
*/
    --Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
SELECT c.id, c.nombre, p.fecha, MAX(total) as maximo_total from cliente c  JOIN pedido p on p.id_cliente=c.id  WHERE total > 2000 GROUP BY p.id_cliente, strftime('%Y-%m-%d', fecha);/*
┌────┬────────┬────────────┬──────────────┐
│ id │ nombre │   fecha    │ maximo_total │
├────┼────────┼────────────┼──────────────┤
│ 1  │ Aarón  │ 2019-03-11 │ 2389.23      │
│ 2  │ Adela  │ 2015-09-10 │ 5760.0       │
│ 2  │ Adela  │ 2017-04-25 │ 3045.6       │
│ 7  │ Pilar  │ 2016-07-27 │ 2400.6       │
│ 8  │ Pepe   │ 2016-10-10 │ 2480.4       │
└────┴────────┴────────────┴──────────────┘
*/
    --Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
select max(p.total),co.id_comercial,co.nombre,co.apellido1 from pedido as p join comercial as co on p.id_comercial=co.id_comercial and p.fecha='2016-08-17';/*
┌──────────────┬──────────────┬────────┬───────────┐
│ max(p.total) │ id_comercial │ nombre │ apellido1 │
├──────────────┼──────────────┼────────┼───────────┤
│ 110.5        │ 3            │ Diego  │ Flores    │
└──────────────┴──────────────┴────────┴───────────┘
*/
    --Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
select c.id,c.nombre,c.apellido1,p.id_pedido from cliente as c join pedido as p on p.id_cliente=c.id group by c.id;
/* ;
┌────┬────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ id_pedido │
├────┼────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ 2         │
│ 2  │ Adela  │ Salas     │ 3         │
│ 3  │ Adolfo │ Rubio     │ 11        │
│ 4  │ Adrián │ Suárez    │ 8         │
│ 5  │ Marcos │ Loyola    │ 1         │
│ 6  │ María  │ Santana   │ 13        │
│ 7  │ Pilar  │ Ruiz      │ 6         │
│ 8  │ Pepe   │ Ruiz      │ 4         │
└────┴────────┴───────────┴───────────┘
*/
    --Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
select c.id,c.nombre,c.apellido1,p.id_pedido from cliente as c join pedido as p on p.id_cliente=c.id and p.fecha REGEXP '2017';/*
┌────┬────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ id_pedido │
├────┼────────┼───────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ 1         │
│ 2  │ Adela  │ Salas     │ 3         │
│ 5  │ Marcos │ Loyola    │ 5         │
│ 4  │ Adrián │ Suárez    │ 8         │
│ 2  │ Adela  │ Salas     │ 12        │
│ 6  │ María  │ Santana   │ 14        │
└────┴────────┴───────────┴───────────┘
*/
    --Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.
select max(p.total) from pedido as p group by strftime('%y',p.fecha);/*
┌──────────────┐
│ max(p.total) │
├──────────────┤
│ 5760.0       │
└──────────────┘
*/
    --Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select strftime('%Y',fecha), count(id_pedido) from pedido group by strftime('%Y',fecha);/*
┌──────────────────────┬──────────────────┐
│ strftime('%Y',fecha) │ count(id_pedido) │
├──────────────────────┼──────────────────┤
│ 2015                 │ 2                │
│ 2016                 │ 5                │
│ 2017                 │ 6                │
│ 2019                 │ 3                │
└──────────────────────┴──────────────────┘
*/
    --Devuelve el número total de pedidos que se han realizado cada año.

--Subconsultas Con operadores básicos de comparación

    --Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

SELECT * FROM pedido WHERE id_cliente IN (SELECT id FROM cliente WHERE nombre = 'Adela' and apellido1 = 'Salas' and apellido2 = 'Díaz');/*
┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1            │
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘
*/
    --Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)

SELECT count(*) FROM pedido WHERE id_comercial=(SELECT id_comercial FROM comercial WHERE nombre='Daniel' and apellido1 = 'Sáez' and apellido2 = 'Vega')/*
   ...> ;
┌──────────┐
│ count(*) │
├──────────┤
│ 6        │
└──────────┘
*/
*/
    --Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)

 SELECT * FROM cliente  WHERE id in (SELECT id_cliente FROM pedido WHERE strftime('2019', fecha) ORDER BY total DESC LIMIT 1);  
 /*
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘
*/
    --Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT fecha, MIN(total) as minimo_pedido from pedido where id_cliente in (SELECT id from cliente WHERE nombre='Pepe' and apellido1='Ruiz' and apellido2='Santana');  /*
┌────────────┬───────────────┐
│   fecha    │ minimo_pedido │
├────────────┼───────────────┤
│ 2016-08-17 │ 110.5         │
└────────────┴───────────────┘
*/
    --Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
SELECT c.*, p.* from cliente c JOIN pedido p on p.id_cliente=c.id WHERE p.total >= (SELECT AVG(total) from pedido)  GROUP BY strftime('2017',p.fecha); /*
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬────────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼────────┼────────────┼────────────┼──────────────┤
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6 │ 2016-07-27 │ 7          │ 1            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴────────┴────────────┴────────────┴──────────────┘
*/
--Subconsultas con IN y NOT IN

    --Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT * from pedido WHERE id_cliente not in (SELECT id FROM cliente);/*

*/
    --Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT * from pedido WHERE id_comercial not in (SELECT id_comercial FROM comercial); /**/
--Subconsultas con EXISTS y NOT EXISTS

    --Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

SELECT * from cliente c WHERE NOT EXISTS ( 
(x1...> SELECT 1
(x1...> FROM pedido p
(x1...> WHERE p.id_cliente=c.id);/*
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘*/

    --Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * from comercial WHERE NOT EXISTS (   
(x1...> SELECT 1      
(x1...> FROM pedido p
(x1...> WHERE p.id_comercial=comercial.id_comercial);/*
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘*/