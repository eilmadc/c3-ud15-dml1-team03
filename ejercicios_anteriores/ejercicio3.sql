DROP DATABASE IF EXISTS ejercicio3;
CREATE DATABASE ejercicio3;

USE ejercicio3;

/* Entidad Comunidad Autonoma */
CREATE TABLE  comunidad_autonoma(
nombre_comunidad char(50) PRIMARY KEY,
poblacion int,
superficie int
);

/* Entidad Provincia */
CREATE TABLE provincia (
cod_provincia int PRIMARY KEY,
nombre_provincia char(50),
poblacion int,
superficie int,
nombre_comunidad char(50),
FOREIGN KEY (nombre_comunidad) REFERENCES comunidad_autonoma (nombre_comunidad)
ON DELETE CASCADE ON UPDATE CASCADE
);

/* Entidad Localidad */
CREATE TABLE  localidad(
nombre_localidad char(50) PRIMARY KEY,
poblacion int,
cod_provincia int NOT NULL,
FOREIGN KEY (cod_provincia) REFERENCES provincia(cod_provincia)
ON DELETE CASCADE ON UPDATE CASCADE
);

/* Entidad Capital de Comunidad Autonoma */
CREATE TABLE capital_ca (
nombre_localidad char(50),
KEY(nombre_localidad),
nombre_comunidad char(50),
KEY (nombre_comunidad),
FOREIGN KEY (nombre_localidad) REFERENCES localidad (nombre_localidad)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (nombre_comunidad) REFERENCES comunidad_autonoma (nombre_comunidad)
ON DELETE CASCADE ON UPDATE CASCADE
);

/* Entidad Capital de provincia */
CREATE TABLE capital_provincia (
nombre_localidad char(50),
KEY (nombre_localidad),
cod_provincia int,
KEY (cod_provincia),
FOREIGN KEY (nombre_localidad) REFERENCES localidad (nombre_localidad)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (cod_provincia) REFERENCES provincia(cod_provincia)
ON DELETE CASCADE ON UPDATE CASCADE
);

/* Muestra tablas */
SHOW TABLES;

/* Inserta valores en comunidad_autonoma*/
INSERT INTO comunidad_autonoma VALUES 
( "Andalucía", "8388107",  "87599"),
("Aragón","1308563","47720"),
("Asturias","1042608","10604"),
("Baleares","1107220","4992"),
("Canarias","2101924","7447"),
("Cantabria","582206","5321"),
("Castilla-La Mancha"," 2041631","79461"),
("Castilla y León","2447519","94224"),
("Cataluña"," 7522596","32113"),
("Extremadura","1087778","41634"),
("Pais Vasco", "158200", "15642"),
("Comunidad Valenciana", "150000", "30000");

/* Mostrar valores de comunidad_autonoma */
SELECT * FROM comunidad_autonoma;

/* Inserta valores en provincia*/
INSERT INTO provincia VALUES 
("01", "Álava", "331103",  "3037", "Pais Vasco"),
("02", "Albacete","387969","14924", "Castilla-La Mancha" ),
("03", "Alicante","1923000","5817", "Comunidad Valenciana"),
("04", "Almeria","729201","8775", "Andalucía"),
("05", "Asturias","1005397","10604", "Asturias"),
("06", "Avila","159317","8050", "Castilla y León"),
("07", "Badajoz","666265","21766", "Extremadura"),
("08", "Barcelona","5658399","4992", "Cataluña"),
("09", "Burgos","352331","7728", "Castilla y León"),
("10", "Cáceres","385472","14292", "Extremadura");

/* Mostrar valores de provincia */
SELECT * FROM provincia;

/* Inserta valores en localidad*/
INSERT INTO localidad VALUES 
 ("Álava", "1103","01"),
 ("Albacete","7969","02"),
 ("Alicante","23000","03"),
 ("Almeria","9201","04"),
 ("Asturias","5397","05"),
 ("Avila","9317","06"),
 ("Badajoz","6265","07"),
 ("Barcelona","58399","08"),
 ("Burgos","2331","09"),
 ("Cáceres","5472","10");
SHOW TABLES;

INSERT INTO capital_provincia VALUES 
 ("Álava","01"),
 ("Albacete","02"),
 ("Alicante","03"),
 ("Almeria","04"),
 ("Asturias","05"),
 ("Avila","06"),
 ("Badajoz","07"),
 ("Barcelona","08"),
 ("Burgos","09"),
 ("Cáceres","10");
 
 INSERT INTO capital_ca VALUES 
 ("Álava","Pais Vasco"),
 ("Albacete","Castilla-La Mancha"),
 ("Alicante","Comunidad Valenciana"),
 ("Almeria","Andalucía"),
 ("Asturias","Asturias"),
 ("Avila","Castilla y León"),
 ("Badajoz","Extremadura"),
 ("Barcelona","Cataluña");