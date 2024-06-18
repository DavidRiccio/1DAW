DROP PROCEDURE IF EXISTS insertUser
DELIMITER //
CREATE PROCEDURE insertUser (in iterations int)
BEGIN 
DECLARE counter int DEFAULT  0;
DECLARE id VARCHAR(36);
DECLARE username VARCHAR(50);
DECLARE email VARCHAR(100);
    WHILE iterations > counter DO

    SET id = SUBSTRING_INDEX(UUID(),'-',1);
    SET username = CONCAT('User',RAND());
    SET email = CONCAT(username,'@empresa.com');

    INSERT INTO users(user_id,username,email) values (id,username,email);
    counter = counter + 1;
    END WHILE;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS insertUser;
DELIMITER //
CREATE PROCEDURE insertUser (IN iterations INT)
BEGIN 
    DECLARE counter INT DEFAULT 0;
    DECLARE id VARCHAR(36);
    DECLARE username VARCHAR(50);
    DECLARE email VARCHAR(100);
    
    WHILE iterations > counter DO
        SET id = SUBSTRING_INDEX(UUID(),'-',1);
        SET username = CONCAT('User', FLOOR(RAND() * 1000000));
        SET email = CONCAT(username, '@empresa.com');

        INSERT INTO users(user_id, username, email) VALUES (id, username, email);
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS user_changes;
DELIMITER //
CREATE TRIGGER user_changes
after UPDATE on users
FOR EACH ROW
BEGIN
insert into user_changes(user_id, old_username, new_username,old_email, new_email, change_date) values (OLD.user_id, OLD.username, NEW.username, OLD.email, NEW.email, NOW());
END //
DELIMITER ;

/* Ejercicio 3: Función de Descuento y Trigger de Precios
Crea una función que calcule el precio final después de aplicar un descuento, y un trigger que use esta función para actualizar el precio de un producto antes de insertarlo en la tabla products. */

DROP FUNCTION IF EXISTS descuento;
DELIMITER //
CREATE FUNCTION descuento (discount_percentage DECIMAL(5,2), price DECIMAL(10,2)) 
RETURNS DECIMAL(10,2) 
DETERMINISTIC
BEGIN 
    RETURN (price * discount_percentage / 100);
END //
DELIMITER ;

DROP TRIGGER IF EXISTS precio_final;
DELIMITER //
CREATE TRIGGER precio_final
BEFORE INSERT ON products
FOR EACH ROW
BEGIN 
    SET NEW.price = price - descuento(NEW.discount_percentage, NEW.price);
END //
DELIMITER ;

DROP FUNCTION IF EXISTS generate_uuid;
DELIMITER //
CREATE FUNCTION generate_uuid() 
RETURNS CHAR(36) 
DETERMINISTIC
BEGIN 
    RETURN UUID();
END //
DELIMITER ;

DROP TRIGGER IF EXISTS log_price;
DELIMITER //
CREATE TRIGGER log_price
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN 
    IF OLD.price != NEW.price THEN
    INSERT INTO price_changes (change_id, product_id, old_price, new_price,change_date)VALUES (generate_uuid(), OLD.product_id, OLD.price, NEW.price,NOW());
    END IF;
END //
DELIMITER ;


/* GENERAR VALORES DENTRO DE UN VALOR DE DOMINIO IF RAND() < 0.5 SET valor = 1 ELSE SET valor = 2;*/
