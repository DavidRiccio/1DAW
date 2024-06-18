
-- Función de encapsulamiento
DELIMITER //

DROP FUNCTION IF EXISTS comprobante; 
DELIMITER //+

CREATE FUNCTION comprobante(notas DECIMAL) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    IF notas < 0 THEN
        SET notas = 0;
    ELSEIF notas > 10 THEN
        SET notas = 10;
    END IF;
RETURN notas;
END//

DELIMITER ;


-- Triggers de before
DROP TRIGGER IF EXISTS insert_notas;
DELIMITER //
CREATE TRIGGER insert_notas
BEFORE INSERT ON alumno
FOR EACH ROW
BEGIN
    SET NEW.notas = comprobante(NEW.notas);
END//

DELIMITER ;



DROP TRIGGER IF EXISTS update_notas;
DELIMITER //
CREATE TRIGGER update_notas
BEFORE UPDATE ON alumno
FOR EACH ROW
BEGIN
    SET NEW.notas = comprobante(OLD.notas);
END//

DELIMITER ;



-- Procedimiento

DELIMITER //

DROP PROCEDURE IF EXISTS insercion_alumnos;

CREATE PROCEDURE insercion_alumnos(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE aux INT DEFAULT 0;
    DECLARE nombre_random VARCHAR(25);
    DECLARE apellido1 VARCHAR(25);
    DECLARE apellido2 VARCHAR(25);
    DECLARE notas DECIMAL(10,2);

    WHILE counter < iterations DO
        SET aux = aux + FLOOR(RAND() * (10 - 100 + 1) + 100);
        SET nombre_random = CONCAT('Alumno', '-', aux);
        SET apellido1 = CONCAT('Apellido1', '-', aux);
        SET apellido2 = CONCAT('Apellido2', '-', aux);
        SET notas = ((RAND() * (10 - 3)) + 3);
        INSERT INTO alumno (nombre, apellido1, apellido2, notas)
        VALUES (nombre_random, apellido1, apellido2, notas);

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;



DELIMITER //

DROP PROCEDURE IF EXISTS insercion_alumnos_notas_inferior;

CREATE PROCEDURE insercion_alumnos_notas_inferior(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE aux INT DEFAULT 0;
    DECLARE nombre_random VARCHAR(25);
    DECLARE apellido1 VARCHAR(25);
    DECLARE apellido2 VARCHAR(25);
    DECLARE notas DECIMAL(10,2);


    WHILE counter < iterations DO
        SET aux = aux + FLOOR(RAND() * (10 - 100 + 1) + 100);
        SET nombre_random = CONCAT('Alumno', '-', aux);
        SET apellido1 = CONCAT('Apellido1', '-', aux);
        SET apellido2 = CONCAT('Apellido2', '-', aux);
        SET notas = ((RAND() * (12 - -10)) + -10);
        INSERT INTO alumno (nombre, apellido1, apellido2, notas)
        VALUES (nombre_random, apellido1, apellido2, notas);

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;



