<h1 align="center"> Tarea consultas 3</h1>

### Muestra el nombre de todos los empleados en mayúsculas.

```sql
select upper(nombre) from empleados ;
```
```sql
┌───────────────┐
│ upper(nombre) │
├───────────────┤
│ JUAN          │
│ MARíA         │
│ CARLOS        │
│ ANA           │
│ PEDRO         │
│ LAURA         │
│ JAVIER        │
│ CARMEN        │
│ MIGUEL        │
│ ELENA         │
│ DIEGO         │
│ SOFíA         │
│ ANDRéS        │
│ ISABEL        │
│ RAúL          │
│ PATRICIA      │
│ ALEJANDRO     │
│ NATALIA       │
│ ROBERTO       │
│ BEATRIZ       │
└───────────────┘
```
### Calcula el valor absoluto del salario de todos los empleados.
```sql
select abs(salario) from empleados;
```
```sql
┌──────────────┐
│ abs(salario) │
├──────────────┤
│ 50000.0      │
│ 60000.0      │
│ 55000.0      │
│ 48000.0      │
│ 70000.0      │
│ 52000.0      │
│ 48000.0      │
│ 65000.0      │
│ 51000.0      │
│ 55000.0      │
│ 72000.0      │
│ 49000.0      │
│ 60000.0      │
│ 53000.0      │
│ 68000.0      │
│ 47000.0      │
│ 71000.0      │
│ 54000.0      │
│ 49000.0      │
│ 63000.0      │
└──────────────┘
```
###  Muestra la fecha actual.

```sql
SELECT CURRENT_DATE AS fecha_actual FROM empleados LIMIT 1;
```
```sql
┌──────────────┐
│ fecha_actual │
├──────────────┤
│ 2024-01-17   │
└──────────────┘
```
###  Calcula el promedio de salarios de todos los empleados.
```sql
select avg(salario) from empleados ;
```
```sql
┌──────────────┐
│ avg(salario) │
├──────────────┤
│ 57000.0      │
└──────────────┘
```
### Convierte la cadena '123' a un valor entero
```sql
select cast(salario as INTEger) as salario_entero from empleados ;
```
```sql
┌────────────────┐
│ salario_entero │
├────────────────┤
│ 50000          │
│ 60000          │
│ 55000          │
│ 48000          │
│ 70000          │
│ 52000          │
│ 48000          │
│ 65000          │
│ 51000          │
│ 55000          │
│ 49000          │
│ 72000          │
│ 60000          │
│ 53000          │
│ 68000          │
│ 47000          │
│ 71000          │
│ 54000          │
│ 49000          │
│ 63000          │
└────────────────┘
```
###  Concatena el nombre y el departamento de cada empleado.
```sql
select nombre||' '||departamento as NombreDep  from empleados ;
```
```sql
┌───────────────────────────┐
│         NombreDep         │
├───────────────────────────┤
│ Juan Ventas               │
│ María TI                  │
│ Carlos Ventas             │
│ Ana Recursos Humanos      │
│ Pedro TI                  │
│ Laura Ventas              │
│ Javier Recursos Humanos   │
│ Carmen TI                 │
│ Miguel Ventas             │
│ Elena Recursos Humanos    │
│ Diego TI                  │
│ Sofía Ventas              │
│ Andrés Recursos Humanos   │
│ Isabel TI                 │
│ Raúl Ventas               │
│ Patricia Recursos Humanos │
│ Alejandro TI              │
│ Natalia Ventas            │
│ Roberto Recursos Humanos  │
│ Beatriz TI                │
└───────────────────────────┘
```
### Concatena el nombre y el departamento de cada empleado con un guion como separador.
```sql
select nombre||'-'||departamento as NombreDep  from empleados ;
```
```sql
┌───────────────────────────┐
│         NombreDep         │
├───────────────────────────┤
│ Juan-Ventas               │
│ María-TI                  │
│ Carlos-Ventas             │
│ Ana-Recursos Humanos      │
│ Pedro-TI                  │
│ Laura-Ventas              │
│ Javier-Recursos Humanos   │
│ Carmen-TI                 │
│ Miguel-Ventas             │
│ Elena-Recursos Humanos    │
│ Diego-TI                  │
│ Sofía-Ventas              │
│ Andrés-Recursos Humanos   │
│ Isabel-TI                 │
│ Raúl-Ventas               │
│ Patricia-Recursos Humanos │
│ Alejandro-TI              │
│ Natalia-Ventas            │
│ Roberto-Recursos Humanos  │
│ Beatriz-TI                │
└───────────────────────────┘
```
###  Categoriza a los empleados según sus salarios.


