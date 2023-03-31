/* Eliminamos la tabla si existe para poder crearla de nuevo */
DROP DATABASE IF EXISTS ejercicio10;

/* Aqui la volvemos a crear para usarla de nuevo*/
CREATE DATABASE ejercicio10;
USE ejercicio10;

/* Procedemos a crear las tablas necesarias */
CREATE TABLE liga (
nombre_liga char(50) PRIMARY KEY
);
CREATE TABLE temporada (
temporada_anno int PRIMARY KEY,
nombre_liga char(20),
FOREIGN KEY (nombre_liga) REFERENCES liga (nombre_liga)
);
CREATE TABLE equipo (
nombre_equipo char(50) PRIMARY KEY
);
CREATE TABLE jugador (
nombre_jugador char(50) PRIMARY KEY,
nombre_equipo char(50),
FOREIGN KEY (nombre_equipo) REFERENCES equipo (nombre_equipo)
);
CREATE TABLE partido (
cod_partido char(20) PRIMARY KEY,
nombre_equipo1 char(50) NOT NULL,
FOREIGN KEY (nombre_equipo1) REFERENCES equipo (nombre_equipo),
nombre_equipo2 char(50) NOT NULL,
FOREIGN KEY (nombre_equipo2) REFERENCES equipo (nombre_equipo),
campo char(50) NOT NULL,
temporada_anno int,
FOREIGN KEY (temporada_anno) REFERENCES temporada (temporada_anno)
);

/* Aqui insertamos toda la informacion en las mismas tablas */
INSERT INTO liga VALUES ('Supercopa'), ('Liga Europea'), ('Champions League');

INSERT INTO  temporada VALUES (2022, 'Supercopa'), (2023, 'Liga Europea'), (2024, 'Champions League');

INSERT INTO  equipo VALUES ('FCBarcelona'), ('Real Madrid'), ('Nastic'), ('Valencia');

INSERT INTO jugador VALUES ('Pepe', 'FCBarcelona'), ('Jordi', 'Real Madrid'), ('Ronaldo','Nastic');

INSERT INTO partido VALUES ('qwe12', 'FCBarcelona', 'Real Madrid', 'Barcelona', 2022);

INSERT INTO partido VALUES ('qwe13', 'Nastic', 'Valencia', 'Tarragona', 2023);
