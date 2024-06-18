# Consultas a Realizar

## Consultas SQL sobre una tabla

### Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
```sql

SELECT codigo_oficina, ciudad FROM oficina;
┌────────────────┬──────────────────────┐
│ codigo_oficina │        ciudad        │
├────────────────┼──────────────────────┤
│ BCN-ES         │ Barcelona            │
│ BOS-USA        │ Boston               │
│ LON-UK         │ Londres              │
│ MAD-ES         │ Madrid               │
│ PAR-FR         │ Paris                │
│ SFC-USA        │ San Francisco        │
│ SYD-AU         │ Sydney               │
│ TAL-ES         │ Talavera de la Reina │
│ TOK-JP         │ Tokyo                │
└────────────────┴──────────────────────┘

```

### Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

```sql
SELECT ciudad, telefono FROM oficina     
   ...> WHERE codigo_oficina regexp 'ES';
┌──────────────────────┬────────────────┐
│        ciudad        │    telefono    │
├──────────────────────┼────────────────┤
│ Barcelona            │ +34 93 3561182 │
│ Madrid               │ +34 91 7514487 │
│ Talavera de la Reina │ +34 925 867231 │
└──────────────────────┴────────────────┘

```

### Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

```sql

SELECT nombre, apellido1 || ' ' || apellido2 as apellidos, email FROM empleado
   ...> WHERE codigo_jefe = 7;
┌─────────┬───────────────────┬──────────────────────────┐
│ nombre  │     apellidos     │          email           │
├─────────┼───────────────────┼──────────────────────────┤
│ Mariano │ López Murcia      │ mlopez@jardineria.es     │
│ Lucio   │ Campoamor Martín  │ lcampoamor@jardineria.es │
│ Hilario │ Rodriguez Huertas │ hrodriguez@jardineria.es │
└─────────┴───────────────────┴──────────────────────────┘

```

### Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

```sql

SELECT nombre, apellido1 || ' ' || apellido2 as apellidos, email FROM empleado
   ...> WHERE puesto = 'Director General';
┌────────┬──────────────┬──────────────────────┐
│ nombre │  apellidos   │        email         │
├────────┼──────────────┼──────────────────────┤
│ Marcos │ Magaña Perez │ marcos@jardineria.es │
└────────┴──────────────┴──────────────────────┘

```

### Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

```sql
SELECT nombre, apellido1 || ' ' || apellido2 as apellidos, puesto FROM empleado
   ...> WHERE puesto not REGEXP 'Representante Ventas';  
┌──────────┬────────────────┬───────────────────────┐
│  nombre  │   apellidos    │        puesto         │
├──────────┼────────────────┼───────────────────────┤
│ Marcos   │ Magaña Perez   │ Director General      │
│ Ruben    │ López Martinez │ Subdirector Marketing │
│ Alberto  │ Soria Carrasco │ Subdirector Ventas    │
│ Maria    │ Solís Jerez    │ Secretaria            │
│ Carlos   │ Soria Jimenez  │ Director Oficina      │
│ Emmanuel │ Magaña Perez   │ Director Oficina      │
│ Francois │ Fignon         │ Director Oficina      │
│ Michael  │ Bolton         │ Director Oficina      │
│ Hilary   │ Washington     │ Director Oficina      │
│ Nei      │ Nishikori      │ Director Oficina      │
│ Amy      │ Johnson        │ Director Oficina      │
│ Kevin    │ Fallmer        │ Director Oficina      │
└──────────┴────────────────┴───────────────────────┘
```

### Devuelve un listado con el nombre de los todos los clientes españoles.

```sql

SELECT nombre_cliente from cliente 
   ...> WHERE pais = 'Spain';
┌────────────────────────────────┐
│         nombre_cliente         │
├────────────────────────────────┤
│ Lasas S.A.                     │
│ Beragua                        │
│ Club Golf Puerta del hierro    │
│ Naturagua                      │
│ DaraDistribuciones             │
│ Madrileña de riegos            │
│ Lasas S.A.                     │
│ Camunas Jardines S.L.          │
│ Dardena S.A.                   │
│ Jardin de Flores               │
│ Flores Marivi                  │
│ Flowers, S.A                   │
│ Naturajardin                   │
│ Golf S.A.                      │
│ Americh Golf Management SL     │
│ Aloha                          │
│ El Prat                        │
│ Sotogrande                     │
│ Vivero Humanes                 │
│ Fuenla City                    │
│ Jardines y Mansiones Cactus SL │
│ Jardinerías Matías SL          │
│ Agrojardin                     │
│ Top Campo                      │
│ Jardineria Sara                │
│ Campohermoso                   │
│ Flores S.L.                    │
└────────────────────────────────┘

```

### Devuelve un listado con los distintos estados por los que puede pasar un pedido.
```sql
SELECT DISTINCT estado from pedido; 
┌───────────┐
│  estado   │
├───────────┤
│ Entregado │
│ Rechazado │
│ Pendiente │
└───────────┘

```
### Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.

```sql

select DISTINCT codigo_cliente from pago 
   ...> where fecha_pago REGEXP '2008'; 
┌────────────────┐
│ codigo_cliente │
├────────────────┤
│ 1              │
│ 13             │
│ 14             │
│ 26             │
└────────────────┘
```

### Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

```sql

 SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM pedido
   ...> WHERE  fecha_esperada < fecha_entrega; 
┌───────────────┬────────────────┬────────────────┬───────────────┐
│ codigo_pedido │ codigo_cliente │ fecha_esperada │ fecha_entrega │
├───────────────┼────────────────┼────────────────┼───────────────┤
│ 9             │ 1              │ 2008-12-27     │ 2008-12-28    │
│ 13            │ 7              │ 2009-01-14     │ 2009-01-15    │
│ 16            │ 7              │ 2009-01-07     │ 2009-01-15    │
│ 17            │ 7              │ 2009-01-09     │ 2009-01-11    │
│ 18            │ 9              │ 2009-01-06     │ 2009-01-07    │
│ 22            │ 9              │ 2009-01-11     │ 2009-01-13    │
│ 28            │ 3              │ 2009-02-17     │ 2009-02-20    │
│ 31            │ 13             │ 2008-09-30     │ 2008-10-04    │
│ 32            │ 4              │ 2007-01-19     │ 2007-01-27    │
│ 38            │ 19             │ 2009-03-06     │ 2009-03-07    │
│ 39            │ 19             │ 2009-03-07     │ 2009-03-09    │
│ 40            │ 19             │ 2009-03-10     │ 2009-03-13    │
│ 42            │ 19             │ 2009-03-23     │ 2009-03-27    │
│ 43            │ 23             │ 2009-03-26     │ 2009-03-28    │
│ 44            │ 23             │ 2009-03-27     │ 2009-03-30    │
│ 45            │ 23             │ 2009-03-04     │ 2009-03-07    │
│ 46            │ 23             │ 2009-03-04     │ 2009-03-05    │
│ 49            │ 26             │ 2008-07-22     │ 2008-07-30    │
│ 55            │ 14             │ 2009-01-10     │ 2009-01-11    │
│ 60            │ 1              │ 2008-12-27     │ 2008-12-28    │
│ 68            │ 3              │ 2009-02-17     │ 2009-02-20    │
│ 92            │ 27             │ 2009-04-30     │ 2009-05-03    │
│ 96            │ 35             │ 2008-04-12     │ 2008-04-13    │
│ 103           │ 30             │ 2009-01-20     │ 2009-01-24    │
│ 106           │ 30             │ 2009-05-15     │ 2009-05-20    │
│ 112           │ 36             │ 2009-04-06     │ 2009-05-07    │
│ 113           │ 36             │ 2008-11-09     │ 2009-01-09    │
│ 114           │ 36             │ 2009-01-29     │ 2009-01-31    │
│ 115           │ 36             │ 2009-01-26     │ 2009-02-27    │
│ 123           │ 30             │ 2009-01-20     │ 2009-01-24    │
│ 126           │ 30             │ 2009-05-15     │ 2009-05-20    │
│ 128           │ 38             │ 2008-12-10     │ 2008-12-29    │
└───────────────┴────────────────┴────────────────┴───────────────┘

```

### Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
```sql

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM pedido
   ...> WHERE  fecha_entrega <= date(fecha_esperada, '-2 day');      
┌───────────────┬────────────────┬────────────────┬───────────────┐
│ codigo_pedido │ codigo_cliente │ fecha_esperada │ fecha_entrega │
├───────────────┼────────────────┼────────────────┼───────────────┤
│ 2             │ 5              │ 2007-10-28     │ 2007-10-26    │
│ 24            │ 14             │ 2008-07-31     │ 2008-07-25    │
│ 30            │ 13             │ 2008-09-03     │ 2008-08-31    │
│ 36            │ 14             │ 2008-12-15     │ 2008-12-10    │
│ 53            │ 13             │ 2008-11-15     │ 2008-11-09    │
│ 89            │ 35             │ 2007-12-13     │ 2007-12-10    │
│ 91            │ 27             │ 2009-03-29     │ 2009-03-27    │
│ 93            │ 27             │ 2009-05-30     │ 2009-05-17    │
└───────────────┴────────────────┴────────────────┴───────────────┘

```

### Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
```sql

SELECT * FROM pedido 
   ...> WHERE fecha_pedido REGEXP 2009 AND estado = 'Rechazado';
┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬──────────────────────────────────────────────────────────────┬────────────────┐
│ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                         comentarios                          │ codigo_cliente │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 14            │ 2009-01-02   │ 2009-01-02     │               │ Rechazado │ mal pago                                                     │ 7              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 21            │ 2009-01-09   │ 2009-01-09     │ 2009-01-09    │ Rechazado │ mal pago                                                     │ 9              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 25            │ 2009-02-02   │ 2009-02-08     │               │ Rechazado │ El cliente carece de saldo en la cuenta asociada             │ 1              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 26            │ 2009-02-06   │ 2009-02-12     │               │ Rechazado │ El cliente anula la operacion para adquirir mas producto     │ 3              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 40            │ 2009-03-09   │ 2009-03-10     │ 2009-03-13    │ Rechazado │                                                              │ 19             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 46            │ 2009-04-03   │ 2009-03-04     │ 2009-03-05    │ Rechazado │                                                              │ 23             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 65            │ 2009-02-02   │ 2009-02-08     │               │ Rechazado │ El cliente carece de saldo en la cuenta asociada             │ 1              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 66            │ 2009-02-06   │ 2009-02-12     │               │ Rechazado │ El cliente anula la operacion para adquirir mas producto     │ 3              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 74            │ 2009-01-14   │ 2009-01-22     │               │ Rechazado │ El pedido no llego el dia que queria el cliente por fallo de │ 15             │
│               │              │                │               │           │ l transporte                                                 │                │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 81            │ 2009-01-18   │ 2009-01-24     │               │ Rechazado │ Los producto estaban en mal estado                           │ 28             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 101           │ 2009-03-07   │ 2009-03-27     │               │ Rechazado │ El pedido fue rechazado por el cliente                       │ 16             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 105           │ 2009-02-14   │ 2009-02-20     │               │ Rechazado │ el producto ha sido rechazado por la pesima calidad          │ 30             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 120           │ 2009-03-07   │ 2009-03-27     │               │ Rechazado │ El pedido fue rechazado por el cliente                       │ 16             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 125           │ 2009-02-14   │ 2009-02-20     │               │ Rechazado │ el producto ha sido rechazado por la pesima calidad          │ 30             │
└───────────────┴──────────────┴────────────────┴───────────────┴───────────┴──────────────────────────────────────────────────────────────┴────────────────┘

```

### Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

```sql
SELECT * FROM pedido                                          
   ...> WHERE SUBSTR(fecha_entrega, 6, 2) = '01';
┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬───────────────────────────────────────────────────────────┬────────────────┐
│ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                        comentarios                        │ codigo_cliente │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼───────────────────────────────────────────────────────────┼────────────────┤
│ 1             │ 2006-01-17   │ 2006-01-19     │ 2006-01-19    │ Entregado │ Pagado a plazos                                           │ 5              │
│ 13            │ 2009-01-12   │ 2009-01-14     │ 2009-01-15    │ Entregado │                                                           │ 7              │
│ 15            │ 2009-01-09   │ 2009-01-12     │ 2009-01-11    │ Entregado │                                                           │ 7              │
│ 16            │ 2009-01-06   │ 2009-01-07     │ 2009-01-15    │ Entregado │                                                           │ 7              │
│ 17            │ 2009-01-08   │ 2009-01-09     │ 2009-01-11    │ Entregado │ mal estado                                                │ 7              │
│ 18            │ 2009-01-05   │ 2009-01-06     │ 2009-01-07    │ Entregado │                                                           │ 9              │
│ 21            │ 2009-01-09   │ 2009-01-09     │ 2009-01-09    │ Rechazado │ mal pago                                                  │ 9              │
│ 22            │ 2009-01-11   │ 2009-01-11     │ 2009-01-13    │ Entregado │                                                           │ 9              │
│ 32            │ 2007-01-07   │ 2007-01-19     │ 2007-01-27    │ Entregado │ Entrega tardia, el cliente puso reclamacion               │ 4              │
│ 55            │ 2008-12-10   │ 2009-01-10     │ 2009-01-11    │ Entregado │ Retrasado 1 dia por problemas de transporte               │ 14             │
│ 58            │ 2009-01-24   │ 2009-01-31     │ 2009-01-30    │ Entregado │ Todo correcto                                             │ 3              │
│ 64            │ 2009-01-24   │ 2009-01-31     │ 2009-01-30    │ Entregado │ Todo correcto                                             │ 1              │
│ 75            │ 2009-01-11   │ 2009-01-13     │ 2009-01-13    │ Entregado │ El pedido llego perfectamente                             │ 15             │
│ 79            │ 2009-01-12   │ 2009-01-13     │ 2009-01-13    │ Entregado │                                                           │ 28             │
│ 82            │ 2009-01-20   │ 2009-01-29     │ 2009-01-29    │ Entregado │ El pedido llego un poco mas tarde de la hora fijada       │ 28             │
│ 95            │ 2008-01-04   │ 2008-01-19     │ 2008-01-19    │ Entregado │                                                           │ 35             │
│ 100           │ 2009-01-10   │ 2009-01-15     │ 2009-01-15    │ Entregado │ El pedido llego perfectamente                             │ 16             │
│ 102           │ 2008-12-28   │ 2009-01-08     │ 2009-01-08    │ Entregado │ Pago pendiente                                            │ 16             │
│ 103           │ 2009-01-15   │ 2009-01-20     │ 2009-01-24    │ Pendiente │                                                           │ 30             │
│ 113           │ 2008-10-28   │ 2008-11-09     │ 2009-01-09    │ Rechazado │ El producto ha sido rechazado por la tardanza de el envio │ 36             │
│ 114           │ 2009-01-15   │ 2009-01-29     │ 2009-01-31    │ Entregado │ El envio llego dos dias más tarde debido al mal tiempo    │ 36             │
│ 119           │ 2009-01-10   │ 2009-01-15     │ 2009-01-15    │ Entregado │ El pedido llego perfectamente                             │ 16             │
│ 121           │ 2008-12-28   │ 2009-01-08     │ 2009-01-08    │ Entregado │ Pago pendiente                                            │ 16             │
│ 123           │ 2009-01-15   │ 2009-01-20     │ 2009-01-24    │ Pendiente │                                                           │ 30             │
└───────────────┴──────────────┴────────────────┴───────────────┴───────────┴───────────────────────────────────────────────────────────┴────────────────┘


```

### Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
```sql

SELECT * FROM pago
   ...> WHERE forma_pago = 'PayPal' and fecha_pago regexp '2008'
   ...> ORDER BY total DESC; 
┌────────────────┬────────────┬────────────────┬────────────┬───────┐
│ codigo_cliente │ forma_pago │ id_transaccion │ fecha_pago │ total │
├────────────────┼────────────┼────────────────┼────────────┼───────┤
│ 26             │ PayPal     │ ak-std-000020  │ 2008-03-18 │ 18846 │
│ 14             │ PayPal     │ ak-std-000015  │ 2008-07-15 │ 4160  │
│ 13             │ PayPal     │ ak-std-000014  │ 2008-08-04 │ 2246  │
│ 1              │ PayPal     │ ak-std-000001  │ 2008-11-10 │ 2000  │
│ 1              │ PayPal     │ ak-std-000002  │ 2008-12-10 │ 2000  │
└────────────────┴────────────┴────────────────┴────────────┴───────┘

```

### Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
```sql

SELECT DISTINCT forma_pago FROM pago;
┌───────────────┐
│  forma_pago   │
├───────────────┤
│ PayPal        │
│ Transferencia │
│ Cheque        │
└───────────────┘

```

### Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
```sql
SELECT * from producto
   ...> WHERE gama = 'Ornamentales' AND cantidad_en_stock >= 100  
   ...> ORDER BY precio_venta DESC;
┌─────────────────┬─────────────────────────────────────────────────────────────┬──────────────┬─────────────┬──────────────────┬──────────────────────────────────────────────────────────────┬───────────────────┬──────────────┬──────────────────┐        
│ codigo_producto │                           nombre                            │     gama     │ dimensiones │    proveedor     │                         descripcion                          │ cantidad_en_stock │ precio_venta │ precio_proveedor │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-215          │ Brahea Armata                                               │ Ornamentales │ 120 - 140   │ Viveros EL OASIS │                                                              │ 100               │ 112          │ 89               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-222          │ Butia Capitata                                              │ Ornamentales │ 130 - 150   │ Viveros EL OASIS │                                                              │ 100               │ 87           │ 69               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-217          │ Brahea Edulis                                               │ Ornamentales │ 140 - 160   │ Viveros EL OASIS │                                                              │ 100               │ 64           │ 51               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-227          │ Chamaerops Humilis                                          │ Ornamentales │ 130 - 150   │ Viveros EL OASIS │                                                              │ 100               │ 64           │ 51               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-221          │ Butia Capitata                                              │ Ornamentales │ 85 - 105    │ Viveros EL OASIS │                                                              │ 100               │ 59           │ 47               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-236          │ Jubaea Chilensis                                            │ Ornamentales │             │ Viveros EL OASIS │                                                              │ 100               │ 49           │ 39               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-134          │ Nerium Oleander Arbusto GRANDE                              │ Ornamentales │ 160-200     │ Viveros EL OASIS │                                                              │ 100               │ 38           │ 30               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-226          │ Chamaerops Humilis                                          │ Ornamentales │ 115 - 130   │ Viveros EL OASIS │                                                              │ 100               │ 38           │ 30               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-230          │ Cordyline Australis -DRACAENA                               │ Ornamentales │ 190 - 210   │ Viveros EL OASIS │                                                              │ 100               │ 38           │ 30               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-220          │ Butia Capitata                                              │ Ornamentales │ 90 - 120    │ Viveros EL OASIS │                                                              │ 100               │ 36           │ 28               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-232          │ Cycas Revoluta                                              │ Ornamentales │ 80 - 90     │ Viveros EL OASIS │                                                              │ 100               │ 34           │ 27               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-228          │ Chamaerops Humilis \"Cerifera\"                             │ Ornamentales │ 70 - 80     │ Viveros EL OASIS │                                                              │ 100               │ 32           │ 25               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-219          │ Butia Capitata                                              │ Ornamentales │ 90 - 110    │ Viveros EL OASIS │                                                              │ 100               │ 29           │ 23               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-218          │ Butia Capitata                                              │ Ornamentales │ 70 - 90     │ Viveros EL OASIS │                                                              │ 100               │ 25           │ 20               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-229          │ Chrysalidocarpus Lutescens -ARECA                           │ Ornamentales │ 130 - 150   │ Viveros EL OASIS │                                                              │ 100               │ 22           │ 17               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-216          │ Brahea Edulis                                               │ Ornamentales │ 80 - 100    │ Viveros EL OASIS │                                                              │ 100               │ 19           │ 15               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-136          │ Nerium oleander ARBOL Calibre 8/10                          │ Ornamentales │ 225-250     │ Viveros EL OASIS │                                                              │ 100               │ 18           │ 14               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-149          │ Bougamvillea Sanderiana Espaldera                           │ Ornamentales │ 140-150     │ Viveros EL OASIS │                                                              │ 100               │ 17           │ 13               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-231          │ Cycas Revoluta                                              │ Ornamentales │ 55 - 65     │ Viveros EL OASIS │                                                              │ 100               │ 15           │ 12               │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-99           │ Mimosa DEALBATA Gaulois Astier                              │ Ornamentales │ 200-225     │ Viveros EL OASIS │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 14           │ 11               │        
│                 │                                                             │              │             │                  │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │        
│                 │                                                             │              │             │                  │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │        
│                 │                                                             │              │             │                  │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │        
│                 │                                                             │              │             │                  │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │        
│                 │                                                             │              │             │                  │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │        
│                 │                                                             │              │             │                  │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │        
│                 │                                                             │              │             │                  │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │        
│                 │                                                             │              │             │                  │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │        
│                 │                                                             │              │             │                  │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │        
│                 │                                                             │              │             │                  │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │        
│                 │                                                             │              │             │                  │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-100          │ Mimosa Injerto CLASICA Dealbata                             │ Ornamentales │ 100-110     │ Viveros EL OASIS │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 12           │ 9                │        
│                 │                                                             │              │             │                  │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │        
│                 │                                                             │              │             │                  │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │
│                 │                                                             │              │             │                  │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │        
│                 │                                                             │              │             │                  │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │        
│                 │                                                             │              │             │                  │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │        
│                 │                                                             │              │             │                  │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │        
│                 │                                                             │              │             │                  │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │        
│                 │                                                             │              │             │                  │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │        
│                 │                                                             │              │             │                  │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │        
│                 │                                                             │              │             │                  │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │        
│                 │                                                             │              │             │                  │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-144          │ Wisteria Sinensis INJERTADAS DECÃ“                          │ Ornamentales │ 140-150     │ Viveros EL OASIS │                                                              │ 100               │ 12           │ 9                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-103          │ Mimosa Semilla Bayleyana                                    │ Ornamentales │ 200-225     │ Viveros EL OASIS │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 10           │ 8                │        
│                 │                                                             │              │             │                  │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │        
│                 │                                                             │              │             │                  │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │        
│                 │                                                             │              │             │                  │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │        
│                 │                                                             │              │             │                  │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │        
│                 │                                                             │              │             │                  │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │        
│                 │                                                             │              │             │                  │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │        
│                 │                                                             │              │             │                  │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │        
│                 │                                                             │              │             │                  │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │        
│                 │                                                             │              │             │                  │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │        
│                 │                                                             │              │             │                  │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │        
│                 │                                                             │              │             │                  │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-104          │ Mimosa Semilla Cyanophylla                                  │ Ornamentales │ 200-225     │ Viveros EL OASIS │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 10           │ 8                │        
│                 │                                                             │              │             │                  │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │        
│                 │                                                             │              │             │                  │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │        
│                 │                                                             │              │             │                  │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │        
│                 │                                                             │              │             │                  │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │        
│                 │                                                             │              │             │                  │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │        
│                 │                                                             │              │             │                  │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │        
│                 │                                                             │              │             │                  │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │        
│                 │                                                             │              │             │                  │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │        
│                 │                                                             │              │             │                  │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │        
│                 │                                                             │              │             │                  │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │        
│                 │                                                             │              │             │                  │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-106          │ Mimosa Semilla Longifolia                                   │ Ornamentales │ 200-225     │ Viveros EL OASIS │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 10           │ 8                │        
│                 │                                                             │              │             │                  │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │        
│                 │                                                             │              │             │                  │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │
│                 │                                                             │              │             │                  │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │        
│                 │                                                             │              │             │                  │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │        
│                 │                                                             │              │             │                  │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │        
│                 │                                                             │              │             │                  │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │        
│                 │                                                             │              │             │                  │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │        
│                 │                                                             │              │             │                  │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │        
│                 │                                                             │              │             │                  │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │        
│                 │                                                             │              │             │                  │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │        
│                 │                                                             │              │             │                  │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-156          │ Acer platanoides                                            │ Ornamentales │ 200-225     │ Viveros EL OASIS │                                                              │ 100               │ 10           │ 8                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-157          │ Acer Pseudoplatanus                                         │ Ornamentales │ 200-225     │ Viveros EL OASIS │                                                              │ 100               │ 10           │ 8                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-160          │ Brachychiton Rupestris                                      │ Ornamentales │ 170-200     │ Viveros EL OASIS │                                                              │ 100               │ 10           │ 8                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-162          │ Cassia Corimbosa                                            │ Ornamentales │ 200-225     │ Viveros EL OASIS │                                                              │ 100               │ 10           │ 8                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-225          │ Chamaerops Humilis                                          │ Ornamentales │ 70 - 90     │ Viveros EL OASIS │                                                              │ 100               │ 10           │ 8                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-143          │ Wisteria Sinensis  azul, rosa, blanca                       │ Ornamentales │             │ Viveros EL OASIS │                                                              │ 100               │ 9            │ 7                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-115          │ Forsytia Intermedia \"Lynwood\"                             │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 7            │ 5                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-116          │ Hibiscus Syriacus  \"Diana\" -Blanco Puro                   │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente mo │ 120               │ 7            │ 5                │        
│                 │                                                             │              │             │                  │ ldeadas como bonsái en el transcurso de pocos años. Flores d │                   │              │                  │        
│                 │                                                             │              │             │                  │ e muchos colores según la variedad, desde el blanco puro al  │                   │              │                  │        
│                 │                                                             │              │             │                  │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │                   │              │                  │        
│                 │                                                             │              │             │                  │ a 1 día, pero continuamente aparecen nuevas y la floración s │                   │              │                  │        
│                 │                                                             │              │             │                  │ e prolonga durante todo el periodo de crecimiento vegetativo │                   │              │                  │        
│                 │                                                             │              │             │                  │ .                                                            │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-117          │ Hibiscus Syriacus  \"Helene\" -Blanco-cl.rojo                │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente mo │ 120               │ 7            │ 5                │        
│                 │                                                             │              │             │                  │ ldeadas como bonsái en el transcurso de pocos años. Flores d │                   │              │                  │        
│                 │                                                             │              │             │                  │ e muchos colores según la variedad, desde el blanco puro al  │                   │              │                  │        
│                 │                                                             │              │             │                  │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │                   │              │                  │        
│                 │                                                             │              │             │                  │ a 1 día, pero continuamente aparecen nuevas y la floración s │                   │              │                  │        
│                 │                                                             │              │             │                  │ e prolonga durante todo el periodo de crecimiento vegetativo │                   │              │                  │        
│                 │                                                             │              │             │                  │ .                                                            │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-118          │ Hibiscus Syriacus \"Pink Giant\" Rosa                       │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente mo │ 120               │ 7            │ 5                │        
│                 │                                                             │              │             │                  │ ldeadas como bonsái en el transcurso de pocos años. Flores d │                   │              │                  │        
│                 │                                                             │              │             │                  │ e muchos colores según la variedad, desde el blanco puro al  │                   │              │                  │
│                 │                                                             │              │             │                  │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │                   │              │                  │        
│                 │                                                             │              │             │                  │ a 1 día, pero continuamente aparecen nuevas y la floración s │                   │              │                  │        
│                 │                                                             │              │             │                  │ e prolonga durante todo el periodo de crecimiento vegetativo │                   │              │                  │        
│                 │                                                             │              │             │                  │ .                                                            │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-147          │ Bougamvillea Sanderiana Tutor                               │ Ornamentales │ 180-200     │ Viveros EL OASIS │                                                              │ 100               │ 7            │ 5                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-148          │ Bougamvillea Sanderiana Espaldera                           │ Ornamentales │ 45-50       │ Viveros EL OASIS │                                                              │ 100               │ 7            │ 5                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-224          │ Chamaerops Humilis                                          │ Ornamentales │ 50 - 60     │ Viveros EL OASIS │                                                              │ 100               │ 7            │ 5                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-101          │ Expositor Mimosa Semilla Mix                                │ Ornamentales │ 170-200     │ Viveros EL OASIS │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 6            │ 4                │        
│                 │                                                             │              │             │                  │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │        
│                 │                                                             │              │             │                  │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │        
│                 │                                                             │              │             │                  │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │        
│                 │                                                             │              │             │                  │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │        
│                 │                                                             │              │             │                  │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │        
│                 │                                                             │              │             │                  │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │        
│                 │                                                             │              │             │                  │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │        
│                 │                                                             │              │             │                  │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │        
│                 │                                                             │              │             │                  │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │        
│                 │                                                             │              │             │                  │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │        
│                 │                                                             │              │             │                  │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-102          │ Mimosa Semilla Bayleyana                                    │ Ornamentales │ 170-200     │ Viveros EL OASIS │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 6            │ 4                │        
│                 │                                                             │              │             │                  │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │        
│                 │                                                             │              │             │                  │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │        
│                 │                                                             │              │             │                  │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │        
│                 │                                                             │              │             │                  │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │        
│                 │                                                             │              │             │                  │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │        
│                 │                                                             │              │             │                  │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │        
│                 │                                                             │              │             │                  │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │        
│                 │                                                             │              │             │                  │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │        
│                 │                                                             │              │             │                  │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │        
│                 │                                                             │              │             │                  │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │        
│                 │                                                             │              │             │                  │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-105          │ Mimosa Semilla Espectabilis                                 │ Ornamentales │ 160-170     │ Viveros EL OASIS │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 6            │ 4                │        
│                 │                                                             │              │             │                  │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │        
│                 │                                                             │              │             │                  │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │        
│                 │                                                             │              │             │                  │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │
│                 │                                                             │              │             │                  │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │        
│                 │                                                             │              │             │                  │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │        
│                 │                                                             │              │             │                  │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │        
│                 │                                                             │              │             │                  │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │        
│                 │                                                             │              │             │                  │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │        
│                 │                                                             │              │             │                  │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │        
│                 │                                                             │              │             │                  │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │        
│                 │                                                             │              │             │                  │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-107          │ Mimosa Semilla Floribunda 4 estaciones                      │ Ornamentales │ 120-140     │ Viveros EL OASIS │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 6            │ 4                │        
│                 │                                                             │              │             │                  │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │        
│                 │                                                             │              │             │                  │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │        
│                 │                                                             │              │             │                  │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │        
│                 │                                                             │              │             │                  │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │        
│                 │                                                             │              │             │                  │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │        
│                 │                                                             │              │             │                  │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │        
│                 │                                                             │              │             │                  │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │        
│                 │                                                             │              │             │                  │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │        
│                 │                                                             │              │             │                  │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │        
│                 │                                                             │              │             │                  │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │        
│                 │                                                             │              │             │                  │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-151          │ Bougamvillea Sanderiana, 3 tut. piramide                    │ Ornamentales │             │ Viveros EL OASIS │                                                              │ 100               │ 6            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-152          │ Expositor Árboles clima continental                         │ Ornamentales │ 170-200     │ Viveros EL OASIS │                                                              │ 100               │ 6            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-153          │ Expositor Árboles clima mediterráneo                        │ Ornamentales │ 170-200     │ Viveros EL OASIS │                                                              │ 100               │ 6            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-154          │ Expositor Árboles borde del mar                             │ Ornamentales │ 170-200     │ Viveros EL OASIS │                                                              │ 100               │ 6            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-155          │ Acer Negundo                                                │ Ornamentales │ 200-225     │ Viveros EL OASIS │                                                              │ 100               │ 6            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-158          │ Brachychiton Acerifolius                                    │ Ornamentales │ 200-225     │ Viveros EL OASIS │                                                              │ 100               │ 6            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-159          │ Brachychiton Discolor                                       │ Ornamentales │ 200-225     │ Viveros EL OASIS │                                                              │ 100               │ 6            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-161          │ Cassia Corimbosa                                            │ Ornamentales │ 200-225     │ Viveros EL OASIS │                                                              │ 100               │ 6            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-108          │ Abelia Floribunda                                           │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 100               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-109          │ Callistemom (Mix)                                           │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y │ 100               │ 5            │ 4                │        
│                 │                                                             │              │             │                  │  colgantes (de ahí lo de \"llorón\")..                       │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-111          │ Corylus Avellana \"Contorta\"                               │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 100               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-112          │ Escallonia (Mix)                                            │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-113          │ Evonimus Emerald Gayeti                                     │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-114          │ Evonimus Pulchellus                                         │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-119          │ Laurus Nobilis Arbusto - Ramificado Bajo                    │ Ornamentales │ 40-50       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-120          │ Lonicera Nitida                                             │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-121          │ Lonicera Nitida \"Maigrum\"                                 │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-122          │ Lonicera Pileata                                            │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-123          │ Philadelphus \"Virginal\"                                   │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-124          │ Prunus pisardii                                             │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-125          │ Viburnum Tinus \"Eve Price\"                                │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-126          │ Weigelia \"Bristol Ruby\"                                   │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-135          │ Nerium oleander COPA  Calibre 6/8                           │ Ornamentales │ 50-60       │ Viveros EL OASIS │                                                              │ 100               │ 5            │ 4                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-137          │ ROSAL TREPADOR                                              │ Ornamentales │             │ Viveros EL OASIS │                                                              │ 100               │ 4            │ 3                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-138          │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │ Ornamentales │             │ Viveros EL OASIS │                                                              │ 100               │ 4            │ 3                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-139          │ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │ Ornamentales │             │ Viveros EL OASIS │                                                              │ 100               │ 4            │ 3                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-140          │ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │ Ornamentales │             │ Viveros EL OASIS │                                                              │ 100               │ 4            │ 3                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-141          │ Pitimini rojo                                               │ Ornamentales │             │ Viveros EL OASIS │                                                              │ 100               │ 4            │ 3                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-146          │ Bougamvillea Sanderiana Tutor                               │ Ornamentales │ 125-150     │ Viveros EL OASIS │                                                              │ 100               │ 4            │ 3                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-223          │ Chamaerops Humilis                                          │ Ornamentales │ 40 - 45     │ Viveros EL OASIS │                                                              │ 100               │ 4            │ 3                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-110          │ Callistemom (Mix)                                           │ Ornamentales │ 40-60       │ Viveros EL OASIS │ Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y │ 100               │ 2            │ 1                │        
│                 │                                                             │              │             │                  │  colgantes (de ahí lo de \"llorón\")..                       │                   │              │                  │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-142          │ Solanum Jazminoide                                          │ Ornamentales │ 150-160     │ Viveros EL OASIS │                                                              │ 100               │ 2            │ 1                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-145          │ Bougamvillea Sanderiana Tutor                               │ Ornamentales │ 80-100      │ Viveros EL OASIS │                                                              │ 100               │ 2            │ 1                │        
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤        
│ OR-150          │ Bougamvillea roja, naranja                                  │ Ornamentales │ 110-130     │ Viveros EL OASIS │                                                              │ 100               │ 2            │ 1                │        
└─────────────────┴─────────────────────────────────────────────────────────────┴──────────────┴─────────────┴──────────────────┴──────────────────────────────────────────────────────────────┴───────────────────┴──────────────┴──────────────────┘  


```

### Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
```sql

SELECT * FROM cliente 
   ...> WHERE ciudad = 'Madrid' and codigo_empleado_rep_ventas in (11,30);
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬───────────┬───────────┬───────────────────┬──────────────────┬────────┬────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │ telefono  │    fax    │ linea_direccion1  │ linea_direccion2 │ ciudad │ region │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼───────────┼───────────┼───────────────────┼──────────────────┼────────┼────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 7              │ Beragua                     │ Jose            │ Bermejo           │ 654987321 │ 916549872 │ C/pintor segundo  │ Getafe           │ Madrid │ Madrid │ Spain │ 28942         │ 11                         │ 20000          │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810  │ 919535678 │ C/sinesio delgado │ Madrid           │ Madrid │ Madrid │ Spain │ 28930         │ 11                         │ 40000          │
│ 9              │ Naturagua                   │ Guillermo       │ Rengifo           │ 689234750 │ 916428956 │ C/majadahonda     │ Boadilla         │ Madrid │ Madrid │ Spain │ 28947         │ 11                         │ 32000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001 │ 916421756 │ C/azores          │ Fuenlabrada      │ Madrid │ Madrid │ Spain │ 28946         │ 11                         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045 │ 916689215 │ C/Lagañas         │ Fuenlabrada      │ Madrid │ Madrid │ Spain │ 28943         │ 11                         │ 20000          │
│ 15             │ Jardin de Flores            │ Javier          │ Villar            │ 654865643 │ 914538776 │ C/ Oña 34         │                  │ Madrid │ Madrid │ Spain │ 28950         │ 30                         │ 40000          │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529 │ 916548735 │ Plaza Magallón 15 │                  │ Madrid │ Madrid │ Spain │ 28011         │ 30                         │ 5050           │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴───────────┴───────────┴───────────────────┴──────────────────┴────────┴────────┴───────┴───────────────┴────────────────────────────┴────────────────┘

```

## Consultas multitabla (Where para unir tablas)

### Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
```sql
SELECT cl.nombre_cliente, e.nombre, e.apellido1 || ' ' || e.apellido2 as apellidos FROM cliente c, empleado e 
   ...> WHERE cl.codigo_empleado_rep_ventas = e.codigo_empleado;
┌────────────────────────────────┬─────────────────┬────────────────────┐
│         nombre_cliente         │     nombre      │     apellidos      │
├────────────────────────────────┼─────────────────┼────────────────────┤
│ GoldFish Garden                │ Walter Santiago │ Sanchez Lopez      │
│ Gardening Associates           │ Walter Santiago │ Sanchez Lopez      │
│ Gerudo Valley                  │ Lorena          │ Paxton             │
│ Tendo Garden                   │ Lorena          │ Paxton             │
│ Lasas S.A.                     │ Mariano         │ López Murcia       │
│ Beragua                        │ Emmanuel        │ Magaña Perez       │
│ Club Golf Puerta del hierro    │ Emmanuel        │ Magaña Perez       │
│ Naturagua                      │ Emmanuel        │ Magaña Perez       │
│ DaraDistribuciones             │ Emmanuel        │ Magaña Perez       │
│ Madrileña de riegos            │ Emmanuel        │ Magaña Perez       │
│ Lasas S.A.                     │ Mariano         │ López Murcia       │
│ Camunas Jardines S.L.          │ Mariano         │ López Murcia       │
│ Dardena S.A.                   │ Mariano         │ López Murcia       │
│ Jardin de Flores               │ Julian          │ Bellinelli         │
│ Flores Marivi                  │ Felipe          │ Rosas Marquez      │
│ Flowers, S.A                   │ Felipe          │ Rosas Marquez      │
│ Naturajardin                   │ Julian          │ Bellinelli         │
│ Golf S.A.                      │ José Manuel     │ Martinez De la Osa │
│ Americh Golf Management SL     │ José Manuel     │ Martinez De la Osa │
│ Aloha                          │ José Manuel     │ Martinez De la Osa │
│ El Prat                        │ José Manuel     │ Martinez De la Osa │
│ Sotogrande                     │ José Manuel     │ Martinez De la Osa │
│ Vivero Humanes                 │ Julian          │ Bellinelli         │
│ Fuenla City                    │ Felipe          │ Rosas Marquez      │
│ Jardines y Mansiones Cactus SL │ Lucio           │ Campoamor Martín   │
│ Jardinerías Matías SL          │ Lucio           │ Campoamor Martín   │
│ Agrojardin                     │ Julian          │ Bellinelli         │
│ Top Campo                      │ Felipe          │ Rosas Marquez      │
│ Jardineria Sara                │ Felipe          │ Rosas Marquez      │
│ Campohermoso                   │ Julian          │ Bellinelli         │
│ france telecom                 │ Lionel          │ Narvaez            │
│ Musée du Louvre                │ Lionel          │ Narvaez            │
│ Tutifruti S.A                  │ Mariko          │ Kishi              │
│ Flores S.L.                    │ Michael         │ Bolton             │
│ The Magic Garden               │ Michael         │ Bolton             │
│ El Jardin Viviente S.L         │ Mariko          │ Kishi              │
└────────────────────────────────┴─────────────────┴────────────────────┘
```

### Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

```sql

SELECT cl.nombre_cliente, e.nombre FROM cliente as cl, empleado as e, pago as p 
   ...> WHERE p.codigo_cliente = cl.codigo_cliente AND cl.codigo_empleado_rep_ventas = e.codigo_empleado; 
┌────────────────────────────────┬─────────────────┐
│         nombre_cliente         │     nombre      │
├────────────────────────────────┼─────────────────┤
│ GoldFish Garden                │ Walter Santiago │
│ GoldFish Garden                │ Walter Santiago │
│ Gardening Associates           │ Walter Santiago │
│ Gardening Associates           │ Walter Santiago │
│ Gardening Associates           │ Walter Santiago │
│ Gerudo Valley                  │ Lorena          │
│ Gerudo Valley                  │ Lorena          │
│ Gerudo Valley                  │ Lorena          │
│ Gerudo Valley                  │ Lorena          │
│ Gerudo Valley                  │ Lorena          │
│ Tendo Garden                   │ Lorena          │
│ Beragua                        │ Emmanuel        │
│ Naturagua                      │ Emmanuel        │
│ Camunas Jardines S.L.          │ Mariano         │
│ Dardena S.A.                   │ Mariano         │
│ Jardin de Flores               │ Julian          │
│ Jardin de Flores               │ Julian          │
│ Flores Marivi                  │ Felipe          │
│ Golf S.A.                      │ José Manuel     │
│ Sotogrande                     │ José Manuel     │
│ Jardines y Mansiones Cactus SL │ Lucio           │
│ Jardinerías Matías SL          │ Lucio           │
│ Agrojardin                     │ Julian          │
│ Jardineria Sara                │ Felipe          │
│ Tutifruti S.A                  │ Mariko          │
│ El Jardin Viviente S.L         │ Mariko          │
└────────────────────────────────┴─────────────────┘
```
### Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

```sql

SELECT cl.nombre_cliente, e.nombre FROM cliente as cl, empleado as e, pago as p
   ...> WHERE  p.codigo_cliente = cl.codigo_cliente AND cl.codigo_empleado_rep_ventas = e.codigo_empleado     
   ...> AND p.codigo_cliente is NULL;
```
### Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

```sql

SELECT cl.nombre_cliente, e.nombre, o.ciudad FROM cliente as cl, empleado as e, pago as p, oficina as o   
   ...> WHERE  p.codigo_cliente = cl.codigo_cliente AND cl.codigo_empleado_rep_ventas = e.codigo_empleado
   ...> AND e.codigo_oficina = o.codigo_oficina;
┌────────────────────────────────┬─────────────────┬──────────────────────┐
│         nombre_cliente         │     nombre      │        ciudad        │
├────────────────────────────────┼─────────────────┼──────────────────────┤
│ GoldFish Garden                │ Walter Santiago │ San Francisco        │
│ GoldFish Garden                │ Walter Santiago │ San Francisco        │
│ Gardening Associates           │ Walter Santiago │ San Francisco        │
│ Gardening Associates           │ Walter Santiago │ San Francisco        │
│ Gardening Associates           │ Walter Santiago │ San Francisco        │
│ Gerudo Valley                  │ Lorena          │ Boston               │
│ Gerudo Valley                  │ Lorena          │ Boston               │
│ Gerudo Valley                  │ Lorena          │ Boston               │
│ Gerudo Valley                  │ Lorena          │ Boston               │
│ Gerudo Valley                  │ Lorena          │ Boston               │
│ Tendo Garden                   │ Lorena          │ Boston               │
│ Beragua                        │ Emmanuel        │ Barcelona            │
│ Naturagua                      │ Emmanuel        │ Barcelona            │
│ Camunas Jardines S.L.          │ Mariano         │ Madrid               │
│ Dardena S.A.                   │ Mariano         │ Madrid               │
│ Jardin de Flores               │ Julian          │ Sydney               │
│ Jardin de Flores               │ Julian          │ Sydney               │
│ Flores Marivi                  │ Felipe          │ Talavera de la Reina │
│ Golf S.A.                      │ José Manuel     │ Barcelona            │
│ Sotogrande                     │ José Manuel     │ Barcelona            │
│ Jardines y Mansiones Cactus SL │ Lucio           │ Madrid               │
│ Jardinerías Matías SL          │ Lucio           │ Madrid               │
│ Agrojardin                     │ Julian          │ Sydney               │
│ Jardineria Sara                │ Felipe          │ Talavera de la Reina │
│ Tutifruti S.A                  │ Mariko          │ Sydney               │
│ El Jardin Viviente S.L         │ Mariko          │ Sydney               │
└────────────────────────────────┴─────────────────┴──────────────────────┘
```

### Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

```sql

SELECT cl.nombre_cliente, e.nombre, o.ciudad FROM cliente as cl, empleado as e, pago as p, oficina as o  
   ...> WHERE  p.codigo_cliente = cl.codigo_cliente AND cl.codigo_empleado_rep_ventas = e.codigo_empleado
   ...> AND e.codigo_oficina = o.codigo_oficina AND p.codigo_cliente is NULL;

```


### Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

```sql
SELECT o.linea_direccion1, o.linea_direccion2 FROM cliente as cl, empleado as e, oficina as o   
   ...> WHERE  cl.codigo_empleado_rep_ventas = e.codigo_empleado
   ...> AND e.codigo_oficina = o.codigo_oficina
   ...> AND cl.ciudad = 'Fuenlabrada';
┌──────────────────────────────┬────────────────────┐
│       linea_direccion1       │  linea_direccion2  │
├──────────────────────────────┼────────────────────┤
│ Bulevar Indalecio Prieto, 32 │                    │
│ Bulevar Indalecio Prieto, 32 │                    │
│ Francisco Aguirre, 32        │ 5º piso (exterior) │
│ Francisco Aguirre, 32        │ 5º piso (exterior) │
│ Francisco Aguirre, 32        │ 5º piso (exterior) │
│ 5-11 Wentworth Avenue        │ Floor #2           │
└──────────────────────────────┴────────────────────┘
```

### Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

```sql

SELECT cl.nombre_cliente, e.nombre, o.ciudad FROM cliente as cl, empleado as e, oficina as o   
   ...> WHERE  cl.codigo_empleado_rep_ventas = e.codigo_empleado
   ...> AND e.codigo_oficina = o.codigo_oficina
   ...> ;                            
┌────────────────────────────────┬─────────────────┬──────────────────────┐
│         nombre_cliente         │     nombre      │        ciudad        │
├────────────────────────────────┼─────────────────┼──────────────────────┤
│ GoldFish Garden                │ Walter Santiago │ San Francisco        │
│ Gardening Associates           │ Walter Santiago │ San Francisco        │
│ Gerudo Valley                  │ Lorena          │ Boston               │
│ Tendo Garden                   │ Lorena          │ Boston               │
│ Lasas S.A.                     │ Mariano         │ Madrid               │
│ Beragua                        │ Emmanuel        │ Barcelona            │
│ Club Golf Puerta del hierro    │ Emmanuel        │ Barcelona            │
│ Naturagua                      │ Emmanuel        │ Barcelona            │
│ DaraDistribuciones             │ Emmanuel        │ Barcelona            │
│ Madrileña de riegos            │ Emmanuel        │ Barcelona            │
│ Lasas S.A.                     │ Mariano         │ Madrid               │
│ Camunas Jardines S.L.          │ Mariano         │ Madrid               │
│ Dardena S.A.                   │ Mariano         │ Madrid               │
│ Jardin de Flores               │ Julian          │ Sydney               │
│ Flores Marivi                  │ Felipe          │ Talavera de la Reina │
│ Flowers, S.A                   │ Felipe          │ Talavera de la Reina │
│ Naturajardin                   │ Julian          │ Sydney               │
│ Golf S.A.                      │ José Manuel     │ Barcelona            │
│ Americh Golf Management SL     │ José Manuel     │ Barcelona            │
│ Aloha                          │ José Manuel     │ Barcelona            │
│ El Prat                        │ José Manuel     │ Barcelona            │
│ Sotogrande                     │ José Manuel     │ Barcelona            │
│ Vivero Humanes                 │ Julian          │ Sydney               │
│ Fuenla City                    │ Felipe          │ Talavera de la Reina │
│ Jardines y Mansiones Cactus SL │ Lucio           │ Madrid               │
│ Jardinerías Matías SL          │ Lucio           │ Madrid               │
│ Agrojardin                     │ Julian          │ Sydney               │
│ Top Campo                      │ Felipe          │ Talavera de la Reina │
│ Jardineria Sara                │ Felipe          │ Talavera de la Reina │
│ Campohermoso                   │ Julian          │ Sydney               │
│ france telecom                 │ Lionel          │ Paris                │
│ Musée du Louvre                │ Lionel          │ Paris                │
│ Tutifruti S.A                  │ Mariko          │ Sydney               │
│ Flores S.L.                    │ Michael         │ San Francisco        │
│ The Magic Garden               │ Michael         │ San Francisco        │
│ El Jardin Viviente S.L         │ Mariko          │ Sydney               │
└────────────────────────────────┴─────────────────┴──────────────────────┘
```

### Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

```sql

SELECT e.nombre as nombre_empleado, (SELECT nombre FROM empleado WHERE codigo_empleado = e.codigo_jefe) as nombre_jefe FROM empleado e;
┌─────────────────┬─────────────┐
│ nombre_empleado │ nombre_jefe │
├─────────────────┼─────────────┤
│ Marcos          │             │
│ Ruben           │ Marcos      │
│ Alberto         │ Ruben       │
│ Maria           │ Ruben       │
│ Felipe          │ Alberto     │
│ Juan Carlos     │ Alberto     │
│ Carlos          │ Alberto     │
│ Mariano         │ Carlos      │
│ Lucio           │ Carlos      │
│ Hilario         │ Carlos      │
│ Emmanuel        │ Alberto     │
│ José Manuel     │ Emmanuel    │
│ David           │ Emmanuel    │
│ Oscar           │ Emmanuel    │
│ Francois        │ Alberto     │
│ Lionel          │ Francois    │
│ Laurent         │ Francois    │
│ Michael         │ Alberto     │
│ Walter Santiago │ Michael     │
│ Hilary          │ Alberto     │
│ Marcus          │ Hilary      │
│ Lorena          │ Hilary      │
│ Nei             │ Alberto     │
│ Narumi          │ Nei         │
│ Takuma          │ Nei         │
│ Amy             │ Alberto     │
│ Larry           │ Amy         │
│ John            │ Amy         │
│ Kevin           │ Alberto     │
│ Julian          │ Kevin       │
│ Mariko          │ Kevin       │
└─────────────────┴─────────────┘
```


### Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

```sql


SELECT 
   ...>     e.nombre AS nombre_empleado,
   ...>     (SELECT nombre FROM empleado WHERE codigo_empleado = e.codigo_jefe) AS nombre_jefe,
   ...>     (SELECT nombre FROM empleado WHERE codigo_empleado = (SELECT codigo_jefe FROM empleado WHERE codigo_empleado = e.codigo_jefe)) AS nombre_jefe_de_jefe
   ...> FROM
   ...>     empleado e;
┌─────────────────┬─────────────┬─────────────────────┐
│ nombre_empleado │ nombre_jefe │ nombre_jefe_de_jefe │
├─────────────────┼─────────────┼─────────────────────┤
│ Marcos          │             │                     │
│ Ruben           │ Marcos      │                     │
│ Alberto         │ Ruben       │ Marcos              │
│ Maria           │ Ruben       │ Marcos              │
│ Felipe          │ Alberto     │ Ruben               │
│ Juan Carlos     │ Alberto     │ Ruben               │
│ Carlos          │ Alberto     │ Ruben               │
│ Mariano         │ Carlos      │ Alberto             │
│ Lucio           │ Carlos      │ Alberto             │
│ Hilario         │ Carlos      │ Alberto             │
│ Emmanuel        │ Alberto     │ Ruben               │
│ José Manuel     │ Emmanuel    │ Alberto             │
│ David           │ Emmanuel    │ Alberto             │
│ Oscar           │ Emmanuel    │ Alberto             │
│ Francois        │ Alberto     │ Ruben               │
│ Lionel          │ Francois    │ Alberto             │
│ Laurent         │ Francois    │ Alberto             │
│ Michael         │ Alberto     │ Ruben               │
│ Walter Santiago │ Michael     │ Alberto             │
│ Hilary          │ Alberto     │ Ruben               │
│ Marcus          │ Hilary      │ Alberto             │
│ Lorena          │ Hilary      │ Alberto             │
│ Nei             │ Alberto     │ Ruben               │
│ Narumi          │ Nei         │ Alberto             │
│ Takuma          │ Nei         │ Alberto             │
│ Amy             │ Alberto     │ Ruben               │
│ Larry           │ Amy         │ Alberto             │
│ John            │ Amy         │ Alberto             │
│ Kevin           │ Alberto     │ Ruben               │
│ Julian          │ Kevin       │ Alberto             │
│ Mariko          │ Kevin       │ Alberto             │
└─────────────────┴─────────────┴─────────────────────┘
```
### Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

```sql
SELECT cl.nombre_cliente FROM cliente as cl, pedido as p
   ...> WHERE cl.codigo_cliente=p.codigo_cliente
   ...> AND fecha_esperada < fecha_entrega;   
┌────────────────────────────────┐
│         nombre_cliente         │
├────────────────────────────────┤
│ GoldFish Garden                │
│ Beragua                        │
│ Beragua                        │
│ Beragua                        │
│ Naturagua                      │
│ Naturagua                      │
│ Gardening Associates           │
│ Camunas Jardines S.L.          │
│ Gerudo Valley                  │
│ Golf S.A.                      │
│ Golf S.A.                      │
│ Golf S.A.                      │
│ Golf S.A.                      │
│ Sotogrande                     │
│ Sotogrande                     │
│ Sotogrande                     │
│ Sotogrande                     │
│ Jardines y Mansiones Cactus SL │
│ Dardena S.A.                   │
│ GoldFish Garden                │
│ Gardening Associates           │
│ Jardinerías Matías SL          │
│ Tutifruti S.A                  │
│ Jardineria Sara                │
│ Jardineria Sara                │
│ Flores S.L.                    │
│ Flores S.L.                    │
│ Flores S.L.                    │
│ Flores S.L.                    │
│ Jardineria Sara                │
│ Jardineria Sara                │
│ El Jardin Viviente S.L         │
└────────────────────────────────┘
```
### Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

```sql
SELECT cl.nombre_cliente, p.gama FROM cliente c, pedido as pd, detalle_pedido dp, producto as p
   ...> WHERE cl.codigo_cliente = pd.codigo_cliente and pd.codigo_pedido = dp.codigo_pedido 
   ...> AND dp.codigo_producto = p.codigo_producto
   ...> GROUP BY p.gama;
┌─────────────────┬──────────────┐
│ nombre_cliente  │     gama     │
├─────────────────┼──────────────┤
│ GoldFish Garden │ Aromáticas   │
│ Tendo Garden    │ Frutales     │
│ Beragua         │ Herramientas │
│ Tendo Garden    │ Ornamentales │
└─────────────────┴──────────────┘
```

## Consultas multitabla (inner join)

### Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql
SELECT cl.nombre_cliente FROM cliente as cl   
   ...> JOIN pago p on p.codigo_cliente is NULL;  
```

### Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
```sql
SELECT cl.nombre_cliente FROM cliente as cl   
   ...> JOIN pedido p on p.codigo_cliente is NULL; 
```
### Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
```sql
SELECT cl.nombre_cliente FROM cliente as cl, pago as pg   
   ...> JOIN pedido p on p.codigo_cliente is NULL
   ...> AND pg.codigo_cliente is NULL; 
```
### Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
```sql
 SELECT * from empleado  
   ...> JOIN oficina on empleado.codigo_oficina = oficina.codigo_oficina
   ...> WHERE oficina.codigo_oficina is NULL;

```

### Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
```sql

SELECT * from empleado  
   ...> JOIN cliente c on empleado.codigo_empleado = cl.codigo_empleado_rep_ventas
   ...> WHERE empleado.codigo_empleado is NULL; 

```

### Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
```sql
SELECT empleado*, oficina* from empleado, oficina  
   ...> JOIN cliente c on empleado.codigo_empleado = cl.codigo_empleado_rep_ventas
   ...> AND  oficina.codigo_oficina = empleado.codigo_oficina;
   ...> WHERE empleado.codigo_empleado is NULL;
```
### Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
```sql

SELECT * from empleado, oficina  
   ...> JOIN cliente c on empleado.codigo_empleado = cl.codigo_empleado_rep_ventas
   ...> AND  oficina.codigo_oficina = empleado.codigo_oficina;
   ...> WHERE empleado.codigo_empleado is NULL
   ...> AND empleado.codigo_oficina is NULL;

```
### Devuelve un listado de los productos que nunca han aparecido en un pedido.
```sql
SELECT p.* from producto as p 
   ...> JOIN detalle_pedido on p.codigo_producto = detalle_pedido.codigo_producto WHERE detalle_pedido.codigo_producto is NULL;
```

### Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.
```sql
SELECT p.* from producto as p 
   ...> JOIN detalle_pedido on p.codigo_producto = detalle_pedido.codigo_producto WHERE detalle_pedido.codigo_producto is NULL;
```
### Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
```sql
```
### Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
```sql
SELECT * from cliente         
   ...> WHERE codigo_cliente in (SELECT DISTINCT codigo_cliente FROM pedido) 
   ...> AND codigo_cliente NOT IN (SELECT DISTINCT codigo_cliente FROM pago);
┌────────────────┬────────────────┬─────────────────┬───────────────────┬───────────┬───────────┬──────────────────┬──────────────────┬────────┬─────────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │ nombre_cliente │ nombre_contacto │ apellido_contacto │ telefono  │    fax    │ linea_direccion1 │ linea_direccion2 │ ciudad │   region    │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼────────────────┼─────────────────┼───────────────────┼───────────┼───────────┼──────────────────┼──────────────────┼────────┼─────────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 36             │ Flores S.L.    │ Antonio         │ Romero            │ 654352981 │ 685249700 │ Avenida España   │                  │ Madrid │ Fuenlabrada │ Spain │ 29643         │ 18                         │ 6000           │
└────────────────┴────────────────┴─────────────────┴───────────────────┴───────────┴───────────┴──────────────────┴──────────────────┴────────┴─────────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
```
### Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
```sql
```




## Consultas resumen (count,avg,...)

### ¿Cuántos empleados hay en la compañía?
```sql
SELECT COUNT(codigo_empleado) as total_empleados FROM empleado;
┌─────────────────┐
│ total_empleados │
├─────────────────┤
│ 31              │
└─────────────────┘
```

### ¿Cuántos clientes tiene cada país?
```sql
SELECT pais, COUNT(pais) as total_clientes   
   ...> FROM cliente
   ...> GROUP BY pais;
┌────────────────┬────────────────┐
│      pais      │ total_clientes │
├────────────────┼────────────────┤
│ Australia      │ 2              │
│ France         │ 2              │
│ Spain          │ 27             │
│ USA            │ 4              │
│ United Kingdom │ 1              │
└────────────────┴────────────────┘
```
### ¿Cuál fue el pago medio en 2009?
```sql

SELECT AVG(total) from pago      
   ...> WHERE fecha_pago regexp '2009';
┌──────────────────┐
│    AVG(total)    │
├──────────────────┤
│ 4504.07692307692 │
└──────────────────┘
```
### ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
```sql

SELECT estado, COUNT(estado) as total_pedido FROM pedido  
   ...> GROUP BY estado;
┌───────────┬──────────────┐
│  estado   │ total_pedido │
├───────────┼──────────────┤
│ Entregado │ 61           │
│ Pendiente │ 30           │
│ Rechazado │ 24           │
└───────────┴──────────────┘
```
### Calcula el precio de venta del producto más caro y más barato en una misma consulta.
```sql

SELECT  MAX(precio_venta) as mas_caro, MIN(precio_venta) as mas_barato FROM producto              
   ...> ;
┌──────────┬────────────┐
│ mas_caro │ mas_barato │
├──────────┼────────────┤
│ 462      │ 1          │
└──────────┴────────────┘
```
### Calcula el número de clientes que tiene la empresa.
```sql
SELECT COUNT(codigo_cliente) AS total_cliente from cliente; 
┌───────────────┐
│ total_cliente │
├───────────────┤
│ 36            │
└───────────────┘
```

### ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
```sql
 SELECT ciudad, COUNT(codigo_cliente) as total_clientes from cliente 
   ...> WHERE ciudad = 'Madrid'
   ...> GROUP BY ciudad;
┌────────┬────────────────┐
│ ciudad │ total_clientes │
├────────┼────────────────┤
│ Madrid │ 11             │
└────────┴────────────────┘
```
### ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
```sql
 SELECT ciudad, COUNT(codigo_cliente) as total_clientes from cliente 
   ...> WHERE ciudad REGEXP '^M'
   ...> GROUP BY ciudad;
┌──────────────────────┬────────────────┐
│        ciudad        │ total_clientes │
├──────────────────────┼────────────────┤
│ Madrid               │ 11             │
│ Miami                │ 2              │
│ Montornes del valles │ 1              │
└──────────────────────┴────────────────┘
```

### Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
```sql
SELECT e.nombre, COUNT(cl.codigo_cliente) as numero_cliente FROM cliente as cl, empleado e 
   ...> WHERE cl.codigo_empleado_rep_ventas= e.codigo_empleado
   ...> GROUP BY e.nombre;         
┌─────────────────┬────────────────┐
│     nombre      │ numero_cliente │
├─────────────────┼────────────────┤
│ Emmanuel        │ 5              │
│ Felipe          │ 5              │
│ José Manuel     │ 5              │
│ Julian          │ 5              │
│ Lionel          │ 2              │
│ Lorena          │ 2              │
│ Lucio           │ 2              │
│ Mariano         │ 4              │
│ Mariko          │ 2              │
│ Michael         │ 2              │
│ Walter Santiago │ 2              │
└─────────────────┴────────────────┘
```
### Calcula el número de clientes que no tiene asignado representante de ventas.
```sql
SELECT COUNT(*) AS numero_cliente from cliente WHERE codigo_empleado_rep_ventas is NULL;
┌────────────────┐
│ numero_cliente │
├────────────────┤
│ 0              │
└────────────────┘
```

### Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
```sql
SELECT cl.nombre_cliente, cl.apellido_contacto, MIN(p.fecha_pago) as primer_pago, MAX(p.fecha_pago) as ultimo_pago FROM cliente as cl, pago as p
   ...> WHERE cl.codigo_cliente = p.codigo_cliente
   ...> GROUP BY cl.codigo_cliente;
┌────────────────────────────────┬───────────────────┬─────────────┬─────────────┐
│         nombre_cliente         │ apellido_contacto │ primer_pago │ ultimo_pago │
├────────────────────────────────┼───────────────────┼─────────────┼─────────────┤
│ GoldFish Garden                │ GoldFish          │ 2008-11-10  │ 2008-12-10  │
│ Gardening Associates           │ Wright            │ 2009-01-16  │ 2009-02-19  │
│ Gerudo Valley                  │ Flaute            │ 2007-01-08  │ 2007-01-08  │
│ Tendo Garden                   │ Tendo             │ 2006-01-18  │ 2006-01-18  │
│ Beragua                        │ Bermejo           │ 2009-01-13  │ 2009-01-13  │
│ Naturagua                      │ Rengifo           │ 2009-01-06  │ 2009-01-06  │
│ Camunas Jardines S.L.          │ Camunas           │ 2008-08-04  │ 2008-08-04  │
│ Dardena S.A.                   │ Rodriguez         │ 2008-07-15  │ 2008-07-15  │
│ Jardin de Flores               │ Villar            │ 2009-01-15  │ 2009-02-15  │
│ Flores Marivi                  │ Rodriguez         │ 2009-02-16  │ 2009-02-16  │
│ Golf S.A.                      │ Martinez          │ 2009-03-06  │ 2009-03-06  │
│ Sotogrande                     │ Santillana        │ 2009-03-26  │ 2009-03-26  │
│ Jardines y Mansiones Cactus SL │ Sánchez           │ 2008-03-18  │ 2008-03-18  │
│ Jardinerías Matías SL          │ San Martín        │ 2009-02-08  │ 2009-02-08  │
│ Agrojardin                     │ Lopez             │ 2009-01-13  │ 2009-01-13  │
│ Jardineria Sara                │ Marquez           │ 2009-01-16  │ 2009-01-16  │
│ Tutifruti S.A                  │ Jones             │ 2007-10-06  │ 2007-10-06  │
│ El Jardin Viviente S.L         │ Smith             │ 2006-05-26  │ 2006-05-26  │
└────────────────────────────────┴───────────────────┴─────────────┴─────────────┘
```
### Calcula el número de productos diferentes que hay en cada uno de los pedidos.
```sql

```
### Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
```sql
 SELECT  SUM(dp.precio_unidad) as clantidad_total FROM pedido p, detalle_pedido as dp                 
   ...> GROUP BY dp.precio_unidad;
