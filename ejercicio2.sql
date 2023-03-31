DROP DATABASE IF EXISTS ejercicio2;
CREATE DATABASE ejercicio2;
USE ejercicio2;

CREATE TABLE piezas (
	codigo int PRIMARY KEY AUTO_INCREMENT,
    nombre char(100)
);

CREATE TABLE proveedores (
	id char(4) PRIMARY KEY,
    nombre char(100)
);

CREATE TABLE suministra (
	codigo_pieza int,
	id_proveedor char(4),
	precio int,
	PRIMARY KEY(codigo_pieza, id_proveedor),
	FOREIGN KEY (codigo_pieza) REFERENCES piezas (codigo),
	FOREIGN KEY (id_proveedor) REFERENCES proveedores (id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO piezas (nombre) VALUES 
	('Amortiguador'), 
	('Caja cambios'), 
	('Disco freno'), 
	('Bujia'), 
	('Luz delantera'), 
	('Luz trasera'), 
	('Intermitente'), 
	('Pneumatico'), 
	('Retrovisor'), 
	('Escape');

INSERT INTO proveedores VALUES 
	('yama','Yamaha'), 
	('hond','Honda'), 
	('duca','Ducati'), 
	('apri','Aprilia'), 
	('kawa','Kawasaki'),
	('bmw','BMW'),
	('audi','Audi'),
	('opel','Opel'),
	('ford','Ford'),
	('chev','Chevrolet');
	

INSERT INTO suministra VALUES 
	(1, 'yama', 1250),
	(2, 'duca', 750),
    	(3, 'hond', 150),
    	(4, 'kawa', 35),
    	(5, 'apri', 980),
    	(7, 'opel', 1980),
	(8, 'ford', 950),
	(9, 'ford', 70),
	(9, 'bmw', 85),
	(6, 'hond', 430);
	