XXXXXXXXXXXXXXXXXXXXX

### Calcula la suma total de salarios de todos los empleados.



```sql
select sum(salario ) from empleados;
```
```sql
┌───────────────┐
│ sum(salario ) │
├───────────────┤
│ 1140000.0     │
└───────────────┘
```


### Redondea el salario de todos los empleados a dos decimales.
```sql
select round(salario ,2) from empleados ;
```
```sql
┌───────────────────┐
│ round(salario ,2) │
├───────────────────┤
│ 50000.0           │
│ 60000.0           │
│ 55000.0           │
│ 48000.0           │
│ 70000.0           │
│ 52000.0           │
│ 48000.0           │
│ 65000.0           │
│ 51000.0           │
│ 55000.0           │
│ 72000.0           │
│ 49000.0           │
│ 60000.0           │
│ 53000.0           │
│ 68000.0           │
│ 47000.0           │
│ 71000.0           │
│ 54000.0           │
│ 49000.0           │
│ 63000.0           │
└───────────────────┘
```
### Muestra la longitud de cada nombre de empleado.
```sql
select length(nombre) from empleados;
```
```sql
┌────────────────┐
│ length(nombre) │
├────────────────┤
│ 4              │
│ 5              │
│ 6              │
│ 3              │
│ 5              │
│ 5              │
│ 6              │
│ 6              │
│ 6              │
│ 5              │
│ 5              │
│ 5              │
│ 6              │
│ 6              │
│ 4              │
│ 8              │
│ 9              │
│ 7              │
│ 7              │
│ 7              │
└────────────────┘
```
###  Cuenta el número total de empleados en cada departamento.

xxxxxxxxxxxxxxxxxxxxxxxxxxx

### Muestra la hora actual.
```sql
select current_time as hora_actual from empleados limit 1;
```
```sql
┌─────────────┐
│ hora_actual │
├─────────────┤
│ 19:09:14    │
└─────────────┘
```
### Convierte el salario a un valor de punto flotante.
```sql
select cast(salario as real) as salario_decimal from empleados ;
```
```sql
┌─────────────────┐
│ salario_decimal │
├─────────────────┤
│ 50000.0         │
│ 60000.0         │
│ 55000.0         │
│ 48000.0         │
│ 70000.0         │
│ 52000.0         │
│ 48000.0         │
│ 65000.0         │
│ 51000.0         │
│ 55000.0         │
│ 72000.0         │
│ 49000.0         │
│ 60000.0         │
│ 53000.0         │
│ 68000.0         │
│ 47000.0         │
│ 71000.0         │
│ 54000.0         │
│ 49000.0         │
│ 63000.0         │
└─────────────────┘
```
###  Muestra los primeros tres caracteres de cada nombre de empleado.
```sql
select substr(nombre ,1,3) as nombre_3letters from empleados ;
```
```sql
┌─────────────────┐
│ nombre_3letters │
├─────────────────┤
│ Jua             │
│ Mar             │
│ Car             │
│ Ana             │
│ Ped             │
│ Lau             │
│ Jav             │
│ Car             │
│ Mig             │
│ Ele             │
│ Die             │
│ Sof             │
│ And             │
│ Isa             │
│ Raú             │
│ Pat             │
│ Ale             │
│ Nat             │
│ Rob             │
│ Bea             │
└─────────────────┘
```

## COMANDOS DE ORDENACION 

