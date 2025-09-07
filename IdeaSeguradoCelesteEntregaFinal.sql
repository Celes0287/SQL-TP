CREATE DATABASE IF NOT EXISTS TiendaOutdoor;
USE TiendaOutdoor;

-- Tabla de Clientes --
CREATE TABLE IF NOT EXISTS clientes (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    edad INT,
    genero VARCHAR(50),
    estado_suscripcion INT,
    compras_anteriores INT
);

ALTER TABLE clientes
ADD COLUMN mail VARCHAR(60);

-- Tabla de Productos --
CREATE TABLE IF NOT EXISTS productos (
	id_producto INT  PRIMARY KEY,
    nombre_producto VARCHAR(50),
    categoria VARCHAR(50)
    );
    
-- Tabla de Estados --  
CREATE TABLE IF NOT EXISTS estados (  
	id_estado INT PRIMARY KEY,
    nombre_estado VARCHAR(50)
    );
    
-- Tabla Metodo de pago --
CREATE TABLE IF NOT EXISTS metodo_pago (
	id_metodo INT PRIMARY KEY,
    metodo_de_pago VARCHAR(50)
    );

SELECT * FROM metodo_pago;

-- Tabla de Envios --
CREATE TABLE IF NOT EXISTS envios (
		id_envio INT PRIMARY KEY,
        tipo_de_envio VARCHAR(50)
        );
        
	SELECT * FROM envios;
    
        
-- Tabla de ventas --
CREATE TABLE IF NOT EXISTS ventas (
	id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    nombre_producto VARCHAR(50),
    categoria VARCHAR(50),
    monto_gastado INT NOT NULL,
    id_estado INT,
    temporada VARCHAR(50),
    estado_suscripcion INT,
    id_metodo INT,
    uso_promocion VARCHAR(50),
    id_envio INT,
    estado_del_envio VARCHAR(50),
    compras_anteriores INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_estado) REFERENCES estados(id_estado),
    FOREIGN KEY (id_metodo) REFERENCES metodo_pago(id_metodo),
    FOREIGN KEY (id_envio) REFERENCES envios(id_envio)
    );
    
    SELECT * FROM ventas;
 
-- ******************************************************************************************************
                                -- INSERCION DE DATOS
-- *******************************************************************************************************
                                
    -- inserción de datos en tabla clientes--
INSERT INTO clientes (id_cliente, edad, genero, estado_suscripcion, compras_anteriores) VALUES
(1, 28, 'Masculino', 1, 5),
(2, 35, 'Femenino', 0, 2),
(3, 42, 'No binario', 1, 12),
(4, 23, 'Femenino', 1, 8),
(5, 51, 'Masculino', 0, 0),
(6, 60, 'Masculino', 1, 25),
(7, 19, 'Femenino', 0, 1),
(8, 33, 'Femenino', 1, 6),
(9, 48, 'Masculino', 1, 15),
(10, 29, 'No binario', 0, 3),
(11, 38, 'Femenino', 1, 9),
(12, 55, 'Masculino', 0, 2),
(13, 27, 'Masculino', 1, 7),
(14, 45, 'Femenino', 1, 18),
(15, 21, 'No binario', 0, 4);

SELECT * FROM clientes;

-- inserción de datos tabla envios--
INSERT INTO envios (id_envio, tipo_de_envio) VALUES
(1, 'Express'),
(2, 'Envío Gratis'),
(3, 'Standard'),
(4, 'Retira en tienda'),
(5, 'Express'),
(6, 'Standard'),
(7, 'Envío Gratis'),
(8, 'Retira en tienda'),
(9, 'Express'),
(10, 'Envío Gratis'),
(11, 'Standard'),
(12, 'Retira en tienda'),
(13, 'Express'),
(14, 'Standard'),
(15, 'Envío Gratis');

USE tiendaoutdoor;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM envios;

SELECT * FROM envios;

-- nueva insercion de datos en tabla envios luego de equivocarme y meter mas registros de los que necesitaba--
INSERT INTO envios (id_envio, tipo_de_envio) VALUES
(1, 'Express'),
(2, 'Envío Gratis'),
(3, 'Standard'),
(4, 'Retira en tienda');

