--¿Sabías que la gestión adecuada del inventario es crucial para el éxito de cualquier tienda? Aunque existen ciertas condiciones que debes cumplir para mantener un inventario eficiente. Descubre los requisitos básicos para la gestión de inventarios.

-- Para gestionar el inventario se deben cumplir varias condiciones:

-- El producto debe tener un precio superior a $0.
-- No haber recibido un nuevo lote del mismo producto en un periodo anterior a 30 días.
-- Teniendo en cuenta esta información se pide:

-- Crea una base de datos llamada inventario.


-- Crea una tabla llamada producto con los siguientes campos:

-- Identificador Auto Incremental (Integer) PK
-- Nombre del producto (Texto) 
-- Precio (Decimal)
-- Stock (Entero)
-- Categoría (Texto)
-- Fecha Última Entrada (Datetime)  

CREATE TABLE producto (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nombre Text,
    Precio Decimal,
    Stock Integer,
    Categoría text,
    Fecha_Ultima_Entrada Datetime
);


-- Se pide:

-- Realiza los siguientes procedimientos:

-- (1) Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla. El procedimiento debe recibir como parámetro de entrada, al menos, el número de registros que se desea insertar y se debe lanzar, al menos, en dos ocasiones, para verificar su correcto funcionamiento. Los datos deben ser aleatorios, es decir, en cada inserción se debe auto generar o seleccionar uno al azar, de los campos requeridos


DROP PROCEDURE IF EXISTS insertProducto;
DELIMITER //
CREATE PROCEDURE insertProducto(in iterator INT)
BEGIN 
    DECLARE Nombre text;
    DECLARE precio Decimal(10,2);
    DECLARE Stock INTEGER;
    DECLARE Fecha Datetime;
    DECLARE categoria text;
    DECLARE counter INT default 0 ;

    WHILE iterator > counter DO
        SET Nombre=CONCAT('Cliente',counter);
        SET PRECIO = RAND() * (1000 - 10 + 1) + 10;
        SET Stock = FLOOR((RAND()*1000-10+1)+10);
        SET Fecha = NOW();
        SET categoria = CONCAT('Categoria',counter);

        INSERT INTO producto(precio,stock,Fecha_Ultima_Entrada,Categoría,Nombre) VALUES (precio,Stock,Fecha,categoria,Nombre);
        SET counter = counter +1;
    END WHILE ;
END //
DELIMITER ;




-- (2) Realiza un procedimiento que permita actualizar la fecha de última entrada, teniendo como parámetro de entrada el identificador del producto y una fecha.
DROP PROCEDURE IF EXISTS actualizarFecha;
DELIMITER //
CREATE PROCEDURE actualizarFecha(in id_new INT, in fecha Datetime)
BEGIN 
UPDATE producto set Fecha_Ultima_Entrada=fecha where Id=id_new;
END //
DELIMITER ;


-- (3) Crea un procedimiento llamado CalcularTotalStock que calcule la cantidad total de productos en stock por cada categoría y la almacene en una tabla llamada total_stock. La tabla total_stock debe tener dos columnas: categoria (texto) y cantidad_total (integer).
DELIMITER //

-- Procedimiento para procesar pedidos
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



-- (4) Crea un procedimiento que permita eliminar una categoría de la tabla total_stock.

    DROP PROCEDURE IF EXISTS BorrarCategoria;
    DELIMITER //
    CREATE PROCEDURE BorrarCategoria(in categoria_new text)
    BEGIN 
    DELETE from total_stock where categoria=categoria_new;
    END //
    DELIMITER ;

-- Realizar cada una de las siguientes funciones:

-- (1) Realiza una función que determine si un producto almacenado en la tabla producto puede recibir una nueva entrada. Para ello, la función recibe como parámetro de entrada el identificador del producto y una fecha de entrada. Revisa las condiciones para que un producto pueda o no recibir una nueva entrada. Posteriormente, actualice el valor de la última entrada del producto indicado con el parámetro de entrada.
DROP FUNCTION IF EXISTS PuedeRecibirNuevaEntrada;
DELIMITER //

CREATE FUNCTION PuedeRecibirNuevaEntrada(p_id INT, new_fecha_entrada DATETIME)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE current_fecha_entrada DATETIME;

    -- Verifica si el producto existe y obtiene la fecha de la última entrada
    SELECT Fecha_Ultima_Entrada INTO current_fecha_entrada
    FROM producto
    WHERE Id = p_id;

    -- Si el producto no existe, devuelve FALSE
    IF current_fecha_entrada IS NULL THEN
        RETURN FALSE;
    END IF;

    -- Si la nueva fecha de entrada es mayor que la fecha de la última entrada, actualiza y devuelve TRUE
    IF new_fecha_entrada > current_fecha_entrada THEN
        UPDATE producto
        SET Fecha_Ultima_Entrada = new_fecha_entrada
        WHERE Id = p_id;
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //

DELIMITER ;




-- (2) Realiza una función que determine cuál es la categoría con más productos en stock.
DROP FUNCTION IF EXISTS CategoriaConMasStock;
DELIMITER //

CREATE FUNCTION CategoriaConMasStock() 
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE max_categoria TEXT;
    
    SELECT categoria
    INTO max_categoria
    FROM total_stock
    ORDER BY cantidad_total DESC
    LIMIT 2;
    
    RETURN max_categoria;
END //

DELIMITER ;

 



-- Triggers

-- (1) Realiza un trigger que actualice total_stock con cada una de las inserciones que se realicen en la tabla producto.
   DROP TRIGGER IF EXISTS UpdateTotalStock;
DELIMITER //

CREATE TRIGGER UpdateTotalStock
AFTER INSERT ON producto
FOR EACH ROW
BEGIN
    DECLARE stock_count INT;

    -- Check if the category already exists in total_stock
    SELECT COUNT(*)
    INTO stock_count
    FROM total_stock
    WHERE categoría = NEW.Categoría;

    IF stock_count > 0 THEN
        -- If the category exists, update the total stock
        UPDATE total_stock
        SET cantidad_total = cantidad_total + NEW.Stock
        WHERE categoría = NEW.Categoría;
    ELSE
        -- If the category does not exist, insert a new row
        INSERT INTO total_stock (categoría, cantidad_total)
        VALUES (NEW.Categoría, NEW.Stock);
    END IF;
END //

DELIMITER ;





-- (2) Realiza un trigger que elimine todos los registros en la tabla producto cuando se elimine un registro de la tabla total_stock.
DROP TRIGGER IF EXISTS BorrarRegistro;
DELIMITER //

CREATE TRIGGER BorrarRegistro
AFTER DELETE ON total_stock
FOR EACH ROW
BEGIN
    DELETE FROM producto WHERE Categoría = OLD.categoria;
END //

DELIMITER ;

