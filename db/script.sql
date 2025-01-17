DROP DATABASE IF EXISTS proyecto_grado_db;
CREATE DATABASE proyecto_grado_db;
USE proyecto_grado_db;

DROP TABLE IF EXISTS categoria_conocimiento;

CREATE TABLE categoria (
	id INT AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE,
	descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY(id) 
)

INSERT INTO categoria_conocimiento(nombre, descripcion)
VALUES
('Ciencias básicas', 'Descipción ciencias básicas'),
('Ingeniería aplicada', 'Descipción ingeniería aplicada'),
('Básico profesional', 'Descipción básico profesional'),
('Obligatorio complementario', 'Descipción obligatorio complementario');


CREATE TABLE asignatura (
	id INT AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE,
	descripcion VARCHAR(200) NOT NULL,
	categoria_id INT NOT NULL,
	FOREIGN KEY(categoria_id) REFERENCES categoria(id),
	PRIMARY KEY(id)
)

INSERT INTO asignatura(nombre, descripcion, categoria_id)
VALUES
('Cálculo Diferencial', 'Descipción ciencias básicas', 1),
('Cálculo Integral', 'Descipción ciencias básicas', 1),
('Programación Web', 'Descipción ingeniería aplicada', 2),
('Estructura de Datos', 'Descipción ingeniería aplicada', 2),
('Base de Datos', 'Descipción básico profesional', 3),
('Programación por Componentes', 'Descipción básico profesional', 3),
('Producción y Comprensión de Textos I', 'Descipción obligatorio complementario', 4),
('Ciencia, Tecnología y Sociedad', 'Descipción obligatorio complementario', 4);

CREATE TABLE herramienta (
	id INT AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE,
	descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY(id)
);

INSERT INTO herramienta(nombre, descripcion)
VALUES
('MySQL', 'Motor de bases de datos'),
('Eclipse', 'Entorno de desarrollo'),
('Programación orientada a objetos, un enfoque práctico', 'Texto guía'),
('MySQL Workbench', 'Entorno gráfico para bases de datos');

CREATE TABLE asignatura_herramienta_int (
	asignatura_id INT NOT NULL,
	herramienta_id INT NOT NULL,
	FOREIGN KEY(asignatura_id) REFERENCES asignatura(id),
	FOREIGN KEY(herramienta_id) REFERENCES herramienta(id),
	PRIMARY KEY(asignatura_id, herramienta_id)
);

INSERT INTO asignatura_herramienta_int(asignatura_id, herramienta_id)
VALUES
(1, 1),
(2, 2),
(1, 3),
(3, 4);