SELECT * FROM envios;

-- insercion datos tabla estados--
INSERT INTO estados (id_estado, nombre_estado) VALUES
(1, 'California'),
(2, 'Nueva York'),
(3, 'Texas'),
(4, 'Florida'),
(5, 'Illinois');

SELECT * FROM estados;

-- insercion datos tabla metodo_pago--
INSERT INTO metodo_pago (id_metodo, metodo_de_pago) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta de Crédito'),
(3, 'Transferencia'),
(4, 'QR'),
(5, 'Tarjeta de Débito');

SELECT * FROM metodo_pago;

-- insercion datos tabla productos--
INSERT INTO productos (id_producto, categoria, nombre_producto) VALUES
(1, 'Ropa', 'Pantalón'),
(2, 'Accesorios', 'Gorra_visera'),
(3, 'Calzado', 'Zapatillas_trek'),
(4, 'Ropa', 'Campera'),
(5, 'Accesorios', 'Guantes_termicos'),
(6, 'Ropa', 'Remera_termica'),
(7, 'Calzado', 'Zapatillas_sport'),
(8, 'Accesorios', 'Gorro_lana'),
(9, 'Ropa', 'Bermuda');

USE tiendaoutdoor;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM productos;

SELECT * FROM  productos;

 -- insercion datos tabla ventas --
 INSERT INTO ventas (id_venta, id_cliente, nombre_producto, categoria, monto_gastado, id_estado, temporada, estado_suscripcion, id_metodo, uso_promocion, id_envio, estado_del_envio, compras_anteriores) VALUES
(1, 1, 'Remera_termica', 'Ropa',  53, 2, 'Invierno', 1, 4, 'Si', 2, 'Enviado', 5),
(2, 2, 'Gorro_lana', 'Accesorios', 20, 4, 'Invierno', 0, 3, 'No', 4, 'Retirado', 2),
(3, 3, 'Bermuda', 'Ropa', 65, 3, 'Primavera', 1, 2, 'Si', 2, 'Pendiente', 12),
(4, 4, 'Zapatillas_sport', 'Calzado', 49, 1, 'Verano', 1, 4, 'Si', 1, 'Enviado', 8),
(5, 5, 'Campera', 'Ropa', 85, 2, 'Invierno', 0, 2, 'No', 4, 'Retirado', 0),
(6, 6, 'Guantes_termicos', 'Accesorios', 24, 2, 'Invierno', 1, 5, 'No', 1, 'Enviado', 25),
(7, 7, 'Remera_termica', 'Ropa', 35, 4, 'Otoño', 0, 5, 'Si', 2, 'Pendiente', 1),
(8, 8, 'Pantalon', 'Ropa', 75, 4, 'Verano', 1, 3, 'No', 3, 'Enviado', 6),
(9, 9, 'Pantalon', 'Ropa', 90, 3, 'Verano', 1, 3, 'No', 3, 'Pendiente', 15),
(10, 10, 'Zapatillas_trek', 'Calzado', 60, 4, 'Invierno', 0, 2, 'No', 3, 'Devolucion', 3),
(11, 11, 'Campera', 'Ropa', 55, 2, 'Otoño', 1, 2, 'Si', 1, 'Enviado', 9),
(12, 12, 'Gorra_visera', 'Accesorios', 30, 1, 'Verano', 0, 1, 'No', 4, 'Retirado', 2),
(13, 13, 'Pantalon', 'Ropa', 75, 2, 'Verano', 1, 2, 'Si', 3, 'Pendiente', 7),
(14, 14, 'Medias_soft', 'Accesorios', 15, 2, 'Invierno', 1, 1, 'Si', 4, 'Retirado', 18),
(15, 15, 'Remera_termica', 'Ropa', 30, 4, 'Otoño', 0, 2, 'No', 1, 'Enviado', 4);

USE tiendaoutdoor;
SET SQL_SAFE_UPDATES = 0;
DROP TABLE ventas;

SELECT * FROM ventas;

-- **************************************************************************************
                                    -- Vistas