┌────────────────┐
│ cantidad_total │
├────────────────┤
│ 3220           │
│ 690            │
│ 7820           │
│ 5175           │
│ 9660           │
│ 12075          │
│ 19320          │
│ 13455          │
│ 27600          │
│ 7590           │
│ 19320          │
│ 8970           │
│ 20930          │
│ 10350          │
│ 20700          │
│ 6555           │
│ 6900           │
│ 2415           │
│ 22770          │
│ 2645           │
│ 14375          │
│ 3220           │
│ 13340          │
│ 6900           │
│ 7130           │
│ 29440          │
│ 4370           │
│ 4485           │
│ 10350          │
│ 16905          │
│ 6555           │
│ 13570          │
│ 73600          │
│ 7475           │
│ 7935           │
│ 305900         │
│ 8625           │
│ 20930          │
│ 11385          │
│ 80500          │
│ 12765          │
│ 13225          │
│ 91770          │
│ 212520         │
└────────────────┘
```

### Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
```sql

SELECT dp.codigo_producto, p.nombre as nombre_producto, SUM(dp.cantidad) as total_unidades  
   ...> FROM detalle_pedido dp
   ...> JOIN producto p ON dp.codigo_producto = p.codigo_producto
   ...> GROUP BY dp.codigo_producto, p.nombre
   ...> ORDER BY total_unidades DESC
   ...> LIMIT 20;
┌─────────────────┬────────────────────────────────────────────┬─────────────────────────┐
│ codigo_producto │              nombre_producto               │      total_unidades     │
├─────────────────┼────────────────────────────────────────────┼─────────────────────────┤
│ AR-009          │ Thymus Vulgaris                            │ 961                     │
│ AR-008          │ Thymus Citriodra (Tomillo limón)           │ 455                     │
│ FR-17           │ Rosal bajo 1Âª -En maceta-inicio brotación │ 423                     │
│ AR-006          │ Petrosilium Hortense (Peregil)             │ 291                     │
│ FR-67           │ Cerezo                                     │ 285                     │
│ OR-247          │ Trachycarpus Fortunei                      │ 279                     │
│ OR-157          │ Acer Pseudoplatanus                        │ 262                     │
│ OR-227          │ Chamaerops Humilis                         │ 236                     │
│ OR-208          │ Tuja orientalis \"Aurea nana\"             │ 221                     │
│ 30310           │ Azadón                                     │ 220                     │
│ OR-214          │ Brahea Armata                              │ 212                     │
│ FR-57           │ Kaki Rojo Brillante                        │ 203                     │
│ OR-177          │ Robinia Pseudoacacia Casque Rouge          │ 150                     │
│ AR-001          │ Ajedrea                                    │ 135                     │
│ FR-11           │ Limonero 30/40                             │ 131                     │
│ AR-002          │ Lavándula Dentata                          │ 128                     │
│ OR-136          │ Nerium oleander ARBOL Calibre 8/10         │ 127                     │
│ FR-29           │ Cerezo Napoleón                            │ 120                     │
│ FR-48           │ Nogal Común                                │ 120                     │
│ FR-100          │ Nectarina                                  │ 114                     │
└─────────────────┴────────────────────────────────────────────┴─────────────────────────┘
```
### La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IGIC y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IGIC es el 7 % de la base imponible, y el total la suma de los dos campos anteriores.
```sql

SELECT SUM(dp.precio_unidad * dp.cantidad) as base_imponible,
   ...> SUM(dp.precio_unidad *  dp.cantidad * 0.07) as igic, 
   ...> SUM(dp.precio_unidad * dp.cantidad) + SUM(dp.precio_unidad * dp.cantidad * 0.07) as total from detalle_pedido dp;
┌────────────────┬──────────┬─────────────────┐
│ base_imponible │   igic   │     total       │
├────────────────┼──────────┼─────────────────┤
│ 217738         │ 15241.66 │ 232979.66       │
└────────────────┴──────────┴─────────────────┘
```

### La misma información que en la pregunta anterior, pero agrupada por código de producto.
```sql
SELECT SUM(dp.precio_unidad * dp.cantidad) as base_imponible,
   ...> SUM(dp.precio_unidad *  dp.cantidad * 0.07) as igic, 
   ...> SUM(dp.precio_unidad * dp.cantidad) + SUM(dp.precio_unidad * dp.cantidad * 0.07) as total from detalle_pedido dp 
   ...> GROUP BY dp.codigo_producto;
┌────────────────┬─────────┬─────────────────┐
│ base_imponible │  igic   │      total      │
├────────────────┼─────────┼─────────────────┤
│ 630            │ 44.1    │ 674.1           │
│ 564            │ 39.48   │ 603.48          │
│ 996            │ 69.72   │ 1065.72         │
│ 2640           │ 184.8   │ 2824.8          │
│ 135            │ 9.45    │ 144.45          │
│ 128            │ 8.96    │ 136.96          │
│ 17             │ 1.19    │ 18.19           │
│ 30             │ 2.1     │ 32.1            │
│ 21             │ 1.47    │ 22.47           │
│ 291            │ 20.37   │ 311.37          │
│ 9              │ 0.63    │ 9.63            │
│ 455            │ 31.85   │ 486.85          │
│ 986            │ 69.02   │ 1055.02         │
│ 10             │ 0.7     │ 10.7            │
│ 168            │ 11.76   │ 179.76          │
│ 119            │ 8.33    │ 127.33          │
│ 1209           │ 84.63   │ 1293.63         │
│ 247            │ 17.29   │ 264.29          │
│ 668            │ 46.76   │ 714.76          │
│ 25             │ 1.75    │ 26.75           │
│ 280            │ 19.6    │ 299.6           │
│ 673            │ 47.11   │ 720.11          │
│ 1100           │ 77.0    │ 1177.0          │
│ 468            │ 32.76   │ 500.76          │
│ 13092          │ 916.44  │ 14008.44        │
│ 668            │ 46.76   │ 714.76          │
│ 741            │ 51.87   │ 792.87          │
│ 225            │ 15.75   │ 240.75          │
│ 45             │ 3.15    │ 48.15           │
│ 846            │ 59.22   │ 905.22          │
│ 108            │ 7.56    │ 115.56          │
│ 7              │ 0.49    │ 7.49            │
│ 40             │ 2.8     │ 42.8            │
│ 62             │ 4.34    │ 66.34           │
│ 960            │ 67.2    │ 1027.2          │
│ 497            │ 34.79   │ 531.79          │
│ 96             │ 6.72    │ 102.72          │
│ 216            │ 15.12   │ 231.12          │
│ 336            │ 23.52   │ 359.52          │
│ 621            │ 43.47   │ 664.47          │
│ 45             │ 3.15    │ 48.15           │
│ 2552           │ 178.64  │ 2730.64         │
│ 434            │ 30.38   │ 464.38          │
│ 96             │ 6.72    │ 102.72          │
│ 96             │ 6.72    │ 102.72          │
│ 48             │ 3.36    │ 51.36           │
│ 112            │ 7.84    │ 119.84          │
│ 440            │ 30.8    │ 470.8           │
│ 1080           │ 75.6    │ 1155.6          │
│ 744            │ 52.08   │ 796.08          │
│ 351            │ 24.57   │ 375.57          │
│ 128            │ 8.96    │ 136.96          │
│ 1624           │ 113.68  │ 1737.68         │
│ 561            │ 39.27   │ 600.27          │
│ 112            │ 7.84    │ 119.84          │
│ 352            │ 24.64   │ 376.64          │
│ 110            │ 7.7     │ 117.7           │
│ 245            │ 17.15   │ 262.15          │
│ 19950          │ 1396.5  │ 21346.5         │
│ 1911           │ 133.77  │ 2044.77         │
│ 348            │ 24.36   │ 372.36          │
│ 220            │ 15.4    │ 235.4           │
│ 124            │ 8.68    │ 132.68          │
│ 224            │ 15.68   │ 239.68          │
│ 1035           │ 72.45   │ 1107.45         │
│ 30             │ 2.1     │ 32.1            │
│ 946            │ 66.22   │ 1012.22         │
│ 108            │ 7.56    │ 115.56          │
│ 32             │ 2.24    │ 34.24           │
│ 147            │ 10.29   │ 157.29          │
│ 980            │ 68.6    │ 1048.6          │
│ 143            │ 10.01   │ 153.01          │
│ 5320           │ 372.4   │ 5692.4          │
│ 22             │ 1.54    │ 23.54           │
│ 1584           │ 110.88  │ 1694.88         │
│ 450            │ 31.5    │ 481.5           │
│ 232            │ 16.24   │ 248.24          │
│ 280            │ 19.6    │ 299.6           │
│ 2250           │ 157.5   │ 2407.5          │
│ 1649           │ 115.43  │ 1764.43         │
│ 144            │ 10.08   │ 154.08          │
│ 1302           │ 91.14   │ 1393.14         │
│ 200            │ 14.0    │ 214.0           │
│ 63             │ 4.41    │ 67.41           │
│ 98             │ 6.86    │ 104.86          │
│ 50             │ 3.5     │ 53.5            │
│ 25             │ 1.75    │ 26.75           │
│ 160            │ 11.2    │ 171.2           │
│ 70             │ 4.9     │ 74.9            │
│ 15             │ 1.05    │ 16.05           │
│ 160            │ 11.2    │ 171.2           │
│ 2900           │ 203.0   │ 3103.0          │
│ 337            │ 23.59   │ 360.59          │
│ 216            │ 15.12   │ 231.12          │
│ 2286           │ 160.02  │ 2446.02         │
│ 320            │ 22.4    │ 342.4           │
│ 200            │ 14.0    │ 214.0           │
│ 200            │ 14.0    │ 214.0           │
│ 68             │ 4.76    │ 72.76           │
│ 42             │ 2.94    │ 44.94           │
│ 36             │ 2.52    │ 38.52           │
│ 18             │ 1.26    │ 19.26           │
│ 24             │ 1.68    │ 25.68           │
│ 313            │ 21.91   │ 334.91          │
│ 2620           │ 183.4   │ 2803.4          │
│ 132            │ 9.24    │ 141.24          │
│ 90             │ 6.3     │ 96.3            │
│ 30             │ 2.1     │ 32.1            │
│ 20             │ 1.4     │ 21.4            │
│ 1395           │ 97.65   │ 1492.65         │
│ 432            │ 30.24   │ 462.24          │
│ 380            │ 26.6    │ 406.6           │
│ 2250           │ 157.5   │ 2407.5          │
│ 30             │ 2.1     │ 32.1            │
│ 360            │ 25.2    │ 385.2           │
│ 240            │ 16.8    │ 256.8           │
│ 100            │ 7.0     │ 107.0           │
│ 100            │ 7.0     │ 107.0           │
│ 280            │ 19.6    │ 299.6           │
│ 40             │ 2.8     │ 42.8            │
│ 102            │ 7.14    │ 109.14          │
│ 500            │ 35.0    │ 535.0           │
│ 100            │ 7.0     │ 107.0           │
│ 25             │ 1.75    │ 26.75           │
│ 16             │ 1.12    │ 17.12           │
│ 884            │ 61.88   │ 945.88          │
│ 500            │ 35.0    │ 535.0           │
│ 3120           │ 218.4   │ 3338.4          │
│ 4130           │ 289.1   │ 4419.1          │
│ 9310           │ 651.7   │ 9961.7          │
│ 2120           │ 148.4   │ 2268.4          │
│ 975            │ 68.25   │ 1043.25         │
│ 950            │ 66.5    │ 1016.5          │
│ 1239           │ 86.73   │ 1325.73         │
│ 840            │ 58.8    │ 898.8           │
│ 570            │ 39.9    │ 609.9           │
│ 15104          │ 1057.28 │ 16161.28        │
│ 3520           │ 246.4   │ 3766.4          │
│ 2205           │ 154.35  │ 2359.35         │
│ 950            │ 66.5    │ 1016.5          │
│ 468            │ 32.76   │ 500.76          │
│ 485            │ 33.95   │ 518.95          │
│ 128            │ 8.96    │ 136.96          │
│ 73510          │ 5145.7  │ 78655.7         │
│ 150            │ 10.5    │ 160.5           │
│ 30             │ 2.1     │ 32.1            │
│ 517            │ 36.19   │ 553.19          │
└────────────────┴─────────┴─────────────────┘
```
### La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
```sql
SELECT SUM(dp.precio_unidad * dp.cantidad) as base_imponible,
   ...> SUM(dp.precio_unidad *  dp.cantidad * 0.07) as igic,
   ...> SUM(dp.precio_unidad * dp.cantidad) + SUM(dp.precio_unidad * dp.cantidad * 0.07) as total from detalle_pedido dp 
   ...> JOIN producto p on dp.codigo_producto = p.codigo_producto 
   ...> WHERE p.codigo_producto REGEXP '^OR'
   ...> GROUP BY dp.codigo_producto
   ...> ;
┌────────────────┬─────────┬─────────────────┐
│ base_imponible │  igic   │      total      │
├────────────────┼─────────┼─────────────────┤
│ 144            │ 10.08   │ 154.08          │
│ 1302           │ 91.14   │ 1393.14         │
│ 200            │ 14.0    │ 214.0           │
│ 63             │ 4.41    │ 67.41           │
│ 98             │ 6.86    │ 104.86          │
│ 50             │ 3.5     │ 53.5            │
│ 25             │ 1.75    │ 26.75           │
│ 160            │ 11.2    │ 171.2           │
│ 70             │ 4.9     │ 74.9            │
│ 15             │ 1.05    │ 16.05           │
│ 160            │ 11.2    │ 171.2           │
│ 2900           │ 203.0   │ 3103.0          │
│ 337            │ 23.59   │ 360.59          │
│ 216            │ 15.12   │ 231.12          │
│ 2286           │ 160.02  │ 2446.02         │
│ 320            │ 22.4    │ 342.4           │
│ 200            │ 14.0    │ 214.0           │
│ 200            │ 14.0    │ 214.0           │
│ 68             │ 4.76    │ 72.76           │
│ 42             │ 2.94    │ 44.94           │
│ 36             │ 2.52    │ 38.52           │
│ 18             │ 1.26    │ 19.26           │
│ 24             │ 1.68    │ 25.68           │
│ 313            │ 21.91   │ 334.91          │
│ 2620           │ 183.4   │ 2803.4          │
│ 132            │ 9.24    │ 141.24          │
│ 90             │ 6.3     │ 96.3            │
│ 30             │ 2.1     │ 32.1            │
│ 20             │ 1.4     │ 21.4            │
│ 1395           │ 97.65   │ 1492.65         │
│ 432            │ 30.24   │ 462.24          │
│ 380            │ 26.6    │ 406.6           │
│ 2250           │ 157.5   │ 2407.5          │
│ 30             │ 2.1     │ 32.1            │
│ 360            │ 25.2    │ 385.2           │
│ 240            │ 16.8    │ 256.8           │
│ 100            │ 7.0     │ 107.0           │
│ 100            │ 7.0     │ 107.0           │
│ 280            │ 19.6    │ 299.6           │
│ 40             │ 2.8     │ 42.8            │
│ 102            │ 7.14    │ 109.14          │
│ 500            │ 35.0    │ 535.0           │
│ 100            │ 7.0     │ 107.0           │
│ 25             │ 1.75    │ 26.75           │
│ 16             │ 1.12    │ 17.12           │
│ 884            │ 61.88   │ 945.88          │
│ 500            │ 35.0    │ 535.0           │
│ 3120           │ 218.4   │ 3338.4          │
│ 4130           │ 289.1   │ 4419.1          │
│ 9310           │ 651.7   │ 9961.7          │
│ 2120           │ 148.4   │ 2268.4          │
│ 975            │ 68.25   │ 1043.25         │
│ 950            │ 66.5    │ 1016.5          │
│ 1239           │ 86.73   │ 1325.73         │
│ 840            │ 58.8    │ 898.8           │
│ 570            │ 39.9    │ 609.9           │
│ 15104          │ 1057.28 │ 16161.28        │
│ 3520           │ 246.4   │ 3766.4          │
│ 2205           │ 154.35  │ 2359.35         │
│ 950            │ 66.5    │ 1016.5          │
│ 468            │ 32.76   │ 500.76          │
│ 485            │ 33.95   │ 518.95          │
│ 128            │ 8.96    │ 136.96          │
│ 73510          │ 5145.7  │ 78655.7         │
│ 150            │ 10.5    │ 160.5           │
│ 30             │ 2.1     │ 32.1            │
│ 517            │ 36.19   │ 553.19          │
└────────────────┴─────────┴─────────────────┘
```
### Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (7% IGIC).
```sql
SELECT p.nombre as nombre_producto, 
   ...> SUM(dp.precio_unidad * dp.cantidad) as total, 
   ...> SUM(dp.precio_unidad * dp.cantidad * 1.07) as total_con_impuestos
   ...> FROM detalle_pedido dp
   ...> JOIN producto p on dp.codigo_producto = p.codigo_producto
   ...> GROUP BY p.nombre
   ...> HAVING total > 3000;
