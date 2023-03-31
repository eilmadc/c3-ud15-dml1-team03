DROP DATABASE IF EXISTS ejercicio4;
CREATE DATABASE ejercicio4;
USE ejercicio4;

CREATE TABLE Departamentos(
codDep int PRIMARY KEY,
nombre varchar(100),
presupuesto int
);

CREATE TABLE Empleados(
DNI varchar(8) PRIMARY KEY,
nombre varchar(100),
Apellidos varchar(255),
departamento int,
FOREIGN KEY (departamento) REFERENCES Departamentos (codDep)
);

INSERT INTO Departamentos VALUES (1, 'Recursos humanos', 30000), (2, 'Comercios', 35000), (3, '', 40000), 
(4, 'Administración', 45000), (5, 'Finanzas', 50000), (6, 'Marketing', 55000), (7, 'Marketing Internacional', 60000), 
(8, 'Compras', 65000), (9, 'Logistica', 70000), (10, 'Control de Gestión', 75000);

INSERT INTO Empleados VALUES ('11111111','Juan','Jordi',2), ('22222222','Sara','Madriz',7), ('33333333','Marc','Sapo',6)
, ('44444444','Francisco','Smith',4), ('55555555','Alex','Crotec',3), ('66666666','Isaac','Pastor',1), ('77777777','Daniel','Sanchez',3)
, ('88888888','Javi','Sil',3), ('99999999','Naiara','Luncor',10), ('00000000','Javier','Jordi',9);