-- **************************************************************************************
 
 -- Vista donde se muestra las ventas con envios pendientes --
CREATE VIEW vw_envios_pendientes AS
SELECT COUNT(id_venta) AS cantidad_ventas_pendientes
FROM ventas
WHERE estado_del_envio = 'Pendiente';

DROP VIEW vw_envios_pendientes;

SELECT * FROM vw_envios_pendientes;

-- Vista donde se muestra si en algun estado no se realizaron ventas --
CREATE VIEW vw_estado_sin_venta AS
SELECT e.nombre_estado
FROM estados e
LEFT JOIN ventas v ON e.id_estado = v.id_estado
WHERE V.id_estado IS NULL;

DROP VIEW vw_estado_sin_venta;
SELECT * FROM vw_estado_sin_venta;

-- Vista de ventas por estado --
CREATE VIEW vw_ventas_por_estado AS
SELECT e.nombre_estado, count(v.id_venta) AS cantidad_de_ventas
FROM ventas v
LEFT JOIN estados e ON v.id_estado = e.id_estado
GROUP BY nombre_estado
ORDER BY cantidad_de_ventas DESC; 

SELECT * FROM vw_ventas_por_estado;

-- Vista de producto sin vender --
CREATE VIEW vw_productos_sin_vender AS
SELECT p.nombre_producto, v.id_venta
FROM productos p
LEFT JOIN ventas v ON p.nombre_producto = v.nombre_producto
WHERE v.id_venta IS NULL;

DROP VIEW vw_productos_sin_vender;
SELECT * FROM vw_productos_sin_vender;

-- Vista de ventas por género --
CREATE VIEW vw_ventas_por_genero AS
SELECT c.genero, COUNT(v.id_venta) AS cantidad_ventas,
       SUM(v.monto_gastado) AS total_gastado
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.genero;

SELECT * FROM vw_ventas_por_genero;

-- *********************************************************************
                            -- Funciones --
-- *********************************************************************

-- Función que calcula el monto total vendido --
DELIMITER //
CREATE FUNCTION Totalvendido ()
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
DECLARE Total_ventas DECIMAL (10, 2);
SELECT SUM(monto_gastado) INTO Total_ventas FROM ventas;
RETURN Total_ventas;
END //
DELIMITER ;

SELECT Totalvendido();
 -- Error Code: 1318. Incorrect number of arguments for FUNCTION tiendaoutdoor.Totalvendido; expected 0, got 1


-- Función para calcular el promedio de gasto de las ventas --
DELIMITER //
CREATE FUNCTION promedio_gastado ()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE promedio_de_gasto DECIMAL(10,2);
SELECT AVG(monto_gastado) INTO Promedio_de_gasto FROM ventas;
RETURN promedio_de_gasto;
END //
DELIMITER ;

SELECT Promedio_gastado();

-- ************************************************************
                    -- PROCEDIMIENTOS
-- ***********************************************************

-- Procedimiento que actualiza los envios pendientes en enviados --
DELIMITER //
CREATE PROCEDURE actualizar_estado_envio()
BEGIN
    UPDATE ventas
    SET estado_del_envio = 'Enviado'
    WHERE estado_del_envio = 'Pendiente';
END//
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;
CALL actualizar_estado_envio;

SELECT * FROM ventas;

-- Procedimiento para agregar un nuevo producto a la tabla productos --
DELIMITER //
CREATE PROCEDURE nuevo_producto(
IN p_id_producto INT,
IN p_nombre_producto VARCHAR(50),
IN p_categoria VARCHAR(50)
)
BEGIN
	INSERT INTO productos (id_producto, nombre_producto, categoria)
    VALUES (p_id_producto, p_nombre_producto, p_categoria);
    END //
    DELIMITER ; 
    
    CALL nuevo_producto(10, 'Calza_termica', 'Ropa');
    
    SELECT * FROM productos;
    
DROP PROCEDURE nuevo_producto;

-- ************************************************************************
                             -- Triggers
-- ************************************************************************

