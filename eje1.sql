DROP DATABASE eje1;
CREATE DATABASE eje1;
USE eje1;
CREATE TABLE estacion (
identificador_estacion char(50) PRIMARY KEY,
latitud int,
longitud int,
altitud int
);
CREATE TABLE muestra (
identificador_estacion char(50) PRIMARY KEY,
FOREIGN KEY (identificador_estacion) REFERENCES estacion (identificador_estacion),
fecha date,
temperatura_minima int,
temperatura_maxima int,
precipitacion int,
humedad_minima int,
humedad_maxima int,
velocidad_viento_minima int,
velocidad_viento_maxima int
);

INSERT INTO estacion VALUES ('111111A', 4554,6565 , 77676), ('222222B', 5454,6566555 , 121221), 
('333333C', 4554,6565 , 77676), ('444444D', 5665,87 , 87867), 
('555555E', 9090,464 , 322332), ('666666F', 5454,1212 , 4355)
, ('777777G', 6555,5555 , 6666), ('888888H', 9090,6767 , 4545), 
('999999I', 2121,23443 , 4554), ('000000J', 6767,3434 , 1212);

INSERT INTO muestra VALUES ('111111A',str_to_date('5/19/2020', '%m/%d/%Y'),1,1,1,1,1,1,1), 
('222222B',str_to_date('5/20/2020', '%m/%d/%Y'),1,2,1,1,1,2,1), 
('333333C',str_to_date('5/21/2020', '%m/%d/%Y'),1,3,1,2,1,1,1), 
('444444D',str_to_date('5/22/2020', '%m/%d/%Y'),1,1,2,1,1,1,1), 
('555555E',str_to_date('5/23/2020', '%m/%d/%Y'),1,1,1,1,2,1,1), 
('666666F',str_to_date('5/24/2020', '%m/%d/%Y'),1,4,1,1,2,1,1), 
('777777G',str_to_date('5/25/2020', '%m/%d/%Y'),1,1,1,1,4,1,1), 
('888888H',str_to_date('5/26/2020', '%m/%d/%Y'),1,4,1,2,1,1,1), 
('999999I',str_to_date('5/27/2020', '%m/%d/%Y'),1,2,1,1,1,4,1), 
('000000J',str_to_date('5/28/2020', '%m/%d/%Y'),1,2,1,4,1,1,4);