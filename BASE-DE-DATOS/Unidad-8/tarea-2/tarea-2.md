## Función calcular_precio_total_pedido
```sql
/* Nota:Dado un código de pedido la función debe calcular la suma total del pedido. Tenga en cuenta que un pedido puede contener varios productos diferentes y varias cantidades de cada producto.
Parámetros de entrada: codigo_pedido (INT)
Parámetros de salida: El precio total del pedido (FLOAT) */
DELIMITER $$
CREATE FUNCTION calcular_precio_total_pedido(
    cod_pedido INT
)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE precio_total FLOAT;
    SELECT SUM(d.cantidad * d.precio_unidad) INTO precio_total FROM
    detalle_pedido as d WHERE d.codigo_pedido = cod_pedido;
    RETURN precio_total;
END$$
DELIMITER ;

 select calcular_precio_total_pedido(2) ;
+---------------------------------+
| calcular_precio_total_pedido(2) |
+---------------------------------+
|                            7113 |
+---------------------------------+

```
## Función calcular_suma_pedidos_cliente

```sql
/* Nota:Dado un código de cliente la función debe calcular la suma total de todos los pedidos realizados por el cliente. Deberá hacer uso de la función calcular_precio_total_pedido que ha desarrollado en el apartado anterior.

Parámetros de entrada: codigo_cliente (INT)
Parámetros de salida: La suma total de todos los pedidos del cliente  */

```
## Función calcular_suma_pagos_cliente
```sql
/* Nota:Dado un código de cliente la función debe calcular la suma total de los pagos realizados por ese cliente.

Parámetros de entrada: codigo_cliente (INT)
Parámetros de salida: La suma total de todos los pagos del cliente (FLOAT) */


DELIMITER $$
CREATE FUNCTION calcular_suma_pagos_cliente(codigo_cliente INT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_pagos FLOAT;
    
    SELECT SUM(total)
    INTO total_pagos
    FROM pago as p
    WHERE p.codigo_cliente = codigo_cliente
    GROUP BY codigo_cliente;
    
    RETURN total_pagos;
END$$
DELIMITER ;


select calcular_suma_pagos_cliente(1);
+--------------------------------+
| calcular_suma_pagos_cliente(1) |
+--------------------------------+
|                           4000 |
+--------------------------------+

```
## Procedimiento calcular_pagos_pendientes

Nota:Deberá calcular los pagos pendientes de todos los clientes. Para saber si un cliente tiene algún pago pendiente deberemos calcular cuál es la cantidad de todos los pedidos y los pagos que ha realizado. Si la cantidad de los pedidos es mayor que la de los pagos entonces ese cliente tiene pagos pendientes.

Carga de datos
Realiza la carga de la BBDD de Jardineria y describe los pasos que has realizado.