### Empleados en el departamento de 'Ventas' con salarios superiores a 52000
```sql
select * from empleados where salario > 52000 order BY salario ;
```
```sql
┌────┬───────────┬─────────┬──────────────────┐
│ id │  nombre   │ salario │   departamento   │
├────┼───────────┼─────────┼──────────────────┤
│ 14 │ Isabel    │ 53000.0 │ TI               │
│ 18 │ Natalia   │ 54000.0 │ Ventas           │
│ 3  │ Carlos    │ 55000.0 │ Ventas           │
│ 10 │ Elena     │ 55000.0 │ Recursos Humanos │
│ 2  │ María     │ 60000.0 │ TI               │
│ 13 │ Andrés    │ 60000.0 │ Recursos Humanos │
│ 20 │ Beatriz   │ 63000.0 │ TI               │
│ 8  │ Carmen    │ 65000.0 │ TI               │
│ 15 │ Raúl      │ 68000.0 │ Ventas           │
│ 5  │ Pedro     │ 70000.0 │ TI               │
│ 17 │ Alejandro │ 71000.0 │ TI               │
│ 11 │ Diego     │ 72000.0 │ TI               │
└────┴───────────┴─────────┴──────────────────┘
```
### Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.

```sql
select * from empleados where nombre like '%a%' order by salario asc;
```
```sql
┌────┬───────────┬─────────┬──────────────────┐
│ id │  nombre   │ salario │   departamento   │
├────┼───────────┼─────────┼──────────────────┤
│ 16 │ Patricia  │ 47000.0 │ Recursos Humanos │
│ 4  │ Ana       │ 48000.0 │ Recursos Humanos │
│ 7  │ Javier    │ 48000.0 │ Recursos Humanos │
│ 12 │ Sofía     │ 49000.0 │ Ventas           │
│ 1  │ Juan      │ 50000.0 │ Ventas           │
│ 6  │ Laura     │ 52000.0 │ Ventas           │
│ 14 │ Isabel    │ 53000.0 │ TI               │
│ 18 │ Natalia   │ 54000.0 │ Ventas           │
│ 3  │ Carlos    │ 55000.0 │ Ventas           │
│ 10 │ Elena     │ 55000.0 │ Recursos Humanos │
│ 2  │ María     │ 60000.0 │ TI               │
│ 13 │ Andrés    │ 60000.0 │ Recursos Humanos │
│ 20 │ Beatriz   │ 63000.0 │ TI               │
│ 8  │ Carmen    │ 65000.0 │ TI               │
│ 15 │ Raúl      │ 68000.0 │ Ventas           │
│ 17 │ Alejandro │ 71000.0 │ TI               │
└────┴───────────┴─────────┴──────────────────┘
```
### Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.
```sql
select * from empleados WHERE departamento ='Recursos Humanos' and salario BETWEEN 45000 and 55000;
```
```sql
┌────┬──────────┬─────────┬──────────────────┐
│ id │  nombre  │ salario │   departamento   │
├────┼──────────┼─────────┼──────────────────┤
│ 4  │ Ana      │ 48000.0 │ Recursos Humanos │
│ 7  │ Javier   │ 48000.0 │ Recursos Humanos │
│ 10 │ Elena    │ 55000.0 │ Recursos Humanos │
│ 16 │ Patricia │ 47000.0 │ Recursos Humanos │
│ 19 │ Roberto  │ 49000.0 │ Recursos Humanos │
└────┴──────────┴─────────┴──────────────────┘
```
###  Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.
```sql
select * from empleados order by salario DESC LIMIT 5;
```
```sql
┌────┬───────────┬─────────┬──────────────┐
│ id │  nombre   │ salario │ departamento │
├────┼───────────┼─────────┼──────────────┤
│ 11 │ Diego     │ 72000.0 │ TI           │
│ 17 │ Alejandro │ 71000.0 │ TI           │
│ 5  │ Pedro     │ 70000.0 │ TI           │
│ 15 │ Raúl      │ 68000.0 │ Ventas       │
│ 8  │ Carmen    │ 65000.0 │ TI           │
└────┴───────────┴─────────┴──────────────┘
```
### Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.
```sql
select * from empleados where nombre like 'n%' or nombre like 'm%' and 
salario>50000;
```
```sql
┌────┬─────────┬─────────┬──────────────┐
│ id │ nombre  │ salario │ departamento │
├────┼─────────┼─────────┼──────────────┤
│ 2  │ María   │ 60000.0 │ TI           │
│ 9  │ Miguel  │ 51000.0 │ Ventas       │
│ 18 │ Natalia │ 54000.0 │ Ventas       │
└────┴─────────┴─────────┴──────────────┘
```
### Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.
```sql
select * from empleados where departamento = 'TI' order by nombre ;
```
```sql
┌────┬───────────┬─────────┬──────────────┐
│ id │  nombre   │ salario │ departamento │
├────┼───────────┼─────────┼──────────────┤
│ 17 │ Alejandro │ 71000.0 │ TI           │
│ 20 │ Beatriz   │ 63000.0 │ TI           │
│ 8  │ Carmen    │ 65000.0 │ TI           │
│ 11 │ Diego     │ 72000.0 │ TI           │
│ 14 │ Isabel    │ 53000.0 │ TI           │
│ 2  │ María     │ 60000.0 │ TI           │
│ 5  │ Pedro     │ 70000.0 │ TI           │
└────┴───────────┴─────────┴──────────────┘
```
### Empleados con salarios únicos (eliminando duplicados) en orden ascendente
```sql
select DISTINCT salario from empleados order by salario DESC;
```
```sql
┌─────────┐
│ salario │
├─────────┤
│ 72000.0 │
│ 71000.0 │
│ 70000.0 │
│ 68000.0 │
│ 65000.0 │
│ 63000.0 │
│ 60000.0 │
│ 55000.0 │
│ 54000.0 │
│ 53000.0 │
│ 52000.0 │
│ 51000.0 │
│ 50000.0 │
│ 49000.0 │
│ 48000.0 │
│ 47000.0 │
└─────────┘
```


### Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.
```sql
 select * from empleados where nombre like '%o' or nombre like '%a' and departamento = 'Ventas';
 ```
 ```sql
┌────┬───────────┬─────────┬──────────────────┐
│ id │  nombre   │ salario │   departamento   │
├────┼───────────┼─────────┼──────────────────┤
│ 5  │ Pedro     │ 70000.0 │ TI               │
│ 6  │ Laura     │ 52000.0 │ Ventas           │
│ 11 │ Diego     │ 72000.0 │ TI               │
│ 12 │ Sofía     │ 49000.0 │ Ventas           │
│ 17 │ Alejandro │ 71000.0 │ TI               │
│ 18 │ Natalia   │ 54000.0 │ Ventas           │
│ 19 │ Roberto   │ 49000.0 │ Recursos Humanos │
└────┴───────────┴─────────┴──────────────────┘
```
### Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.
```sql

select * from empleados where salario NOT BETWEEN 55000 and 70000 order by departamento ;
```
```sql
┌────┬───────────┬─────────┬──────────────────┐
│ id │  nombre   │ salario │   departamento   │
├────┼───────────┼─────────┼──────────────────┤
│ 4  │ Ana       │ 48000.0 │ Recursos Humanos │
│ 7  │ Javier    │ 48000.0 │ Recursos Humanos │
│ 16 │ Patricia  │ 47000.0 │ Recursos Humanos │
│ 19 │ Roberto   │ 49000.0 │ Recursos Humanos │
│ 11 │ Diego     │ 72000.0 │ TI               │
│ 14 │ Isabel    │ 53000.0 │ TI               │
│ 17 │ Alejandro │ 71000.0 │ TI               │
│ 1  │ Juan      │ 50000.0 │ Ventas           │
│ 6  │ Laura     │ 52000.0 │ Ventas           │
│ 9  │ Miguel    │ 51000.0 │ Ventas           │
│ 12 │ Sofía     │ 49000.0 │ Ventas           │
│ 18 │ Natalia   │ 54000.0 │ Ventas           │
└────┴───────────┴─────────┴──────────────────┘
```
### Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.
```sql
select * from empleados where nombre not like '%e%';
```
```sql
┌────┬──────────┬─────────┬──────────────────┐
│ id │  nombre  │ salario │   departamento   │
├────┼──────────┼─────────┼──────────────────┤
│ 1  │ Juan     │ 50000.0 │ Ventas           │
│ 2  │ María    │ 60000.0 │ TI               │
│ 3  │ Carlos   │ 55000.0 │ Ventas           │
│ 4  │ Ana      │ 48000.0 │ Recursos Humanos │
│ 6  │ Laura    │ 52000.0 │ Ventas           │
│ 12 │ Sofía    │ 49000.0 │ Ventas           │
│ 13 │ Andrés   │ 60000.0 │ Recursos Humanos │
│ 15 │ Raúl     │ 68000.0 │ Ventas           │
│ 16 │ Patricia │ 47000.0 │ Recursos Humanos │
│ 18 │ Natalia  │ 54000.0 │ Ventas           │
└────┴──────────┴─────────┴──────────────────┘
```