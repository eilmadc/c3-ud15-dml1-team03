DROP DATABASE IF EXISTS ejercicio17;
CREATE DATABASE ejercicio17;
USE ejercicio17;

CREATE TABLE annos (
	num_anno int PRIMARY KEY
);

CREATE TABLE profesores (
	dni char(9) PRIMARY KEY, 
	nombre char(50) NOT NULL,
	direccion char(50),
	telefono char(50),
	email char(50),
	num_seg_soc char(50),
	cod_interno char(50),
	annos_antig_assign int,
	tutor boolean,
	annos_antig_tutor int
);

CREATE TABLE aulas(
	cod_aula char(50) PRIMARY KEY,
	nombre char(50) UNIQUE,
	numero char(50) UNIQUE,
	area int,
	ocupacion boolean
);

CREATE TABLE cursos (
	cod_curso char(50) PRIMARY KEY,
	tutor char(9),
	FOREIGN KEY (tutor) REFERENCES profesores (dni),
	anno int,
	FOREIGN KEY (anno) REFERENCES annos (num_anno)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE annos_cursos (
	num_anno int,
	cod_curso char(50),
	KEY (num_anno),
	FOREIGN KEY (num_anno) REFERENCES annos (num_anno),
	KEY (cod_curso),
	FOREIGN KEY (cod_curso) REFERENCES cursos (cod_curso)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE horarios (
	cod_horario int PRIMARY KEY,
	num_hora char(50),
	dia_semana char(50),
	cod_aula char(50) NOT NULL,
	FOREIGN KEY (cod_aula) REFERENCES aulas (cod_aula)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ciclos (
	nombre char(50) PRIMARY KEY,
	cod_interno char(50)
);

CREATE TABLE grados (
	nombre char(50) PRIMARY KEY,
	nombre_ciclo char(50),
	FOREIGN KEY (nombre_ciclo) REFERENCES ciclos (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE cursos_ciclos (
	cod_curso char(50),
	nombre_ciclo char(50),
	KEY (cod_curso),
	FOREIGN KEY (cod_curso) REFERENCES cursos (cod_curso),
	KEY (nombre_ciclo),
	FOREIGN KEY (nombre_ciclo) REFERENCES ciclos (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE asignaturas (
	nombre char(50) PRIMARY KEY,
	cod_interno char(50) NOT NULL,
	cod_europeo char(50) NOT NULL,
	cod_aula char(50),
	FOREIGN KEY (cod_aula) REFERENCES aulas (cod_aula)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE asignaturas_requerimientos (
	nombre_asign1 char(50),
	nombre_asign2 char(50),
	KEY (nombre_asign1),
	FOREIGN KEY (nombre_asign1) REFERENCES asignaturas (nombre),
	KEY (nombre_asign2),
	FOREIGN KEY (nombre_asign2) REFERENCES asignaturas (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ciclos_asignaturas (
	nombre_asign char(50),
	nombre_ciclo char(50),
	KEY (nombre_asign),
	FOREIGN KEY (nombre_asign) REFERENCES asignaturas (nombre),
	KEY (nombre_ciclo),
	FOREIGN KEY (nombre_ciclo) REFERENCES ciclos (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE profesores_asignaturas (
	nombre_asign char(50),
	dni char(9),
	fecha_inicio date NOT NULL,
	fecha_fin date,
	KEY (nombre_asign),
	FOREIGN KEY (nombre_asign) REFERENCES asignaturas (nombre),
	KEY (dni),
	FOREIGN KEY (dni) REFERENCES profesores (dni)
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO annos VALUES 
	(2019),
	(2020),
	(2021),
	(2022),
	(2023);

INSERT INTO profesores VALUES 
	('85738293K', 'Alberto Gimenez', 'Calle Falsa 123', '673583985', 'albgim@gmail.com', '54363636345654', '1438', 7, true,2),
	('63829475D', 'Alfonso Lopez', 'Calle Larga 1', '675839281', 'albgim@gmail.com', '43726423475476', '4124', 13, true,5),
	('81273572C', 'Anna Masip', 'Avenida Benida 245', '613943292', 'albgim@gmail.com', '98348138474359', '8921', 8, false,0),
	('46274859B', 'Gilberto Rios', 'Calle Nueva 89', '654201821', 'albgim@gmail.com', '47537658464833', '7732', 5, false,0),
	('88712495A', 'Laura Claus', 'Calle Antigua 2', '689549921', 'albgim@gmail.com', '24143285475385', '5543', 4, false,0);

INSERT INTO aulas VALUES 
	('a102', 'Aula 102', 'A102', 34, false),
	('a105', 'Aula 105', 'A105', 34, false),
	('a205', 'Aula 205', 'A205', 34, false),
	('a308', 'Aula 308', 'A308', 34, false),
	('a419', 'Aula 410', 'A410', 34, false);

INSERT INTO cursos VALUES 
	('cme2023', '85738293K', 2023),
	('cme2022', '63829475D', 2023);

INSERT INTO annos_cursos VALUES 
	(2023, 'cme2023'),
	(2022, 'cme2022');

INSERT INTO horarios VALUES 
	(12023, 'Primera', 'Lunes', 'a102'),
	(22023, 'Segunda', 'Lunes', 'a105'), 
	(32023, 'Tercera', 'Lunes', 'a205'), 
	(42023, 'Primera', 'Miercoles', 'a308'), 
	(52023, 'Cuarta', 'Martes', 'a419'); 

INSERT INTO ciclos VALUES 
	('CProdAnim', 'Ciclo de Produccion y Animacion'), 
	('CDisWeb', 'Ciclo de Diseño Web'), 
	('CImpGraf', 'Ciclo Impresion Grafica'), 
	('CDisVid', 'Ciclo Diseño Videojuegos'),
	('CMecAut', 'Ciclo Mecanica Automocion'); 

INSERT INTO grados VALUES 
	('Superior', 'CProdAnim'), 
	('Medio', 'CDisWeb');

INSERT INTO cursos_ciclos VALUES 
	('cme2023', 'CProdAnim'),
	('cme2023', 'CDisWeb'), 
	('cme2023', 'CImpGraf'), 
	('cme2023', 'CDisVid'), 
	('cme2023', 'CMecAut'); 

INSERT INTO asignaturas VALUES 
	('Animacion 3D', 'a3d', '9832', 'a102'),
	('Diseño niveles', 'dn', '1837', 'a105'),
	('Bases de datos', 'a3d', '8832', 'a308'),
	('Modelado 3D', 'm3d', '7612', 'a419'),
	('Motores gasolina', 'a3d', '3374', 'a205'); 


INSERT INTO asignaturas_requerimientos VALUES 
	('Animacion 3D', 'Modelado 3D');

INSERT INTO ciclos_asignaturas VALUES 
	('Animacion 3D', 'CProdAnim'), 
	('Diseño niveles', 'CDisVid'), 
	('Bases de datos', 'CDisWeb'), 
	('Modelado 3D', 'CDisVid'), 
	('Motores gasolina', 'CMecAut'); 

INSERT INTO profesores_asignaturas VALUES 
	('Animacion 3D', '85738293K', '2023-01-07', '2023-05-28'), 
	('Diseño niveles', '63829475D', '2023-01-07', '2023-05-28'), 
	('Bases de datos', '81273572C', '2023-01-07', '2023-05-28'), 
	('Modelado 3D', '63829475D', '2023-01-07', '2023-05-28'),
	('Motores gasolina', '88712495A', '2023-01-07', '2023-05-28'); 