┌───────────────────────────┬─────────────────┬─────────────────────┐
│      nombre_producto      │      total      │ total_con_impuestos │
├───────────────────────────┼─────────────────┼─────────────────────┤
│ Beucarnea Recurvata       │ 7250            │ 7757.5              │
│ Bismarckia Nobilis        │ 9310            │ 9961.7              │
│ Camelia japonica ejemplar │ 3237            │ 3463.59             │
│ Cerezo                    │ 22216           │ 23771.12            │
│ Chamaerops Humilis        │ 16514           │ 17669.98            │
│ Dracaena Drago            │ 3520            │ 3766.4              │
│ Kaki                      │ 5463            │ 5845.41             │
│ Limonero 30/40            │ 13092           │ 14008.44            │
│ Trachycarpus Fortunei     │ 73510           │ 78655.7             │
└───────────────────────────┴─────────────────┴─────────────────────┘
```

### Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
```sql

SELECT SUBSTRING(fecha_pago, 1, 4) as anio,  
   ...> SUM(total) as suma_total
   ...> FROM pago                         
   ...> GROUP BY SUBSTRING(fecha_pago, 1, 4); 
┌──────┬────────────┐
│ anio │ suma_total │
├──────┼────────────┤
│ 2006 │ 24965      │
│ 2007 │ 85170      │
│ 2008 │ 29252      │
│ 2009 │ 58553      │
└──────┴────────────┘
```

## Subconsultas en SQL

### Devuelve el nombre del cliente con mayor límite de crédito.
```sql

