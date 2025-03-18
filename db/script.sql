CREATE TABLE categoria_conocimiento (
	id INT AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE,
	descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY(id)
);

INSERT INTO categoria_conocimiento (nombre, descripcion)
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
	FOREIGN KEY(categoria_id) REFERENCES categoria_conocimiento(id),
	PRIMARY KEY(id)
);

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

CREATE TABLE resultado_concreto_asignatura (
	id INT AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(200) NOT NULL,
	asignatura_id INT NOT NULL,
	FOREIGN KEY(asignatura_id) REFERENCES asignatura(id),
	PRIMARY KEY(id)
);

INSERT INTO resultado_concreto_asignatura (nombre, descripcion, asignatura_id)
VALUES
('nombre', 'El estudiante debe estar en la capacidad de realizar derivadas de diversa índole', 1),
('nombre', 'El estudiante debe estar en la capacidad de realizar integrales de diversa índole', 2),
('nombre', 'El estudiante debe estar en la capacidad de desarrollar aplicaciones web', 3),
('nombre', 'El estudiante debe reconocer las distintas estructuras de datos en C++', 4),
('nombre', 'El estudiante debe estar en la capacidad de reconocer conceptos básicos de Bases de Datos', 5),
('nombre', 'El estudiante debe estar en la capacidad de desarrollar aplicaciones distribuidas', 6),
('nombre', 'El estudiante debe estar en la capacidad de realizar ensayos básicos', 7),
('nombre', 'El estudiante debe estar en la capacidad de realizar informes científicos básicos', 8);



