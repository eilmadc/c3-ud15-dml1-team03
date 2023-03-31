DROP DATABASE IF EXISTS ejercicio3;
CREATE DATABASE ejercicio3;

USE ejercicio3;

/* Entidad CIENTIFICOS */
CREATE TABLE  CIENTIFICOS(
DNI char(8) PRIMARY KEY,
NomApels char(255)
);

/* Entidad PROYECTO */
CREATE TABLE PROYECTO (
id char(4) PRIMARY KEY,
Nombre char(255),
Horas int
);

/* Entidad ASIGNADO_A */
CREATE TABLE ASIGNADO_A (
Cientifico char(8),
KEY(Cientifico),
Proyecto char(50),
KEY (Proyecto),
FOREIGN KEY (Cientifico) REFERENCES CIENTIFICOS (DNI)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Proyecto) REFERENCES PROYECTO (id)
ON DELETE CASCADE ON UPDATE CASCADE
);

/* Insercion de valores a la tabla CIENTIFICOS */
INSERT INTO CIENTIFICOS VALUES	
('111111A','Cientifico 1'),
('2222222B','Cientifico 2'),
('3333333C','Cientifico 3'),
('4444444A','Cientifico 4'),
('5555555B','Cientifico 5'),
('6666666C','Cientifico 6'),
('7777777A','Cientifico 7'),
('8888888B','Cientifico 8'),
('9999999C','Cientifico 9'),
('1010101C','Cientifico 10')
;

/* Insercion de valores a la tabla PROYECTO */
INSERT INTO PROYECTO VALUES	
('1','Proyecto 001', '200'),
('2','Proyecto 002', '3200'),
('3','Proyecto 003', '1500'),
('4','Proyecto 004', '2200'),
('5','Proyecto 005', '65400'),
('6','Proyecto 006', '4200'),
('7','Proyecto 007', '6800'),
('8','Proyecto 008', '2400'),
('9','Proyecto 009', '234300'),
('10','Proyecto 010', '34300')
;

/* Insercion de valores a la tabla ASIGNADO_A */
INSERT INTO ASIGNADO_A VALUES
('111111A','1'),
('2222222B','2'),
('3333333C','3'),
('4444444A','4'),
('5555555B','5'),
('6666666C','6'),
('7777777A','7'),
('8888888B','8'),
('9999999C','9'),
('1010101C','10')
;

SHOW TABLES;
select * from CIENTIFICOS;
select * from PROYECTO;
select * from ASIGNADO_A;