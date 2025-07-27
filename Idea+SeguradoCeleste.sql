-- Pre entrega 1 - SQL - Segurado Celeste --

CREATE DATABASE IF NOT EXISTS TiendaOutdoor;
USE TiendaOutdoor;

-- Tabla de Clientes --
CREATE TABLE IF NOT EXISTS Clientes (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    edad INT,
    genero VARCHAR(50),
    estado_suscripcion INT,
    compras_anteriores INT
);

-- Tabla de Productos --
CREATE TABLE IF NOT EXISTS Productos (
	id_producto INT  PRIMARY KEY,
    nombre_producto VARCHAR(50),
    categoria VARCHAR(50)
    );
    
-- Tabla de Estados --  
CREATE TABLE IF NOT EXISTS Estados (  
	id_estado INT PRIMARY KEY,
    nombre_estado VARCHAR(50)
    );
    
-- Tabla Metodo de pago --
CREATE TABLE IF NOT EXISTS Metodo_Pago (
	id_metodo INT PRIMARY KEY,
    metodo_de_pago VARCHAR(50)
    );

SELECT * FROM metodo_pago;

-- Tabla de Envios --
CREATE TABLE IF NOT EXISTS Envios (
		id_envio INT PRIMARY KEY,
        tipo_de_envio VARCHAR(50)
        );
	
	SELECT * FROM envios;
        
-- Tabla de ventas --
CREATE TABLE IF NOT EXISTS Ventas (
	id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    edad INT,
    genero VARCHAR(50),
    nombre_producto VARCHAR(50),
    categoria VARCHAR(50),
    size VARCHAR(50),
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
   
    