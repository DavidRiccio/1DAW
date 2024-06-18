Crea la bbdd. _ Utilizaremos comandos SQL para crear una base de datos llamada "SimpleDB" que contendrá dos tablas: "Users" para almacenar información de usuarios y "Products" para almacenar información de productos._


```sql
CREATE DATABASE IF NOT EXISTS SimpleDB;

USE SimpleDB;

CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);
```
Realiza la inserción de algunos datos de prueba.
```sql
INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');
INSERT INTO Users (UserName, Email) VALUES ('John Doe', 'john@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Alice Smith', 'alice@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Bob Johnson', 'bob@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Emma Brown', 'emma@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Michael Davis', 'michael@example.com');


INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);
INSERT INTO Products (ProductName, Price) VALUES ('Laptop', 999.99);
INSERT INTO Products (ProductName, Price) VALUES ('Smartphone', 699.50);
INSERT INTO Products (ProductName, Price) VALUES ('Headphones', 99.99);
INSERT INTO Products (ProductName, Price) VALUES ('Tablet', 399.99);
INSERT INTO Products (ProductName, Price) VALUES ('Smartwatch', 199.99);

```

Crea procedimientos almacenados para realizar operaciones como insertar un nuevo usuario, actualizar el nombre de un usuario, etc.

**Procedimiento para insertar un nuevo usuario.**

```sql
DELIMITER //
CREATE procedure InsertUser(in user_name VARCHAR(25), in email VARCHAR(50))
BEGIN 
INSERT INTO Users (UserName, Email) VALUES (User_Name, email);
END //

call InsertUser ('Rudiger','rudiger@gamil.com');
Query OK, 1 row affected (0,01 sec)

 select * from Users;
+--------+---------------+---------------------+
| UserID | UserName      | Email               |
+--------+---------------+---------------------+
|      1 | Juan          | juan@example.com    |
|      2 | María         | maria@example.com   |
|      3 | Pedro         | pedro@example.com   |
|      4 | John Doe      | john@example.com    |
|      5 | Alice Smith   | alice@example.com   |
|      6 | Bob Johnson   | bob@example.com     |
|      7 | Emma Brown    | emma@example.com    |
|      8 | Michael Davis | michael@example.com |
|      9 | Rudiger       | rudiger@gamil.com   |
+--------+---------------+---------------------+
9 rows in set (0,00 sec)


```

**Procedimiento para actualizar el nombre de un usuario.**

```sql
DELIMITER //
CREATE procedure UpdateUser(in Name VARCHAR(25), in NewName VARCHAR(25))
BEGIN 
UPDATE Users SET UserName = NewName
WHERE UserName = Name;
END //

call UpdateUser ('Rudiger','Nacho');

select * from Users;
+--------+---------------+---------------------+
| UserID | UserName      | Email               |
+--------+---------------+---------------------+
|      1 | Juan          | juan@example.com    |
|      2 | María         | maria@example.com   |
|      3 | Pedro         | pedro@example.com   |
|      4 | John Doe      | john@example.com    |
|      5 | Alice Smith   | alice@example.com   |
|      6 | Bob Johnson   | bob@example.com     |
|      7 | Emma Brown    | emma@example.com    |
|      8 | Michael Davis | michael@example.com |
|      9 | Nacho         | rudiger@gamil.com   |
+--------+---------------+---------------------+

```

Implementa funciones para realizar cálculos o consultas:

**Función para calcular el precio total de un conjunto de productos.**
```sql


```
**Función para contar el número de usuarios**

```sql
DELIMITER $$

DROP FUNCTION IF EXISTS count_users;

DELIMITER $$
CREATE FUNCTION CountUsers() RETURNS INT
DETERMINISTIC
BEGIN 
    DECLARE num_users INT;
    SELECT COUNT(UserID) FROM Users into num_users;
    RETURN num_users;
END$$

DELIMITER ;

```



























