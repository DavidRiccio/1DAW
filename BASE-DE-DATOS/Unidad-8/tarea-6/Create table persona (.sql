DROP TABLE IF EXISTS persona; 
CREATE TABLE IF NOT EXISTS persona (
    id varchar(50)  PRIMARY KEY,
    nombre VARCHAR(50),
    salario_base INT,
    Subsidio DECIMAL(10,2),
    salud DECIMAL(10,2),
    pension DECIMAL(10,2),
    Bono DECIMAL(10,2),
    Integral DECIMAL(10,2)
);
--CREACION DE LAS FUNCIONES

DROP FUNCTION IF EXISTS subsidio; 
DELIMITER $$

CREATE FUNCTION subsidio(salario_actual DECIMAL) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    SET total = salario_actual * 0.07;
RETURN total;
END$$


DELIMITER ;


DROP FUNCTION IF EXISTS salud; 
DELIMITER $$

CREATE FUNCTION salud(salario_actual DECIMAL) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;

    SET total = salario_actual * 0.04;
RETURN total;
END$$

DELIMITER ;




DROP FUNCTION IF EXISTS pension; 
DELIMITER $$

CREATE FUNCTION pension(salario_actual DECIMAL) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    SET total = salario_actual * 0.04;
    RETURN total;
END $$

DELIMITER ;




--CREACION DEL TRIGGER
DROP FUNCTION IF EXISTS bono; 
DELIMITER $$

CREATE FUNCTION bono(salario_actual DECIMAL) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    SET total = salario_actual * 0.08;
    RETURN total;
END $$

DELIMITER ;


DELIMITER $$

DROP TRIGGER IF EXISTS before_insert_persona;

CREATE TRIGGER before_insert_persona
BEFORE INSERT ON persona
FOR EACH ROW
BEGIN
    DECLARE salario_base DECIMAL;
    DECLARE subsidio DECIMAL;
    DECLARE salud_val DECIMAL;
    DECLARE pension_val DECIMAL;
    DECLARE bono_val DECIMAL;
    DECLARE integral_val DECIMAL;
    SET salario_base = FLOOR(RAND() * (2000 - 1000 + 1)) + 1000;
    SET NEW.salario_base = salario_base;

    SET subsidio = subsidio_transporte(salario_base);
    SET salud_val = salud(salario_base);
    SET pension_val = pension(salario_base);
    SET bono_val = bono(salario_base);
    SET integral_val = salario_base - salud_val - pension_val + bono_val + subsidio;

    SET NEW.subsidio = subsidio;
    SET NEW.salud = salud_val;
    SET NEW.pension = pension_val;
    SET NEW.bono = bono_val;
    SET NEW.integral = integral_val;
END $$

DELIMITER ;



















-- CREACION DEL PROCEDIMIENTO 
DROP PROCEDURE IF EXISTS InsertPersona;
DELIMITER $$

CREATE PROCEDURE InsertPersona(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE nombre_usuario varchar(100);
    DECLARE salario_base decimal(10,2);
    DECLARE id VARCHAR(9);
    WHILE counter < iterations DO
        SET id = SUBSTRING_INDEX(UUID(), '-', 1);
        SET nombre_usuario = SUBSTRING_INDEX(UUID(), '-', -1);
        SET salario_base = FLOOR(RAND() * (2000 - 1000 + 1)) + 1000;
        INSERT INTO persona (id,nombre, salario_base) VALUES (id,nombre_usuario, salario_base);
        SET counter = counter + 1;
    END WHILE;
END $$

DELIMITER ;