DROP DATABASE IF EXISTS ejercicio5;
CREATE DATABASE ejercicio5;
USE ejercicio5;

CREATE TABLE facultades (
	codigo int PRIMARY KEY AUTO_INCREMENT,
    nombre char(100)
);

CREATE TABLE investigadores (
	dni char(8) PRIMARY KEY,
	nom_apels char(100),
	facultad int,
	FOREIGN KEY (facultad) REFERENCES facultades (codigo)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE equipos (
	num_serie char(3) PRIMARY KEY,
	nombre char(100),
	facultad int,
	FOREIGN KEY (facultad) REFERENCES facultades (codigo)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE reservas (
	dni char(8),
	num_serie char(3),
	comienzo date,
	fin date,
	PRIMARY KEY(dni, num_serie),
	FOREIGN KEY (dni) REFERENCES investigadores (dni),
	FOREIGN KEY (num_serie) REFERENCES equipos (num_serie)
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO facultades (nombre) VALUES 
	('Universidad de Girona'), 
    	('Universidad Rovira i Virgili'), 
    	('Universidad Politecnica de Barcelona'), 
    	('Universidad Pompeu Fabra'), 
	('Universidad de Lleida'), 
	('Universidad de Vic'), 
	('Universidad de Online de Catalunya'), 
	('Universidad Autonoma de Barcelona'), 
	('Universidad de Andorra'), 
    	('Universidad de Barcelona');

INSERT INTO investigadores VALUES
	('75132883', 'Simona Rosado', 1),
	('48784301', 'Tomas Pons', 2),
	('53188299', 'Maria Gamero', 3),
	('37902631', 'Miriam Estrada', 7),
	('87112941', 'Amadeo Sabater', 3),
	('92069921', 'Elisabeth Trillo', 4),
	('11267069', 'Ismael Pazos', 6),
	('32712491', 'Marta Alvarez', 8),
	('75132883', 'Pablo Mora', 9),
	('75132883', 'Jose Luis Bize', 7);

INSERT INTO equipos VALUES 
	('123','Agitador', 4),
	('324','Microscopio optico', 2),
	('554','Criostato', 3),
	('678','Campana extractora', 1),
	('973','Destilador', 3),
	('258','Microscopio electronico', 6),
	('885','Medidor fotovoltaico', 7),
	('113','Ordenador', 9),
	('394','Espectrofotometro', 8),
	('457','Bomba de vacio', 4);

INSERT INTO reservas VALUES 
	('75132883', '678', '2023-04-14', '2023-04-16'),
	('92069921', '457', '2023-06-30', '2023-07-02'),
	('87112941', '973', '2023-05-21', '2023-05-29'),
	('32712491', '324', '2023-06-01', '2023-06-05'),
	('32712491', '258', '2023-07-07', '2023-07-09'),
	('32712491', '885', '2023-08-03', '2023-08-09'),
	('32712491', '258', '2023-12-01', '2023-12-08'),
	('32712491', '113', '2023-10-10', '2023-10-25'),
	('32712491', '885', '2023-06-01', '2023-06-15'),
	('11267069', '394', '2023-04-26', '2023-04-28');
