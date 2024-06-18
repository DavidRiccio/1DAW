-- Creación de database y tablas:

CREATE DATABASE bbddalumnos;
USE bbddalumnos;

CREATE TABLE alumnos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    nota FLOAT
);

-- Creación de triggers:


DELIMITER //

CREATE TRIGGER trigger_check_nota_before_insert
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END //


CREATE TRIGGER trigger_check_nota_before_update
BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END //

DELIMITER ;


-- Una vez creados los triggers escriba varias sentencias de inserción y actualización sobre la tabla alumnos y verifica que los triggers se están ejecutando correctamente.

-- Inserciones
INSERT INTO alumnos (nombre, apellido1, apellido2, nota) VALUES ('Juan', 'Perez', 'Gomez', 8.5);
INSERT INTO alumnos (nombre, apellido1, apellido2, nota) VALUES ('Ana', 'Lopez', 'Martinez', -3);
INSERT INTO alumnos (nombre, apellido1, apellido2, nota) VALUES ('Luis', 'Garcia', 'Fernandez', 12);

-- Actualizaciones
UPDATE alumnos SET nota = 9.5 WHERE id = 1;
UPDATE alumnos SET nota = -5 WHERE id = 2;
UPDATE alumnos SET nota = 11 WHERE id = 3;


DELIMITER //

CREATE PROCEDURE insert_alumnos_min_max_3_10(
    IN num_alumnos INT,
    IN min_nota FLOAT,
    IN max_nota FLOAT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < num_alumnos DO
        INSERT INTO alumnos (nombre, apellido1, apellido2, nota) VALUES (
            CONCAT('Alumno', i),
            'Apellido1',
            'Apellido2',
            min_nota + (RAND() * (max_nota - min_nota))
        );
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;


-- Procedimiento 2:

DELIMITER //

CREATE PROCEDURE insert_alumnos_min_max_any(
    IN num_alumnos INT,
    IN min_nota FLOAT,
    IN max_nota FLOAT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < num_alumnos DO
        INSERT INTO alumnos (nombre, apellido1, apellido2, nota) VALUES (
            CONCAT('Alumno', i),
            'Apellido1',
            'Apellido2',
            min_nota + (RAND() * (max_nota - min_nota))
        );
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;


