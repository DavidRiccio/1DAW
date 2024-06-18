
1---------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE my_loop(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE nombre_usuario varchar(100);
    DECLARE salario_mensual decimal(10,2);
    WHILE counter < iterations DO
        SET nombre_usuario = CONCAT('Empleado', RAND());
        SET salario_mensual = FLOOR(RAND() * (2000 - 1000 + 1)) + 1000;
        
        INSERT INTO empleados (nombre, salario) VALUES (nombre_usuario, salario_mensual);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;


-- Llama al procedimiento 
CALL my_loop(5);



SALIDA:


select * from empleados;
+----+------------------------------+---------+
| id | nombre                       | salario |
+----+------------------------------+---------+
|  1 | Juan                         | 3630.00 |
|  2 | María                        | 4235.00 |
|  3 | Pedro                        | 3872.00 |
|  4 | Juan                         | 3000.00 |
|  5 | María                        | 3500.00 |
|  6 | Pedro                        | 3200.00 |
|  7 | Empleado0.012961484503896427 | 1680.00 |
|  8 | Empleado0.3610723701874468   | 1766.00 |
|  9 | Empleado0.7437219496292267   | 1422.00 |
| 10 | Empleado0.8810659878710899   | 1138.00 |
| 11 | Empleado0.046756499490473884 | 1820.00 |
+----+------------------------------+---------+


2----------------------------------------------------------------------


DELIMITER //

CREATE PROCEDURE my_loop2(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE nombre_usuario varchar(100);
    DECLARE salario_mensual decimal(10,2);
    WHILE counter < iterations DO
        SET nombre_usuario = UUID();
        SET salario_mensual = FLOOR(RAND() * (2000 - 1000 + 1)) + 1000;
        
        INSERT INTO empleados (nombre, salario) VALUES (nombre_usuario, salario_mensual);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;


-- Llama al procedimiento 
CALL my_loop2(3);


SALIDA:

select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3630.00 |
|  2 | María                                | 4235.00 |
|  3 | Pedro                                | 3872.00 |
|  4 | Juan                                 | 3000.00 |
|  5 | María                                | 3500.00 |
|  6 | Pedro                                | 3200.00 |
|  7 | Empleado0.012961484503896427         | 1680.00 |
|  8 | Empleado0.3610723701874468           | 1766.00 |
|  9 | Empleado0.7437219496292267           | 1422.00 |
| 10 | Empleado0.8810659878710899           | 1138.00 |
| 11 | Empleado0.046756499490473884         | 1820.00 |
| 12 | f0c612a5-1202-11ef-bd3b-080027686faa | 1959.00 |
| 13 | f0c7ea57-1202-11ef-bd3b-080027686faa | 1334.00 |
| 14 | f0c9cc6a-1202-11ef-bd3b-080027686faa | 1796.00 |
+----+--------------------------------------+---------+

3-------------------------------------------------------------------------------------

-- Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().

DELIMITER //

CREATE PROCEDURE my_loop3()
BEGIN
    INSERT INTO empleados (nombre, salario)
    SELECT CONCAT('Empleado', ROUND(RAND() * 10000)), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000
    FROM (SELECT 1 AS num UNION SELECT 2 AS num) AS sub
    ORDER BY RAND()
    LIMIT 2;
END//

DELIMITER ;

CALL my_loop3();

DELIMITER ;


4-------------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE my_loop4(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE nombre_usuario varchar(100);
    DECLARE salario_mensual decimal(10,2);
    WHILE counter < iterations DO
        SET nombre_usuario = SUBSTRING_INDEX(UUID(), '-', -1);
        SET salario_mensual = FLOOR(RAND() * (2000 - 1000 + 1)) + 1000;
        
        INSERT INTO empleados (nombre, salario) VALUES (nombre_usuario, salario_mensual);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;


SALIDA:
select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3630.00 |
|  2 | María                                | 4235.00 |
|  3 | Pedro                                | 3872.00 |
|  4 | Juan                                 | 3000.00 |
|  5 | María                                | 3500.00 |
|  6 | Pedro                                | 3200.00 |
|  7 | Empleado0.012961484503896427         | 1680.00 |
|  8 | Empleado0.3610723701874468           | 1766.00 |
|  9 | Empleado0.7437219496292267           | 1422.00 |
| 10 | Empleado0.8810659878710899           | 1138.00 |
| 11 | Empleado0.046756499490473884         | 1820.00 |
| 12 | f0c612a5-1202-11ef-bd3b-080027686faa | 1959.00 |
| 13 | f0c7ea57-1202-11ef-bd3b-080027686faa | 1334.00 |
| 14 | f0c9cc6a-1202-11ef-bd3b-080027686faa | 1796.00 |
| 15 | 080027686faa                         | 1977.00 |
| 16 | 080027686faa                         | 1495.00 |
| 17 | 080027686faa                         | 1546.00 |
| 18 | 080027686faa                         | 1244.00 |
+----+--------------------------------------+---------+
5-------------------------------------------------------------------------------------
DROP PROCEDURE IF Exists ml5;
DELIMITER //

CREATE PROCEDURE ml5(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE nombre_usuario varchar(100);
    DECLARE salario_mensual decimal(10,2);
    WHILE counter < iterations DO
        SET nombre_usuario = CONCAT('Empleado', RAND(counter);
        SET salario_mensual = FLOOR(RAND(counter) * (10000 - 2000 + 1)) + 2000;
        
        INSERT INTO empleados (nombre, salario) VALUES (nombre_usuario, salario_mensual);
        SET counter = counter + 1;
        select * from empleados;
        
    END WHILE;
END//

DELIMITER ;

SALIDA: 

select * from empleados;
+-----+--------------------------------------+----------+
| id  | nombre                               | salario  |
+-----+--------------------------------------+----------+
|   1 | Juan                                 |  3630.00 |
|   2 | María                                |  4235.00 |
|   3 | Pedro                                |  3872.00 |
|   4 | Juan                                 |  3000.00 |
|   5 | María                                |  3500.00 |
|   6 | Pedro                                |  3200.00 |
|   7 | Empleado0.012961484503896427         |  1680.00 |
|   8 | Empleado0.3610723701874468           |  1766.00 |
|   9 | Empleado0.7437219496292267           |  1422.00 |
|  10 | Empleado0.8810659878710899           |  1138.00 |
|  11 | Empleado0.046756499490473884         |  1820.00 |
|  12 | f0c612a5-1202-11ef-bd3b-080027686faa |  1959.00 |
|  13 | f0c7ea57-1202-11ef-bd3b-080027686faa |  1334.00 |
|  14 | f0c9cc6a-1202-11ef-bd3b-080027686faa |  1796.00 |
|  15 | 080027686faa                         |  1977.00 |
|  16 | 080027686faa                         |  1495.00 |
|  17 | 080027686faa                         |  1546.00 |
|  18 | 080027686faa                         |  1244.00 |
| 118 | Empleado1.3598729477821596           |  2707.00 |
| 119 | Empleado2                            |  5459.00 |
| 120 | Empleado2.8571796453159113           |  8212.00 |
| 121 | Empleado2.0387233924481305           | 10964.00 |
| 122 | Empleado3.5758085433168416           |  2715.00 |
| 123 | Empleado4.273049811155582            |  5467.00 |
+-----+--------------------------------------+----------+


--PRUEBAS
6-------------------------------------------------------------------------------------
DROP PROCEDURE IF Exists ml6;
DELIMITER //
CREATE PROCEDURE ml6(IN iterations INT)
BEGIN
    DECLARE rango int DEFAULT 1;
    DECLARE LimiteInferior int DEFAULT 1;
    DECLARE counter INT DEFAULT 0;
    DECLARE nombre_usuario varchar(100);
    DECLARE salario_mensual decimal(10,2);
    DECLARE aux INT DEFAULT 1;
    WHILE counter < iterations DO
        SET nombre_usuario = CONCAT('Empleado',RAND() * rango) + LimiteInferior;
        SET salario_mensual = FLOOR(RAND(counter) * (10000 - 2000 + 1)) + 2000;
        
        INSERT INTO empleados (nombre, salario) VALUES (nombre_usuario, salario_mensual);
        set rango = rango + 1 ;
        SET counter = counter + 1;
        select * from empleados;
        
    END WHILE;
END//

DELIMITER ;


DROP PROCEDURE IF EXISTS ml7;
DELIMITER //
CREATE PROCEDURE ml7(IN iterations INT)
BEGIN
    DECLARE rango INT DEFAULT 1;
    DECLARE LimiteInferior INT DEFAULT 1;
    DECLARE counter INT DEFAULT 0;
    DECLARE nombre_usuario VARCHAR(100);
    DECLARE salario_mensual DECIMAL(10, 2);
    WHILE counter < iterations DO
        SET nombre_usuario = CONCAT('Empleado', CAST((RAND() * rango + LimiteInferior) AS UNSIGNED));
        SET salario_mensual = FLOOR(RAND() * (10000 - 2000 + 1)) + 2000;
        
        INSERT INTO empleados (nombre, salario) VALUES (nombre_usuario, salario_mensual);
        SET rango = rango + 1;
        SET counter = counter + 1;
    END WHILE;
END//
DELIMITER ;