SELECT nombre_cliente, MAX(limite_credito) from cliente;
┌────────────────┬─────────────────────┐
│ nombre_cliente │ MAX(limite_credito) │
├────────────────┼─────────────────────┤
│ Tendo Garden   │ 600000              │
└────────────────┴─────────────────────┘
```

### Devuelve el nombre del producto que tenga el precio de venta más caro.
```sql
SELECT nombre, MAX(precio_venta) FROM producto;
┌───────────────────────┬───────────────────┐
│        nombre         │ MAX(precio_venta) │
├───────────────────────┼───────────────────┤
│ Trachycarpus Fortunei │ 462               │
└───────────────────────┴───────────────────┘
```
### Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)
```sql
SELECT p.nombre FROM producto p 
   ...> JOIN ( 
(x1...> SELECT codigo_producto, SUM(cantidad) as total_vendido 
(x1...> FROM detalle_pedido
(x1...> GROUP BY codigo_producto
(x1...> ORDER BY total_vendido DESC 
(x1...> LIMIT 1 ) as max_vendido on p.codigo_producto = max_vendido.codigo_producto;
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Thymus Vulgaris │
└─────────────────┘
```

### Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
```sql

SELECT * from cliente WHERE limite_credito > (                                                                                                                                                                                        
(x1...> SELECT SUM(total) FROM pago WHERE pago.codigo_cliente = cliente.codigo_cliente);
┌────────────────┬────────────────────────────────┬─────────────────┬───────────────────┬─────────────┬─────────────┬────────────────────────────────────────────┬───────────────────┬──────────────────────────┬─────────────────────┬───────────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │         nombre_cliente         │ nombre_contacto │ apellido_contacto │  telefono   │     fax     │              linea_direccion1              │ linea_direccion2  │          ciudad          │       region        │   pais    │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼────────────────────────────────┼─────────────────┼───────────────────┼─────────────┼─────────────┼────────────────────────────────────────────┼───────────────────┼──────────────────────────┼─────────────────────┼───────────┼───────────────┼────────────────────────────┼────────────────┤
│ 5              │ Tendo Garden                   │ Akane           │ Tendo             │ 55591233210 │ 55591233211 │ Null Street nº69                           │                   │ Miami                    │                     │ USA       │ 696969        │ 22                         │ 600000         │
│ 7              │ Beragua                        │ Jose            │ Bermejo           │ 654987321   │ 916549872   │ C/pintor segundo                           │ Getafe            │ Madrid                   │ Madrid              │ Spain     │ 28942         │ 11                         │ 20000          │
│ 9              │ Naturagua                      │ Guillermo       │ Rengifo           │ 689234750   │ 916428956   │ C/majadahonda                              │ Boadilla          │ Madrid                   │ Madrid              │ Spain     │ 28947         │ 11                         │ 32000          │
│ 13             │ Camunas Jardines S.L.          │ Pedro           │ Camunas           │ 34914873241 │ 34914871541 │ C/Virgenes 45                              │ C/Princesas 2 1ºB │ San Lorenzo del Escorial │ Madrid              │ Spain     │ 28145         │ 8                          │ 16481          │
│ 14             │ Dardena S.A.                   │ Juan            │ Rodriguez         │ 34912453217 │ 34912484764 │ C/Nueva York 74                            │                   │ Madrid                   │ Madrid              │ Spain     │ 28003         │ 8                          │ 321000         │
│ 15             │ Jardin de Flores               │ Javier          │ Villar            │ 654865643   │ 914538776   │ C/ Oña 34                                  │                   │ Madrid                   │ Madrid              │ Spain     │ 28950         │ 30                         │ 40000          │
│ 19             │ Golf S.A.                      │ Luis            │ Martinez          │ 916458762   │ 912354475   │ C/Estancado                                │                   │ Santa cruz de Tenerife   │ Islas Canarias      │ Spain     │ 38297         │ 12                         │ 30000          │
│ 23             │ Sotogrande                     │ Maria           │ Santillana        │ 915576622   │ 914825645   │ C/Paseo del Parque                         │                   │ Sotogrande               │ Cadiz               │ Spain     │ 11310         │ 12                         │ 60000          │
│ 26             │ Jardines y Mansiones Cactus SL │ Eva María       │ Sánchez           │ 916877445   │ 914477777   │ Polígono Industrial Maspalomas, Nº52       │ Móstoles          │ Madrid                   │ Madrid              │ Spain     │ 29874         │ 9                          │ 76000          │
│ 27             │ Jardinerías Matías SL          │ Matías          │ San Martín        │ 916544147   │ 917897474   │ C/Francisco Arce, Nº44                     │ Bustarviejo       │ Madrid                   │ Madrid              │ Spain     │ 37845         │ 9                          │ 100500         │
│ 35             │ Tutifruti S.A                  │ Jacob           │ Jones             │ 2 9261-2433 │ 2 9283-1695 │ level 24, St. Martins Tower.-31 Market St. │                   │ Sydney                   │ Nueva Gales del Sur │ Australia │ 2000          │ 31                         │ 10000          │
│ 38             │ El Jardin Viviente S.L         │ Justin          │ Smith             │ 2 8005-7161 │ 2 8005-7162 │ 176 Cumberland Street The rocks            │                   │ Sydney                   │ Nueva Gales del Sur │ Australia │ 2003          │ 31                         │ 8000           │
└────────────────┴────────────────────────────────┴─────────────────┴───────────────────┴─────────────┴─────────────┴────────────────────────────────────────────┴───────────────────┴──────────────────────────┴─────────────────────┴───────────┴───────────────┴────────────────────────────┴────────────────┘
```

### Devuelve el producto que más unidades tiene en stock.
```sql
SELECT *, MAX(cantidad_en_stock) as clantidad_maxima FROM producto;   
┌─────────────────┬─────────────┬──────────┬─────────────┬───────────────────────┬─────────────┬───────────────────┬──────────────┬──────────────────┬─────────────────┐
│ codigo_producto │   nombre    │   gama   │ dimensiones │       proveedor       │ descripcion │ cantidad_en_stock │ precio_venta │ precio_proveedor │ cantidad_maxima │
├─────────────────┼─────────────┼──────────┼─────────────┼───────────────────────┼─────────────┼───────────────────┼──────────────┼──────────────────┼─────────────────┤
│ FR-23           │ Rosal copa  │ Frutales │             │ Frutales Talavera S.A │             │ 400               │ 8            │ 6                │ 400             │
└─────────────────┴─────────────┴──────────┴─────────────┴───────────────────────┴─────────────┴───────────────────┴──────────────┴──────────────────┴─────────────────┘
```

### Devuelve el producto que menos unidades tiene en stock.
```sql

SELECT *, MIN(cantidad_en_stock) as clantidad_maxima FROM producto; 
┌─────────────────┬───────────────┬──────────────┬─────────────┬──────────────────┬─────────────┬───────────────────┬──────────────┬──────────────────┬─────────────────┐
│ codigo_producto │    nombre     │     gama     │ dimensiones │    proveedor     │ descripcion │ cantidad_en_stock │ precio_venta │ precio_proveedor │ cantidad_maxima │
├─────────────────┼───────────────┼──────────────┼─────────────┼──────────────────┼─────────────┼───────────────────┼──────────────┼──────────────────┼─────────────────┤
│ OR-214          │ Brahea Armata │ Ornamentales │ 45 - 60     │ Viveros EL OASIS │             │ 0                 │ 10           │ 8                │ 0               │
└─────────────────┴───────────────┴──────────────┴─────────────┴──────────────────┴─────────────┴───────────────────┴──────────────┴──────────────────┴─────────────────┘
```

### Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
```sql
SELECT nombre, apellido1 || ' ' || apellido2 as apellidos, email FROM empleado
   ...> WHERE codigo_jefe = ( SELECT codigo_empleado from empleado WHERE nombre = 'Alberto' AND apellido1 = 'Soria'); 
┌─────────────┬───────────────┬───────────────────────────┐
│   nombre    │   apellidos   │           email           │
├─────────────┼───────────────┼───────────────────────────┤
│ Felipe      │ Rosas Marquez │ frosas@jardineria.es      │
│ Juan Carlos │ Ortiz Serrano │ cortiz@jardineria.es      │
│ Carlos      │ Soria Jimenez │ csoria@jardineria.es      │
│ Emmanuel    │ Magaña Perez  │ manu@jardineria.es        │
│ Francois    │ Fignon        │ ffignon@gardening.com     │
│ Michael     │ Bolton        │ mbolton@gardening.com     │
│ Hilary      │ Washington    │ hwashington@gardening.com │
│ Nei         │ Nishikori     │ nnishikori@gardening.com  │
│ Amy         │ Johnson       │ ajohnson@gardening.com    │
│ Kevin       │ Fallmer       │ kfalmer@gardening.com     │
└─────────────┴───────────────┴───────────────────────────┘
```
### Devuelve el nombre del cliente con mayor límite de crédito.
```sql
SELECT nombre_cliente, MAX(limite_credito) as maximo FROM cliente; 
┌────────────────┬────────┐
│ nombre_cliente │ maximo │
├────────────────┼────────┤
│ Tendo Garden   │ 600000 │
└────────────────┴────────┘
```
### Devuelve el nombre del producto que tenga el precio de venta más caro.
```sql

SELECT nombre, MAX(precio_venta) as precio_max FROM producto;
┌───────────────────────┬────────────┐
│        nombre         │ precio_max │
├───────────────────────┼────────────┤
│ Trachycarpus Fortunei │ 462        │
└───────────────────────┴────────────┘
```
### Devuelve el producto que menos unidades tiene en stock.
```sql

 SELECT nombre, MIN(cantidad_en_stock) as min_stock FROM producto;  
┌───────────────┬───────────┐
│    nombre     │ min_stock │
├───────────────┼───────────┤
│ Brahea Armata │ 0         │
└───────────────┴───────────┘
```
### Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
```sql

SELECT nombre, apellido1, puesto FROM empleado 
   ...> WHERE codigo_empleado NOT IN (SELECT DISTINCT codigo_empleado from cliente);

```
### Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql
SELECT * FROM cliente 
   ...> WHERE codigo_cliente NOT IN (SELECT DISTINCT codigo_cliente from pago);
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬────────────────┬────────────────┬──────────────────────────┬──────────────────┬──────────────────────┬─────────────┬────────────────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │    telefono    │      fax       │     linea_direccion1     │ linea_direccion2 │        ciudad        │   region    │      pais      │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼────────────────┼────────────────┼──────────────────────────┼──────────────────┼──────────────────────┼─────────────┼────────────────┼───────────────┼────────────────────────────┼────────────────┤
│ 6              │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid      │ Spain          │ 28945         │ 8                          │ 154310         │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810       │ 919535678      │ C/sinesio delgado        │ Madrid           │ Madrid               │ Madrid      │ Spain          │ 28930         │ 11                         │ 40000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001      │ 916421756      │ C/azores                 │ Fuenlabrada      │ Madrid               │ Madrid      │ Spain          │ 28946         │ 11                         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045      │ 916689215      │ C/Lagañas                │ Fuenlabrada      │ Madrid               │ Madrid      │ Spain          │ 28943         │ 11                         │ 20000          │
│ 12             │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid      │ Spain          │ 28945         │ 8                          │ 154310         │
│ 17             │ Flowers, S.A                │ Beatriz         │ Fernandez         │ 698754159      │ 978453216      │ C/Luis Salquillo4        │                  │ Montornes del valles │ Barcelona   │ Spain          │ 24586         │ 5                          │ 3500           │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529      │ 916548735      │ Plaza Magallón 15        │                  │ Madrid               │ Madrid      │ Spain          │ 28011         │ 30                         │ 5050           │
│ 20             │ Americh Golf Management SL  │ Mario           │ Suarez            │ 964493072      │ 964493063      │ C/Letardo                │                  │ Barcelona            │ Cataluña    │ Spain          │ 12320         │ 12                         │ 20000          │
│ 21             │ Aloha                       │ Cristian        │ Rodrigez          │ 916485852      │ 914489898      │ C/Roman 3                │                  │ Canarias             │ Canarias    │ Spain          │ 35488         │ 12                         │ 50000          │
│ 22             │ El Prat                     │ Francisco       │ Camacho           │ 916882323      │ 916493211      │ Avenida Tibidabo         │                  │ Barcelona            │ Cataluña    │ Spain          │ 12320         │ 12                         │ 30000          │
│ 24             │ Vivero Humanes              │ Federico        │ Gomez             │ 654987690      │ 916040875      │ C/Miguel Echegaray 54    │                  │ Humanes              │ Madrid      │ Spain          │ 28970         │ 30                         │ 7430           │
│ 25             │ Fuenla City                 │ Tony            │ Muñoz Mena        │ 675842139      │ 915483754      │ C/Callo 52               │                  │ Fuenlabrada          │ Madrid      │ Spain          │ 28574         │ 5                          │ 4500           │
│ 29             │ Top Campo                   │ Joseluis        │ Sanchez           │ 685746512      │ 974315924      │ C/Ibiza 32               │                  │ Humanes              │ Madrid      │ Spain          │ 28574         │ 5                          │ 5500           │
│ 31             │ Campohermoso                │ Luis            │ Jimenez           │ 645925376      │ 916159116      │ C/Peru 78                │                  │ Fuenlabrada          │ Madrid      │ Spain          │ 28945         │ 30                         │ 3250           │
│ 32             │ france telecom              │ FraÃ§ois        │ Toulou            │ (33)5120578961 │ (33)5120578961 │ 6 place d Alleray 15Ã¨me │                  │ Paris                │             │ France         │ 75010         │ 16                         │ 10000          │
│ 33             │ Musée du Louvre             │ Pierre          │ Delacroux         │ (33)0140205050 │ (33)0140205442 │ Quai du Louvre           │                  │ Paris                │             │ France         │ 75058         │ 16                         │ 30000          │
│ 36             │ Flores S.L.                 │ Antonio         │ Romero            │ 654352981      │ 685249700      │ Avenida España           │                  │ Madrid               │ Fuenlabrada │ Spain          │ 29643         │ 18                         │ 6000           │
│ 37             │ The Magic Garden            │ Richard         │ Mcain             │ 926523468      │ 9364875882     │ Lihgting Park            │                  │ London               │ London      │ United Kingdom │ 65930         │ 18                         │ 10000          │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴────────────────┴────────────────┴──────────────────────────┴──────────────────┴──────────────────────┴─────────────┴────────────────┴───────────────┴────────────────────────────┴────────────────┘
```
### Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
```sql

SELECT * from cliente 
   ...> WHERE codigo_cliente in (SELECT DISTINCT codigo_cliente FROM pago);
┌────────────────┬────────────────────────────────┬─────────────────┬───────────────────┬─────────────┬─────────────┬────────────────────────────────────────────┬───────────────────┬──────────────────────────┬─────────────────────┬───────────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │         nombre_cliente         │ nombre_contacto │ apellido_contacto │  telefono   │     fax     │              linea_direccion1              │ linea_direccion2  │          ciudad          │       region        │   pais    │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼────────────────────────────────┼─────────────────┼───────────────────┼─────────────┼─────────────┼────────────────────────────────────────────┼───────────────────┼──────────────────────────┼─────────────────────┼───────────┼───────────────┼────────────────────────────┼────────────────┤
│ 1              │ GoldFish Garden                │ Daniel G        │ GoldFish          │ 5556901745  │ 5556901746  │ False Street 52 2 A                        │                   │ San Francisco            │                     │ USA       │ 24006         │ 19                         │ 3000           │
│ 3              │ Gardening Associates           │ Anne            │ Wright            │ 5557410345  │ 5557410346  │ Wall-e Avenue                              │                   │ Miami                    │ Miami               │ USA       │ 24010         │ 19                         │ 6000           │
│ 4              │ Gerudo Valley                  │ Link            │ Flaute            │ 5552323129  │ 5552323128  │ Oaks Avenue nº22                           │                   │ New York                 │                     │ USA       │ 85495         │ 22                         │ 12000          │
│ 5              │ Tendo Garden                   │ Akane           │ Tendo             │ 55591233210 │ 55591233211 │ Null Street nº69                           │                   │ Miami                    │                     │ USA       │ 696969        │ 22                         │ 600000         │
│ 7              │ Beragua                        │ Jose            │ Bermejo           │ 654987321   │ 916549872   │ C/pintor segundo                           │ Getafe            │ Madrid                   │ Madrid              │ Spain     │ 28942         │ 11                         │ 20000          │
│ 9              │ Naturagua                      │ Guillermo       │ Rengifo           │ 689234750   │ 916428956   │ C/majadahonda                              │ Boadilla          │ Madrid                   │ Madrid              │ Spain     │ 28947         │ 11                         │ 32000          │
│ 13             │ Camunas Jardines S.L.          │ Pedro           │ Camunas           │ 34914873241 │ 34914871541 │ C/Virgenes 45                              │ C/Princesas 2 1ºB │ San Lorenzo del Escorial │ Madrid              │ Spain     │ 28145         │ 8                          │ 16481          │
│ 14             │ Dardena S.A.                   │ Juan            │ Rodriguez         │ 34912453217 │ 34912484764 │ C/Nueva York 74                            │                   │ Madrid                   │ Madrid              │ Spain     │ 28003         │ 8                          │ 321000         │
│ 15             │ Jardin de Flores               │ Javier          │ Villar            │ 654865643   │ 914538776   │ C/ Oña 34                                  │                   │ Madrid                   │ Madrid              │ Spain     │ 28950         │ 30                         │ 40000          │
│ 16             │ Flores Marivi                  │ Maria           │ Rodriguez         │ 666555444   │ 912458657   │ C/Leganes24                                │                   │ Fuenlabrada              │ Madrid              │ Spain     │ 28945         │ 5                          │ 1500           │
│ 19             │ Golf S.A.                      │ Luis            │ Martinez          │ 916458762   │ 912354475   │ C/Estancado                                │                   │ Santa cruz de Tenerife   │ Islas Canarias      │ Spain     │ 38297         │ 12                         │ 30000          │
│ 23             │ Sotogrande                     │ Maria           │ Santillana        │ 915576622   │ 914825645   │ C/Paseo del Parque                         │                   │ Sotogrande               │ Cadiz               │ Spain     │ 11310         │ 12                         │ 60000          │
│ 26             │ Jardines y Mansiones Cactus SL │ Eva María       │ Sánchez           │ 916877445   │ 914477777   │ Polígono Industrial Maspalomas, Nº52       │ Móstoles          │ Madrid                   │ Madrid              │ Spain     │ 29874         │ 9                          │ 76000          │
│ 27             │ Jardinerías Matías SL          │ Matías          │ San Martín        │ 916544147   │ 917897474   │ C/Francisco Arce, Nº44                     │ Bustarviejo       │ Madrid                   │ Madrid              │ Spain     │ 37845         │ 9                          │ 100500         │
│ 28             │ Agrojardin                     │ Benito          │ Lopez             │ 675432926   │ 916549264   │ C/Mar Caspio 43                            │                   │ Getafe                   │ Madrid              │ Spain     │ 28904         │ 30                         │ 8040           │
│ 30             │ Jardineria Sara                │ Sara            │ Marquez           │ 675124537   │ 912475843   │ C/Lima 1                                   │                   │ Fuenlabrada              │ Madrid              │ Spain     │ 27584         │ 5                          │ 7500           │
│ 35             │ Tutifruti S.A                  │ Jacob           │ Jones             │ 2 9261-2433 │ 2 9283-1695 │ level 24, St. Martins Tower.-31 Market St. │                   │ Sydney                   │ Nueva Gales del Sur │ Australia │ 2000          │ 31                         │ 10000          │
│ 38             │ El Jardin Viviente S.L         │ Justin          │ Smith             │ 2 8005-7161 │ 2 8005-7162 │ 176 Cumberland Street The rocks            │                   │ Sydney                   │ Nueva Gales del Sur │ Australia │ 2003          │ 31                         │ 8000           │
└────────────────┴────────────────────────────────┴─────────────────┴───────────────────┴─────────────┴─────────────┴────────────────────────────────────────────┴───────────────────┴──────────────────────────┴─────────────────────┴───────────┴───────────────┴────────────────────────────┴────────────────┘
```
### Devuelve un listado de los productos que nunca han aparecido en un pedido.
```sql

SELECT p.* from producto as p 
   ...> JOIN detalle_pedido on p.codigo_producto = detalle_pedido.codigo_producto WHERE detalle_pedido.codigo_producto is NULL;
```
### Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
```sql

SELECT e.nombre, e.apellido1 || ' ' || e.apellido2 as apellidos, e.puesto, o.telefono FROM empleado e
   ...> JOIN oficina o on e.codigo_oficina=o.codigo_oficina WHERE e.codigo_empleado NOT IN (
(x1...> SELECT DISTINCT codigo_empleado_rep_ventas FROM cliente WHERE puesto='Representante Ventas');    
┌─────────────┬───────────────────┬───────────────────────┬─────────────────┐
│   nombre    │     apellidos     │        puesto         │    telefono     │
├─────────────┼───────────────────┼───────────────────────┼─────────────────┤
│ Marcos      │ Magaña Perez      │ Director General      │ +34 925 867231  │
│ Ruben       │ López Martinez    │ Subdirector Marketing │ +34 925 867231  │
│ Alberto     │ Soria Carrasco    │ Subdirector Ventas    │ +34 925 867231  │
│ Maria       │ Solís Jerez       │ Secretaria            │ +34 925 867231  │
│ Carlos      │ Soria Jimenez     │ Director Oficina      │ +34 91 7514487  │
│ Emmanuel    │ Magaña Perez      │ Director Oficina      │ +34 93 3561182  │
│ Francois    │ Fignon            │ Director Oficina      │ +33 14 723 4404 │
│ Michael     │ Bolton            │ Director Oficina      │ +1 650 219 4782 │
│ Hilary      │ Washington        │ Director Oficina      │ +1 215 837 0825 │
│ Nei         │ Nishikori         │ Director Oficina      │ +81 33 224 5000 │
│ Amy         │ Johnson           │ Director Oficina      │ +44 20 78772041 │
│ Kevin       │ Fallmer           │ Director Oficina      │ +61 2 9264 2451 │
└─────────────┴───────────────────┴───────────────────────┴─────────────────┘
```
### Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
```sql
```
### Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
```sql

SELECT * from cliente         
   ...> WHERE codigo_cliente in (SELECT DISTINCT codigo_cliente FROM pedido) 
   ...> AND codigo_cliente NOT IN (SELECT DISTINCT codigo_cliente FROM pago);
┌────────────────┬────────────────┬─────────────────┬───────────────────┬───────────┬───────────┬──────────────────┬──────────────────┬────────┬─────────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │ nombre_cliente │ nombre_contacto │ apellido_contacto │ telefono  │    fax    │ linea_direccion1 │ linea_direccion2 │ ciudad │   region    │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼────────────────┼─────────────────┼───────────────────┼───────────┼───────────┼──────────────────┼──────────────────┼────────┼─────────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 36             │ Flores S.L.    │ Antonio         │ Romero            │ 654352981 │ 685249700 │ Avenida España   │                  │ Madrid │ Fuenlabrada │ Spain │ 29643         │ 18                         │ 6000           │
└────────────────┴────────────────┴─────────────────┴───────────────────┴───────────┴───────────┴──────────────────┴──────────────────┴────────┴─────────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
```

### Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql


SELECT * from cliente 
   ...> WHERE codigo_cliente NOT IN (SELECT DISTINCT codigo_cliente from pago);
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬────────────────┬────────────────┬──────────────────────────┬──────────────────┬──────────────────────┬─────────────┬────────────────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │    telefono    │      fax       │     linea_direccion1     │ linea_direccion2 │        ciudad        │   region    │      pais      │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼────────────────┼────────────────┼──────────────────────────┼──────────────────┼──────────────────────┼─────────────┼────────────────┼───────────────┼────────────────────────────┼────────────────┤
│ 6              │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid      │ Spain          │ 28945         │ 8                          │ 154310         │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810       │ 919535678      │ C/sinesio delgado        │ Madrid           │ Madrid               │ Madrid      │ Spain          │ 28930         │ 11                         │ 40000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001      │ 916421756      │ C/azores                 │ Fuenlabrada      │ Madrid               │ Madrid      │ Spain          │ 28946         │ 11                         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045      │ 916689215      │ C/Lagañas                │ Fuenlabrada      │ Madrid               │ Madrid      │ Spain          │ 28943         │ 11                         │ 20000          │
│ 12             │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid      │ Spain          │ 28945         │ 8                          │ 154310         │
│ 17             │ Flowers, S.A                │ Beatriz         │ Fernandez         │ 698754159      │ 978453216      │ C/Luis Salquillo4        │                  │ Montornes del valles │ Barcelona   │ Spain          │ 24586         │ 5                          │ 3500           │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529      │ 916548735      │ Plaza Magallón 15        │                  │ Madrid               │ Madrid      │ Spain          │ 28011         │ 30                         │ 5050           │
│ 20             │ Americh Golf Management SL  │ Mario           │ Suarez            │ 964493072      │ 964493063      │ C/Letardo                │                  │ Barcelona            │ Cataluña    │ Spain          │ 12320         │ 12                         │ 20000          │
│ 21             │ Aloha                       │ Cristian        │ Rodrigez          │ 916485852      │ 914489898      │ C/Roman 3                │                  │ Canarias             │ Canarias    │ Spain          │ 35488         │ 12                         │ 50000          │
│ 22             │ El Prat                     │ Francisco       │ Camacho           │ 916882323      │ 916493211      │ Avenida Tibidabo         │                  │ Barcelona            │ Cataluña    │ Spain          │ 12320         │ 12                         │ 30000          │
│ 24             │ Vivero Humanes              │ Federico        │ Gomez             │ 654987690      │ 916040875      │ C/Miguel Echegaray 54    │                  │ Humanes              │ Madrid      │ Spain          │ 28970         │ 30                         │ 7430           │
│ 25             │ Fuenla City                 │ Tony            │ Muñoz Mena        │ 675842139      │ 915483754      │ C/Callo 52               │                  │ Fuenlabrada          │ Madrid      │ Spain          │ 28574         │ 5                          │ 4500           │
│ 29             │ Top Campo                   │ Joseluis        │ Sanchez           │ 685746512      │ 974315924      │ C/Ibiza 32               │                  │ Humanes              │ Madrid      │ Spain          │ 28574         │ 5                          │ 5500           │
│ 31             │ Campohermoso                │ Luis            │ Jimenez           │ 645925376      │ 916159116      │ C/Peru 78                │                  │ Fuenlabrada          │ Madrid      │ Spain          │ 28945         │ 30                         │ 3250           │
│ 32             │ france telecom              │ FraÃ§ois        │ Toulou            │ (33)5120578961 │ (33)5120578961 │ 6 place d Alleray 15Ã¨me │                  │ Paris                │             │ France         │ 75010         │ 16                         │ 10000          │
│ 33             │ Musée du Louvre             │ Pierre          │ Delacroux         │ (33)0140205050 │ (33)0140205442 │ Quai du Louvre           │                  │ Paris                │             │ France         │ 75058         │ 16                         │ 30000          │
│ 36             │ Flores S.L.                 │ Antonio         │ Romero            │ 654352981      │ 685249700      │ Avenida España           │                  │ Madrid               │ Fuenlabrada │ Spain          │ 29643         │ 18                         │ 6000           │
│ 37             │ The Magic Garden            │ Richard         │ Mcain             │ 926523468      │ 9364875882     │ Lihgting Park            │                  │ London               │ London      │ United Kingdom │ 65930         │ 18                         │ 10000          │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴────────────────┴────────────────┴──────────────────────────┴──────────────────┴──────────────────────┴─────────────┴────────────────┴───────────────┴────────────────────────────┴────────────────┘
```
### Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
```sql

SELECT * from cliente
   ...> WHERE codigo_cliente IN (SELECT DISTINCT codigo_cliente from pago);     
┌────────────────┬────────────────────────────────┬─────────────────┬───────────────────┬─────────────┬─────────────┬────────────────────────────────────────────┬───────────────────┬──────────────────────────┬─────────────────────┬───────────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │         nombre_cliente         │ nombre_contacto │ apellido_contacto │  telefono   │     fax     │              linea_direccion1              │ linea_direccion2  │          ciudad          │       region        │   pais    │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼────────────────────────────────┼─────────────────┼───────────────────┼─────────────┼─────────────┼────────────────────────────────────────────┼───────────────────┼──────────────────────────┼─────────────────────┼───────────┼───────────────┼────────────────────────────┼────────────────┤
│ 1              │ GoldFish Garden                │ Daniel G        │ GoldFish          │ 5556901745  │ 5556901746  │ False Street 52 2 A                        │                   │ San Francisco            │                     │ USA       │ 24006         │ 19                         │ 3000           │
│ 3              │ Gardening Associates           │ Anne            │ Wright            │ 5557410345  │ 5557410346  │ Wall-e Avenue                              │                   │ Miami                    │ Miami               │ USA       │ 24010         │ 19                         │ 6000           │
│ 4              │ Gerudo Valley                  │ Link            │ Flaute            │ 5552323129  │ 5552323128  │ Oaks Avenue nº22                           │                   │ New York                 │                     │ USA       │ 85495         │ 22                         │ 12000          │
│ 5              │ Tendo Garden                   │ Akane           │ Tendo             │ 55591233210 │ 55591233211 │ Null Street nº69                           │                   │ Miami                    │                     │ USA       │ 696969        │ 22                         │ 600000         │
│ 7              │ Beragua                        │ Jose            │ Bermejo           │ 654987321   │ 916549872   │ C/pintor segundo                           │ Getafe            │ Madrid                   │ Madrid              │ Spain     │ 28942         │ 11                         │ 20000          │
│ 9              │ Naturagua                      │ Guillermo       │ Rengifo           │ 689234750   │ 916428956   │ C/majadahonda                              │ Boadilla          │ Madrid                   │ Madrid              │ Spain     │ 28947         │ 11                         │ 32000          │
│ 13             │ Camunas Jardines S.L.          │ Pedro           │ Camunas           │ 34914873241 │ 34914871541 │ C/Virgenes 45                              │ C/Princesas 2 1ºB │ San Lorenzo del Escorial │ Madrid              │ Spain     │ 28145         │ 8                          │ 16481          │
│ 14             │ Dardena S.A.                   │ Juan            │ Rodriguez         │ 34912453217 │ 34912484764 │ C/Nueva York 74                            │                   │ Madrid                   │ Madrid              │ Spain     │ 28003         │ 8                          │ 321000         │
│ 15             │ Jardin de Flores               │ Javier          │ Villar            │ 654865643   │ 914538776   │ C/ Oña 34                                  │                   │ Madrid                   │ Madrid              │ Spain     │ 28950         │ 30                         │ 40000          │
│ 16             │ Flores Marivi                  │ Maria           │ Rodriguez         │ 666555444   │ 912458657   │ C/Leganes24                                │                   │ Fuenlabrada              │ Madrid              │ Spain     │ 28945         │ 5                          │ 1500           │
│ 19             │ Golf S.A.                      │ Luis            │ Martinez          │ 916458762   │ 912354475   │ C/Estancado                                │                   │ Santa cruz de Tenerife   │ Islas Canarias      │ Spain     │ 38297         │ 12                         │ 30000          │
│ 23             │ Sotogrande                     │ Maria           │ Santillana        │ 915576622   │ 914825645   │ C/Paseo del Parque                         │                   │ Sotogrande               │ Cadiz               │ Spain     │ 11310         │ 12                         │ 60000          │
│ 26             │ Jardines y Mansiones Cactus SL │ Eva María       │ Sánchez           │ 916877445   │ 914477777   │ Polígono Industrial Maspalomas, Nº52       │ Móstoles          │ Madrid                   │ Madrid              │ Spain     │ 29874         │ 9                          │ 76000          │
│ 27             │ Jardinerías Matías SL          │ Matías          │ San Martín        │ 916544147   │ 917897474   │ C/Francisco Arce, Nº44                     │ Bustarviejo       │ Madrid                   │ Madrid              │ Spain     │ 37845         │ 9                          │ 100500         │
│ 28             │ Agrojardin                     │ Benito          │ Lopez             │ 675432926   │ 916549264   │ C/Mar Caspio 43                            │                   │ Getafe                   │ Madrid              │ Spain     │ 28904         │ 30                         │ 8040           │
│ 30             │ Jardineria Sara                │ Sara            │ Marquez           │ 675124537   │ 912475843   │ C/Lima 1                                   │                   │ Fuenlabrada              │ Madrid              │ Spain     │ 27584         │ 5                          │ 7500           │
│ 35             │ Tutifruti S.A                  │ Jacob           │ Jones             │ 2 9261-2433 │ 2 9283-1695 │ level 24, St. Martins Tower.-31 Market St. │                   │ Sydney                   │ Nueva Gales del Sur │ Australia │ 2000          │ 31                         │ 10000          │
│ 38             │ El Jardin Viviente S.L         │ Justin          │ Smith             │ 2 8005-7161 │ 2 8005-7162 │ 176 Cumberland Street The rocks            │                   │ Sydney                   │ Nueva Gales del Sur │ Australia │ 2003          │ 31                         │ 8000           │
└────────────────┴────────────────────────────────┴─────────────────┴───────────────────┴─────────────┴─────────────┴────────────────────────────────────────────┴───────────────────┴──────────────────────────┴─────────────────────┴───────────┴───────────────┴────────────────────────────┴────────────────┘
```
### Devuelve un listado de los productos que nunca han aparecido en un pedido.
```sql

SELECT p.* from producto as p 
   ...> JOIN detalle_pedido on p.codigo_producto = detalle_pedido.codigo_producto WHERE detalle_pedido.codigo_producto is NULL;
```
### Devuelve un listado de los productos que han aparecido en un pedido alguna vez.
```sql
SELECT p.* from producto as p 
   ...> JOIN detalle_pedido on p.codigo_producto = detalle_pedido.codigo_producto;

El resultado son casi todos
```

### Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
```sql
SELECT cl.nombre_cliente, COUNT(p.codigo_pedido) as clantidad_pedidos FROM cliente as cl
   ...> JOIN pedido p on cl.codigo_cliente=p.codigo_cliente 
   ...> GROUP BY cl.codigo_cliente, cl.nombre_cliente;
┌────────────────────────────────┬──────────────────┐
│         nombre_cliente         │ cantidad_pedidos │
├────────────────────────────────┼──────────────────┤
│ GoldFish Garden                │ 11               │
│ Gardening Associates           │ 9                │
│ Gerudo Valley                  │ 5                │
│ Tendo Garden                   │ 5                │
│ Beragua                        │ 5                │
│ Naturagua                      │ 5                │
│ Camunas Jardines S.L.          │ 5                │
│ Dardena S.A.                   │ 5                │
│ Jardin de Flores               │ 5                │
│ Flores Marivi                  │ 10               │
│ Golf S.A.                      │ 5                │
│ Sotogrande                     │ 5                │
│ Jardines y Mansiones Cactus SL │ 5                │
│ Jardinerías Matías SL          │ 5                │
│ Agrojardin                     │ 5                │
│ Jardineria Sara                │ 10               │
│ Tutifruti S.A                  │ 5                │
│ Flores S.L.                    │ 5                │
│ El Jardin Viviente S.L         │ 5                │
└────────────────────────────────┴──────────────────┘
```

### Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
```sql

SELECT cl.nombre_cliente, SUM(p.total) as total_pagado FROM cliente c 
   ...> JOIN pago p on cl.codigo_cliente = p.codigo_cliente 
   ...> GROUP BY cl.codigo_cliente, cl.nombre_cliente;
┌────────────────────────────────┬──────────────┐
│         nombre_cliente         │ total_pagado │
├────────────────────────────────┼──────────────┤
│ GoldFish Garden                │ 4000         │
│ Gardening Associates           │ 10926        │
│ Gerudo Valley                  │ 81849        │
│ Tendo Garden                   │ 23794        │
│ Beragua                        │ 2390         │
│ Naturagua                      │ 929          │
│ Camunas Jardines S.L.          │ 2246         │
│ Dardena S.A.                   │ 4160         │
│ Jardin de Flores               │ 12081        │
│ Flores Marivi                  │ 4399         │
│ Golf S.A.                      │ 232          │
│ Sotogrande                     │ 272          │
│ Jardines y Mansiones Cactus SL │ 18846        │
│ Jardinerías Matías SL          │ 10972        │
│ Agrojardin                     │ 8489         │
│ Jardineria Sara                │ 7863         │
│ Tutifruti S.A                  │ 3321         │
│ El Jardin Viviente S.L         │ 1171         │
└────────────────────────────────┴──────────────┘
```
### Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
```sql

SELECT cl.nombre_cliente FROM cliente c 
   ...> JOIN pedido p ON cl.codigo_cliente=p.codigo_cliente WHERE strftime('%Y', p.fecha_pedido) = '2008'
   ...> GROUP BY cl.nombre_cliente 
   ...> ORDER BY cl.nombre_cliente ASC;
┌────────────────────────────────┐
│         nombre_cliente         │
├────────────────────────────────┤
│ Camunas Jardines S.L.          │
│ Dardena S.A.                   │
│ El Jardin Viviente S.L         │
│ Flores Marivi                  │
│ Flores S.L.                    │
│ Gerudo Valley                  │
│ GoldFish Garden                │
│ Jardin de Flores               │
│ Jardines y Mansiones Cactus SL │
│ Tendo Garden                   │
│ Tutifruti S.A                  │
└────────────────────────────────┘
```
### Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
```sql
SELECT cl.nombre_cliente, e.nombre, e.apellido1, o.telefono FROM cliente c
   ...> JOIN empleado e ON cl.codigo_empleado_rep_ventas = e.codigo_empleado 
   ...> JOIN oficina o ON e.codigo_oficina = o.codigo_oficina 
   ...> WHERE cl.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);
┌─────────────────────────────┬─────────────┬────────────┬─────────────────┐
│       nombre_cliente        │   nombre    │ apellido1  │    telefono     │
├─────────────────────────────┼─────────────┼────────────┼─────────────────┤
│ Lasas S.A.                  │ Mariano     │ López      │ +34 91 7514487  │
│ Club Golf Puerta del hierro │ Emmanuel    │ Magaña     │ +34 93 3561182  │
│ DaraDistribuciones          │ Emmanuel    │ Magaña     │ +34 93 3561182  │
│ Madrileña de riegos         │ Emmanuel    │ Magaña     │ +34 93 3561182  │
│ Lasas S.A.                  │ Mariano     │ López      │ +34 91 7514487  │
│ Flowers, S.A                │ Felipe      │ Rosas      │ +34 925 867231  │
│ Naturajardin                │ Julian      │ Bellinelli │ +61 2 9264 2451 │
│ Americh Golf Management SL  │ José Manuel │ Martinez   │ +34 93 3561182  │
│ Aloha                       │ José Manuel │ Martinez   │ +34 93 3561182  │
│ El Prat                     │ José Manuel │ Martinez   │ +34 93 3561182  │
│ Vivero Humanes              │ Julian      │ Bellinelli │ +61 2 9264 2451 │
│ Fuenla City                 │ Felipe      │ Rosas      │ +34 925 867231  │
│ Top Campo                   │ Felipe      │ Rosas      │ +34 925 867231  │
│ Campohermoso                │ Julian      │ Bellinelli │ +61 2 9264 2451 │
│ france telecom              │ Lionel      │ Narvaez    │ +33 14 723 4404 │
│ Musée du Louvre             │ Lionel      │ Narvaez    │ +33 14 723 4404 │
│ Flores S.L.                 │ Michael     │ Bolton     │ +1 650 219 4782 │
│ The Magic Garden            │ Michael     │ Bolton     │ +1 650 219 4782 │
└─────────────────────────────┴─────────────┴────────────┴─────────────────┘

```
### Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.
```sql

SELECT cl.nombre_cliente, e.nombre, e.apellido1, o.ciudad FROM cliente c
   ...> JOIN empleado e ON cl.codigo_empleado_rep_ventas = e.codigo_empleado 
   ...> JOIN oficina o ON e.codigo_oficina = o.codigo_oficina;
┌────────────────────────────────┬─────────────────┬────────────┬──────────────────────┐
│         nombre_cliente         │     nombre      │ apellido1  │        ciudad        │
├────────────────────────────────┼─────────────────┼────────────┼──────────────────────┤
│ GoldFish Garden                │ Walter Santiago │ Sanchez    │ San Francisco        │
│ Gardening Associates           │ Walter Santiago │ Sanchez    │ San Francisco        │
│ Gerudo Valley                  │ Lorena          │ Paxton     │ Boston               │
│ Tendo Garden                   │ Lorena          │ Paxton     │ Boston               │
│ Lasas S.A.                     │ Mariano         │ López      │ Madrid               │
│ Beragua                        │ Emmanuel        │ Magaña     │ Barcelona            │
│ Club Golf Puerta del hierro    │ Emmanuel        │ Magaña     │ Barcelona            │
│ Naturagua                      │ Emmanuel        │ Magaña     │ Barcelona            │
│ DaraDistribuciones             │ Emmanuel        │ Magaña     │ Barcelona            │
│ Madrileña de riegos            │ Emmanuel        │ Magaña     │ Barcelona            │
│ Lasas S.A.                     │ Mariano         │ López      │ Madrid               │
│ Camunas Jardines S.L.          │ Mariano         │ López      │ Madrid               │
│ Dardena S.A.                   │ Mariano         │ López      │ Madrid               │
│ Jardin de Flores               │ Julian          │ Bellinelli │ Sydney               │
│ Flores Marivi                  │ Felipe          │ Rosas      │ Talavera de la Reina │
│ Flowers, S.A                   │ Felipe          │ Rosas      │ Talavera de la Reina │
│ Naturajardin                   │ Julian          │ Bellinelli │ Sydney               │
│ Golf S.A.                      │ José Manuel     │ Martinez   │ Barcelona            │
│ Americh Golf Management SL     │ José Manuel     │ Martinez   │ Barcelona            │
│ Aloha                          │ José Manuel     │ Martinez   │ Barcelona            │
│ El Prat                        │ José Manuel     │ Martinez   │ Barcelona            │
│ Sotogrande                     │ José Manuel     │ Martinez   │ Barcelona            │
│ Vivero Humanes                 │ Julian          │ Bellinelli │ Sydney               │
│ Fuenla City                    │ Felipe          │ Rosas      │ Talavera de la Reina │
│ Jardines y Mansiones Cactus SL │ Lucio           │ Campoamor  │ Madrid               │
│ Jardinerías Matías SL          │ Lucio           │ Campoamor  │ Madrid               │
│ Agrojardin                     │ Julian          │ Bellinelli │ Sydney               │
│ Top Campo                      │ Felipe          │ Rosas      │ Talavera de la Reina │
│ Jardineria Sara                │ Felipe          │ Rosas      │ Talavera de la Reina │
│ Campohermoso                   │ Julian          │ Bellinelli │ Sydney               │
│ france telecom                 │ Lionel          │ Narvaez    │ Paris                │
│ Musée du Louvre                │ Lionel          │ Narvaez    │ Paris                │
│ Tutifruti S.A                  │ Mariko          │ Kishi      │ Sydney               │
│ Flores S.L.                    │ Michael         │ Bolton     │ San Francisco        │
│ The Magic Garden               │ Michael         │ Bolton     │ San Francisco        │
│ El Jardin Viviente S.L         │ Mariko          │ Kishi      │ Sydney               │
└────────────────────────────────┴─────────────────┴────────────┴──────────────────────┘
```
### Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
```sql
SELECT e.nombre, e.apellido1, e.puesto, o.telefono FROM empleado e
   ...> JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
   ...> WHERE e.codigo_empleado NOT IN (
(x1...> SELECT codigo_empleado_rep_ventas FROM cliente WHERE codigo_empleado_rep_ventas IS NOT NULL);
┌─────────────┬────────────┬───────────────────────┬─────────────────┐
│   nombre    │ apellido1  │        puesto         │    telefono     │
├─────────────┼────────────┼───────────────────────┼─────────────────┤
│ Marcos      │ Magaña     │ Director General      │ +34 925 867231  │
│ Ruben       │ López      │ Subdirector Marketing │ +34 925 867231  │
│ Alberto     │ Soria      │ Subdirector Ventas    │ +34 925 867231  │
│ Maria       │ Solís      │ Secretaria            │ +34 925 867231  │
│ Juan Carlos │ Ortiz      │ Representante Ventas  │ +34 925 867231  │
│ Carlos      │ Soria      │ Director Oficina      │ +34 91 7514487  │
│ Hilario     │ Rodriguez  │ Representante Ventas  │ +34 91 7514487  │
│ David       │ Palma      │ Representante Ventas  │ +34 93 3561182  │
│ Oscar       │ Palma      │ Representante Ventas  │ +34 93 3561182  │
│ Francois    │ Fignon     │ Director Oficina      │ +33 14 723 4404 │
│ Laurent     │ Serra      │ Representante Ventas  │ +33 14 723 4404 │
│ Hilary      │ Washington │ Director Oficina      │ +1 215 837 0825 │
│ Marcus      │ Paxton     │ Representante Ventas  │ +1 215 837 0825 │
│ Nei         │ Nishikori  │ Director Oficina      │ +81 33 224 5000 │
│ Narumi      │ Riko       │ Representante Ventas  │ +81 33 224 5000 │
│ Takuma      │ Nomura     │ Representante Ventas  │ +81 33 224 5000 │
│ Amy         │ Johnson    │ Director Oficina      │ +44 20 78772041 │
│ Larry       │ Westfalls  │ Representante Ventas  │ +44 20 78772041 │
│ John        │ Walton     │ Representante Ventas  │ +44 20 78772041 │
│ Kevin       │ Fallmer    │ Director Oficina      │ +61 2 9264 2451 │
└─────────────┴────────────┴───────────────────────┴─────────────────┘
```
### Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
```sql

SELECT o.ciudad, COUNT(e.codigo_empleado) as numero_empleados FROM oficina o
   ...> JOIN empleado e ON o.codigo_oficina = e.codigo_oficina 
   ...> GROUP BY o.ciudad;
┌──────────────────────┬──────────────────┐
│        ciudad        │ numero_empleados │
├──────────────────────┼──────────────────┤
│ Barcelona            │ 4                │
│ Boston               │ 3                │
│ Londres              │ 3                │
│ Madrid               │ 4                │
│ Paris                │ 3                │
│ San Francisco        │ 2                │
│ Sydney               │ 3                │
│ Talavera de la Reina │ 6                │
│ Tokyo                │ 3                │
└──────────────────────┴──────────────────┘
```