-- Triggers que elimina del stock un producto de una tabla stock cuando se realiza una venta
CREATE TABLE stock_productos (
id_stock INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    nombre_producto VARCHAR(50),
    cantidad_disponible INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Insercion de datos en tabla stock_productos --
INSERT INTO stock_productos(id_producto, nombre_producto, cantidad_disponible) VALUES
(1, 'Pantalón', 20),
(2, 'Gorra_visera', 5),
(3, 'Zapatillas_trek', 7),
(4, 'Campera', 8),
(5, 'Guantes_termicos', 3),
(6, 'Remera_termica', 25),
(7, 'Zapatillas_sport', 5),
(8, 'Gorro_lana', 6),
(9, 'Bermuda', 13),
(10, 'Calza_termica', 15);

SELECT * FROM stock_productos;

DROP TRIGGER IF EXISTS stock_actualizado;

DELIMITER //
CREATE TRIGGER stock_actualizado
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
	UPDATE stock_productos
    SET cantidad_disponible = cantidad_disponible - 1
    WHERE nombre_producto = NEW.nombre_producto;
END //
DELIMITER ;
    
SET SQL_SAFE_UPDATES = 0;   
INSERT INTO ventas (id_venta, id_cliente, nombre_producto, categoria, monto_gastado, id_estado, temporada, estado_suscripcion, id_metodo, uso_promocion, id_envio, estado_del_envio, compras_anteriores) VALUES
(16, 14, 'Campera', 'Ropa', 75, 4, 'Otoño', 1, 3, 'No', 3, 'Enviado', 18);

SELECT * FROM ventas;

-- Trigger que agrega un cliente con 5 compras anteriores o más a la tabla de clientes fidelizados

CREATE TABLE clientes_fidelizados(
id_cliente_fiel INT PRIMARY KEY AUTO_INCREMENT,
id_cliente INT,
genero VARCHAR(50),
nombre_cliente VARCHAR(50),
edad INT,
mail VARCHAR(60),
compras_anteriores INT,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

DROP TABLE IF EXISTS clientes_fidelizados;

INSERT INTO clientes_fidelizados(id_cliente_fiel, id_cliente, genero, nombre_cliente, edad, mail, compras_anteriores) VALUES
(1, 1, 'Masculino', 'Lucas Rodriguez', 28, 'lucasrodriguez1@gmail.com', 5),
(2, 3, 'No binario', 'Eliana Fernandez', 42, 'elif343@gmail.com', 12),
(3, 4, 'Femenino', 'Vanesa Ortiz', 23, 'vaneortiz43@hotmail.com', 8),
(4, 6, 'Masculino','Hugo German Mendez', 60, 'hgmendez@gmail.com', 25),
(5, 8, 'Femenino', 'Karen Prieto', 33, 'kprieto222@gmail.com', 6),
(6, 9, 'Masculino', 'Sebastian Gimenez', 48, 'gimenez.seba@gmail.com', 15),
(7, 11, 'Femenino', ' Claudia Lorenzo', 38, 'latanalorenzo@gmail.com', 9),
(8, 13, 'Masculino', 'Lorenzo Giletta', 27, 'gilettalorenzo@gmail.com', 7),
(9, 14, 'Femenino', 'Celeste Segurado', 45, 'segurado.celes@gmail.com', 18);

SELECT * FROM clientes_fidelizados;

DROP TRIGGER IF EXISTS agregar_cliente_fidelizado;

DELIMITER //
CREATE TRIGGER agregar_cliente_fidelizado
AFTER UPDATE ON clientes
FOR EACH ROW
BEGIN
	IF NEW.compras_anteriores >= 5 THEN
    INSERT INTO clientes_fidelizados (id_cliente, genero, edad, mail, compras_anteriores)
        VALUES (NEW.id_cliente, NEW.genero, NEW.edad, NEW.mail, NEW.compras_anteriores);
    END IF;
END//
DELIMITER ;

SELECT id_cliente, compras_anteriores
FROM clientes
WHERE compras_anteriores <= 4;

SET SQL_SAFE_UPDATES = 0;

UPDATE clientes SET compras_anteriores = 5 
WHERE id_cliente = 15;
