
/* PROCEDIMIENTOS */

DROP PROCEDURE IF EXISTS insertUser
DELIMITER //
CREATE PROCEDURE insertUser (in iterations int)
BEGIN 
DECLARE counter int DEFAULT  0;
    WHILE iterations > counter DO
    counter = counter + 1;
    END WHILE;
END //
DELIMITER ;


/* FUNCIONES  */

DROP FUNCTION IF EXISTS CategoriaConMasStock;
DELIMITER //
CREATE FUNCTION CategoriaConMasStock() 
RETURNS TEXT
DETERMINISTIC
BEGIN
    SELECT categoria
    INTO max_categoria
    FROM total_stock
    ORDER BY cantidad_total DESC
    LIMIT 2;
    RETURN max_categoria;
END //
DELIMITER ;


/* TRIGGER INSERT */

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

/* TRIGGER DELETE  */

DROP TRIGGER IF EXISTS BorrarRegistro;
DELIMITER //

CREATE TRIGGER BorrarRegistro
AFTER DELETE ON total_stock
FOR EACH ROW
BEGIN
    DELETE FROM producto WHERE Categoría = OLD.categoria;
END //

DELIMITER ;


/* TRIGGER UPDATE */

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

/* PROCEDIMIENTO ACTUALIZACION */

DROP PROCEDURE IF EXISTS actualizarFecha;
DELIMITER //
CREATE PROCEDURE actualizarFecha(in id_new INT, in fecha Datetime)
BEGIN 
UPDATE producto set Fecha_Ultima_Entrada=fecha where Id=id_new;
END //
DELIMITER ;

/* CURSOR  */

DROP PROCEDURE IF EXISTS CalcularTotalStock;
DELIMITER //

CREATE PROCEDURE CalcularTotalStock()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE total_stock INT;
    DECLARE cat TEXT;

    DECLARE cur CURSOR FOR SELECT SUM(Stock), Categoría FROM producto GROUP BY Categoría;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO total_stock, cat;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO total_stock (categoria, cantidad_total) VALUES (cat, total_stock);
    END LOOP;
    CLOSE cur;
END //

DELIMITER ;


DELIMITER ;
