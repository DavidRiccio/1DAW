/* Trigger: trigger_guardar_email_after_update:

Se ejecuta sobre la tabla alumnos.
Se ejecuta después de una operación de actualización.
Cada vez que un alumno modifique su dirección de email se deberá insertar un nuevo registro en una tabla llamada log_cambios_email.
La tabla log_cambios_email contiene los siguientes campos:
id: clave primaria (entero autonumérico)
id_alumno: id del alumno (entero)
fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
old_email: valor anterior del email (cadena de caracteres)
new_email: nuevo valor con el que se ha actualizado */


DROP FUNCTION IF EXISTS crear_email;
DELIMITER //
CREATE FUNCTION crear_email(nombre VARCHAR(255),apellido1 VARCHAR(255), apellido2 VARCHAR(255), dominio VARCHAR(255)) 
RETURNS VARCHAR(255);
DETERMINISTIC
BEGIN 
DECLARE email VARCHAR(255);
    SET email = CONCAT(
        SUBSTRING(nombre, 1, 1),
        SUBSTRING(apellido1, 1, 3),
        SUBSTRING(apellido2, 1, 3),
        '@',
        dominio
    );
    RETURN email;
END //
DELIMITER ;


DROP FUNCTION IF EXISTS eliminar_acentos;
DELIMITER //
CREATE FUNCTION eliminar_acentos(cadena VARCHAR(255))
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
SET cadena = REPLACE(cadena,'á','a');
SET cadena = REPLACE(cadena,'é','e');
SET cadena = REPLACE(cadena,'í','i');
SET cadena = REPLACE(cadena,'ó','o');
SET cadena = REPLACE(cadena,'ú','u');
RETURN cadena;

END //
DELIMITER ;

--TRIGGER
DROP TRIGGER IF EXISTS trigger_crear_email;
DELIMITER //
CREATE TRIGGER trigger_crear_email
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.email is NULL THEN
    SET NEW.email=crear_email(NEW.nombre,NEW.apellido1,NEW.apellido2,'iespto.es');
    END IF;
END //
DELIMITER ;

--SALIDA
INSERT INTO alumnos(nombre,apellido1,apellido2) VALUES('peepe','benavente','gonzalez');
Query OK, 1 row affected (0,00 sec)

mysql> select * from alumnos;
+----+--------+-----------+-----------+-------------------+
| id | nombre | apellido1 | apellido2 | email             |
+----+--------+-----------+-----------+-------------------+
|  1 | peepe  | benavente | gonzalez  | pbengon@iespto.es |
+----+--------+-----------+-----------+-------------------+
--PROCEDIMIENTO

DROP PROCEDURE IF EXISTS 
DELIMITER //
CREATE PROCEDURE insertAlumnos(in iterador int)
BEGIN
DECLARE nombre VARCHAR(255);
DECLARE apellido1 VARCHAR(255);
DECLARE apellido2 VARCHAR(255);
DECLARE email VARCHAR(255);
DECLARE counter int DEFAULT 0;

WHILE iterador > counter DO
SET nombre  = SUBSTRING_INDEX(UUID(),' ',1);
SET apellido1 = SUBSTRING_INDEX(UUID(),'-',1);
SET apellido2 = SUBSTRING_INDEX(UUID(),'_',1);
SET email = NULL;

INSERT INTO alumnos (nombre, apellido1, apellido2, email)
        VALUES (nombre, apellido1, apellido2, email);

    SET counter = counter + 1
END WHILE;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS insertAlumnos;
DELIMITER //

CREATE PROCEDURE insertAlumnos(IN iterador INT)
BEGIN
    DECLARE nombre VARCHAR(255);
    DECLARE apellido1 VARCHAR(255);
    DECLARE apellido2 VARCHAR(255);
    DECLARE email VARCHAR(255);
    DECLARE counter INT DEFAULT 0;

    WHILE iterador > counter DO
        SET nombre = SUBSTRING_INDEX(UUID(),'-', 1);
        SET apellido1 = SUBSTRING_INDEX(SUBSTRING_INDEX(UUID(), '-', 2), '-', -1);
        SET apellido2 = SUBSTRING_INDEX(UUID(), '_', 1);
        SET email = NULL;

        INSERT INTO alumnos (nombre, apellido1, apellido2, email)
        VALUES (nombre, apellido1, apellido2, email);

        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

select * from alumnos;
+----+--------------------------------------+-----------+--------------------------------------+-------------------+
| id | nombre                               | apellido1 | apellido2                            | email             |
+----+--------------------------------------+-----------+--------------------------------------+-------------------+
|  1 | peepe                                | benavente | gonzalez                             | pbengon@iespto.es |
| 25 | ee830dc1-18e8-11ef-94bf-080027275acd | ee830dec  | ee830e00-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 26 | ee84047e-18e8-11ef-94bf-080027275acd | ee8404ad  | ee8404cd-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 27 | ee845909-18e8-11ef-94bf-080027275acd | ee84592f  | ee845945-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 28 | ee848d81-18e8-11ef-94bf-080027275acd | ee848da1  | ee848db0-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 29 | ee84d5c7-18e8-11ef-94bf-080027275acd | ee84d5dc  | ee84d5e7-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 30 | ee85145c-18e8-11ef-94bf-080027275acd | ee851470  | ee85147a-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 31 | ee855c6f-18e8-11ef-94bf-080027275acd | ee855c84  | ee855c8c-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 32 | ee858fe5-18e8-11ef-94bf-080027275acd | ee858ffd  | ee859006-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 33 | ee85c474-18e8-11ef-94bf-080027275acd | ee85c488  | ee85c491-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 34 | ee861283-18e8-11ef-94bf-080027275acd | ee861297  | ee8612a0-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 35 | ee864b85-18e8-11ef-94bf-080027275acd | ee864ba5  | ee864bb4-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 36 | ee86ac48-18e8-11ef-94bf-080027275acd | ee86ac71  | ee86ac85-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 37 | ee870555-18e8-11ef-94bf-080027275acd | ee87056b  | ee870574-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 38 | ee874d87-18e8-11ef-94bf-080027275acd | ee874da0  | ee874dac-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
| 39 | ee87802c-18e8-11ef-94bf-080027275acd | ee87804c  | ee87805f-18e8-11ef-94bf-080027275acd | eee8ee8@iespto.es |
+----+--------------------------------------+-----------+--------------------------------------+-------------------+
16 rows in set (0,00 sec)

