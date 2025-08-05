CREATE TABLE clasificacion_asignatura (
	id INT AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE,
	sigla VARCHAR(200) NOT NULL,
	PRIMARY KEY(id)
);

INSERT INTO clasificacion_asignatura (id, nombre, sigla)
VALUES
(1, 'Obligatorio Básico', 'OB'),
(2, 'Obligatorio Complementario', 'OC'),
(3, 'Electivo Intrínseco', 'EI'),
(4, 'Electivo Extrínseco', 'EE'),
(5, 'Componente Propedéutico', 'CP');

CREATE TABLE categoria_conocimiento (
	id INT AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY(id)
);

INSERT INTO categoria_conocimiento (id, nombre)
VALUES
(1, 'Ciencias Básicas'),
(2, 'Socio Humanística'),
(3, 'Básicas de la Ingeniería'),
(4, 'Ingeniería Aplicada'),
(5, 'Económico-Administrativa'),
(6, 'Sin Categoría');

CREATE TABLE asignatura (
	id INT AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE,
	resultado_resumido VARCHAR(800) NOT NULL,
	clasificacion_id INT NOT NULL,
	categoria_conocimiento_id INT NOT NULL,
	FOREIGN KEY(clasificacion_id) REFERENCES clasificacion_asignatura(id),
	FOREIGN KEY(categoria_conocimiento_id) REFERENCES categoria_conocimiento(id),
	PRIMARY KEY(id)
);

INSERT INTO asignatura (id, nombre, resultado_resumido, clasificacion_id, categoria_conocimiento_id) VALUES
(1, 'Cálculo Diferencial', 'Resultado resumido Cálculo Diferencial', 1, 1),
(2, 'Cátedra Francisco José de Caldas', 'Resultado resumido Cátedra Francisco José de Caldas', 2, 2),
(3, 'Álgebra Lineal', 'Resultado resumido Álgebra Lineal', 1, 1),
(4, 'Cátedra Democracia y Ciudadanía', 'Resultado resumido Cátedra Democracia y Ciudadanía', 2, 2),
(5, 'Producción y Comprensión de Textos I', 'Resultado resumido Producción y Comprensión de Textos I', 2, 2),
(6, 'Introducción a Algoritmos', 'Resultado resumido Introducción a Algoritmos', 1, 4),
(7, 'Lógica Matemática', 'Resultado resumido Lógica Matemática', 1, 3),
(8, 'Física I: Mecánica Newtoniana', 'Resultado resumido Física I: Mecánica Newtoniana', 1, 1),
(9, 'Cálculo Integral', 'Resultado resumido Cálculo Integral', 1, 1),
(10, 'Producción y comprensión de Textos II', 'Resultado resumido Producción y comprensión de Textos II', 2, 2),
(11, 'Administración', 'Resultado resumido Administración', 2, 5),
(12, 'Cátedra de Contexto', 'Resultado resumido Cátedra de Contexto', 2, 5),
(13, 'Estructura de Datos', 'Resultado resumido Estructura de Datos', 1, 3),
(14, 'Programación Orientada a Objetos', 'Resultado resumido Programación Orientada a Objetos', 1, 4),
(15, 'Segunda Lengua I - Inglés', 'Resultado resumido Segunda Lengua I - Inglés', 2, 6),
(16, 'Segunda Lengua I - Francés', 'Resultado resumido Segunda Lengua I - Francés', 2, 6),
(17, 'Segunda Lengua I - Alemán', 'Resultado resumido Segunda Lengua I - Alemán', 2, 6),
(18, 'Segunda Lengua I - Italiano', 'Resultado resumido Segunda Lengua I - Italiano', 2, 6),
(19, 'Segunda Lengua I - Portugués', 'Resultado resumido Segunda Lengua I - Portugués', 2, 6),
(20, 'Segunda Lengua I - Mandarín', 'Resultado resumido Segunda Lengua I - Mandarín', 2, 6),
(21, 'Contabilidad General', 'Resultado resumido Contabilidad General', 3, 6),
(22, 'Fundamentos de Organización', 'Resultado resumido Fundamentos de Organización', 3, 5),
(23, 'Física II: Electromagnetismo', 'Resultado resumido Física II: Electromagnetismo', 1, 1),
(24, 'Ciencia Tecnología y Sociedad', 'Resultado resumido Ciencia Tecnología y Sociedad', 2, 2),
(25, 'Programación Multinivel', 'Resultado resumido Programación Multinivel', 1, 4),
(26, 'Bases de Datos', 'Resultado resumido Bases de Datos', 1, 3),
(27, 'Segunda Lengua II - Ingles', 'Resultado resumido Segunda Lengua II - Ingles', 2, 6),
(28, 'Segunda Lengua II - Francés', 'Resultado resumido Segunda Lengua II - Francés', 2, 6),
(29, 'Segunda Lengua II - Alemán', 'Resultado resumido Segunda Lengua II - Alemán', 2, 6),
(30, 'Segunda Lengua II - Italiano', 'Resultado resumido Segunda Lengua II - Italiano', 2, 6),
(31, 'Segunda Lengua II - Portugués', 'Resultado resumido Segunda Lengua II - Portugués', 2, 6),
(32, 'Segunda Lengua II - Mandarín', 'Resultado resumido Segunda Lengua II - Mandarín', 2, 6),
(33, 'Matemáticas Especiales', 'Resultado resumido Matemáticas Especiales', 3, 1),
(34, 'Análisis y métodos numéricos', 'Resultado resumido Análisis y métodos numéricos', 3, 1),
(35, 'Fundamentos de Economía', 'Resultado resumido Fundamentos de Economía', 3, 5),
(36, 'Tics en las organizaciones', 'Resultado resumido Tics en las organizaciones', 3, 5),
(37, 'Ética y Sociedad', 'Resultado resumido Ética y Sociedad', 2, 2),
(38, 'Programación Avanzada', 'Resultado resumido Programación Avanzada', 1, 4),
(39, 'Diseño Lógico', 'Resultado resumido Diseño Lógico', 1, 3),
(40, 'Transmisión de Datos', 'Resultado resumido Transmisión de Datos', 3, 4),
(41, 'Aplicaciones para Internet', 'Resultado resumido Aplicaciones para Internet', 3, 4),
(42, 'Programación Web', 'Resultado resumido Programación Web', 3, 4),
(43, 'Bases de Datos Distribuidas', 'Resultado resumido Bases de Datos Distribuidas', 3, 4),
(44, 'Análisis de Sistemas', 'Resultado resumido Análisis de Sistemas', 1, 4),
(45, 'Sistemas Operacionales', 'Resultado resumido Sistemas Operacionales', 1, 3),
(46, 'Taller de Investigación', 'Resultado resumido Taller de Investigación', 1, 2),
(47, 'Segunda Lengua III - Inglés', 'Resultado resumido Segunda Lengua III - Inglés', 2, 6),
(48, 'Segunda Lengua III - Francés', 'Resultado resumido Segunda Lengua III - Francés', 2, 6),
(49, 'Segunda Lengua III - Alemán', 'Resultado resumido Segunda Lengua III - Alemán', 2, 6),
(50, 'Segunda Lengua III - Italiano', 'Resultado resumido Segunda Lengua III - Italiano', 2, 6),
(51, 'Segunda Lengua III - Portugués', 'Resultado resumido Segunda Lengua III - Portugués', 2, 6),
(52, 'Segunda Lengua III - Mandarín', 'Resultado resumido Segunda Lengua III - Mandarín', 2, 6),
(53, 'Fundamentos de Telemática', 'Resultado resumido Fundamentos de Telemática', 3, 4),
(54, 'Protocolos de Comunicación', 'Resultado resumido Protocolos de Comunicación', 3, 4),
(55, 'Programación por Componentes', 'Resultado resumido Programación por Componentes', 3, 4),
(56, 'Regulación para Telecomunicaciones', 'Resultado resumido Regulación para Telecomunicaciones', 3, 4),
(57, 'Trabajo de Grado Tecnológico', 'Resultado resumido Trabajo de Grado Tecnológico', 1, 4),
(58, 'Inteligencia Artificial', 'Resultado resumido Inteligencia Artificial', 1, 3),
(59, 'Arquitectura de Computadores', 'Resultado resumido Arquitectura de Computadores', 1, 3),
(60, 'Ecuaciones Diferenciales', 'Resultado resumido Ecuaciones Diferenciales', 5, 1),
(61, 'Bases de Datos Avanzadas', 'Resultado resumido Bases de Datos Avanzadas', 5, 3),
(62, 'Ingeniería de Software', 'Resultado resumido Ingeniería de Software', 5, 4);



CREATE TABLE resultado_concreto_asignatura (
	id INT AUTO_INCREMENT,
	descripcion VARCHAR(500) NOT NULL,
	PRIMARY KEY(id)
);

INSERT INTO resultado_concreto_asignatura (id, descripcion) VALUES
(1, 'Analiza Datos a gran escala utilizando experimentación adecuada Para obtener conclusiones informadas en ingeniería telemática'),
(2, 'Analiza El contexto social Considerando elementos de responsabilidad social en la práctica de la ingeniería telemática'),
(3, 'Analiza Problemas complejos de ingeniería telemática Para proponer soluciones efectivas'),
(4, 'Aplica Estrategias de autoaprendizaje continuo Para la adquisición y actualización de conocimientos en el ámbito telemático'),
(5, 'Aplica Modelos matemáticos para resolver problemas de ingeniería Considerando restricciones técnicas y de eficiencia'),
(6, 'Aplica Técnicas matemáticas para analizar datos En el contexto de soluciones telemáticas'),
(7, 'Automatiza Procesos Para mejorar la eficiencia en entornos telemáticos'),
(8, 'Construye Sistemas informáticos Para satisfacer las necesidades del entorno'),
(9, 'Desarrolla Algoritmos para la solución de problemas de ingeniería Asegurando su eficiencia y adaptabilidad en diferentes contextos'),
(10, 'Diseña Bases de datos para gestionar y organizar información En soluciones telemáticas'),
(11, 'Diseña Infraestructura telemática eficiente Considerando aspectos técnicos, económicos y sociales del entorno'),
(12, 'Diseña Sistemas con arquitecturas y patrones de software Garantizando su escalabilidad, mantenimiento y alineación con los requisitos del entorno'),
(13, 'Diseña Sistemas distribuidos con arquitecturas telemáticas Considerando criterios de eficiencia, escalabilidad y seguridad'),
(14, 'Diseña Software para entornos de nube Considerando escalabilidad, seguridad y eficiencia'),
(15, 'Ejecuta Sus actuaciones Con responsabilidad ética y profesional en el ámbito de la ingeniería telemática'),
(16, 'Evalúa Problemas de complejidad algorítmica Para optimizar soluciones en ingeniería telemática'),
(17, 'Lidera Equipos de gestión de proyectos en el contexto de la ingeniería telemática Promoviendo la buena comunicación y la claridad en los objetivos'),
(18, 'Procesa Datos para diseñar sistemas con arquitecturas de software Optimizando el rendimiento y la escalabilidad'),
(19, 'Propone Proyectos de ingeniería Sustentando su viabilidad económica y técnica en el contexto de la ingeniería telemática'),
(20, 'Trabaja En equipo en entornos colaborativos con habilidades interpersonales De una manera ética');


CREATE TABLE asignatura_resultado_concreto (
	resultado_concreto_id INT NOT NULL,
	asignatura_id INT NOT NULL,
	PRIMARY KEY (asignatura_id, resultado_concreto_id),
	FOREIGN KEY (asignatura_id) REFERENCES asignatura(id),
	FOREIGN KEY (resultado_concreto_id) REFERENCES resultado_concreto_asignatura(id)
);

INSERT INTO asignatura_resultado_concreto (resultado_concreto_id, asignatura_id) VALUES
(1, 3), (1, 34), (1, 43), (1, 1), (1, 9), (1, 4), (1, 13), (1, 33), (1, 40),
(2, 12), (2, 2), (2, 24), (2, 37), (2, 22), (2, 56),
(3, 9), (3, 8), (3, 53), (3, 62), (3, 14), (3, 54), (3, 45),
(4, 5), (4, 10), (4, 46), (4, 57),
(5, 3), (5, 34), (5, 1), (5, 9), (5, 60), (5, 8), (5, 23), (5, 7), (5, 33),
(6, 34), (6, 9), (6, 33),
(7, 41), (7, 59), (7, 43), (7, 58), (7, 6), (7, 38), (7, 42), (7, 45),
(8, 44), (8, 41), (8, 59), (8, 26), (8, 38), (8, 25), (8, 14), (8, 42), (8, 57),
(9, 44), (9, 34), (9, 43), (9, 39), (9, 13), (9, 58), (9, 6), (9, 40),
(10, 41), (10, 59), (10, 26), (10, 61), (10, 43), (10, 42),
(11, 8), (11, 35), (11, 53), (11, 56), (11, 36), (11, 40),
(12, 41), (12, 43), (12, 62), (12, 58), (12, 38), (12, 25), (12, 14), (12, 55), (12, 42), (12, 57),
(13, 61), (13, 39), (13, 53), (13, 7), (13, 25), (13, 14), (13, 54), (13, 45),
(14, 61), (14, 43), (14, 13), (14, 62), (14, 25), (14, 14),
(15, 4), (15, 2), (15, 37), (15, 22), (15, 5), (15, 10), (15, 56),
(16, 34), (16, 13), (16, 58), (16, 6), (16, 7), (16, 33), (16, 14),
(17, 11), (17, 12), (17, 2), (17, 21), (17, 37), (17, 22), (17, 54), (17, 57),
(18, 3), (18, 26), (18, 13), (18, 62), (18, 58), (18, 25), (18, 14), (18, 57),
(19, 11), (19, 12), (19, 2), (19, 24), (19, 21), (19, 5), (19, 56),
(20, 11), (20, 12), (20, 4), (20, 2), (20, 21), (20, 37), (20, 22);


SELECT 
    a.id AS asignatura_id,
    a.nombre AS asignatura,
    a.resultado_resumido AS resultado_resumido,
    c.id AS categoria_conocimiento,
    cl.nombre AS clasificacion
FROM asignatura a
JOIN categoria_conocimiento c 
    ON a.categoria_conocimiento_id = c.id
JOIN clasificacion_asignatura cl
    ON a.clasificacion_id = cl.id
WHERE c.id = 1
ORDER BY a.id;

SELECT 
    a.id AS asignatura_id,
    a.nombre AS asignatura,
    rca.id AS resultado_id,
    rca.descripcion AS resultado_aprendizaje
FROM asignatura a
JOIN asignatura_resultado_concreto arc
    ON a.id = arc.asignatura_id
JOIN resultado_concreto_asignatura rca
    ON arc.resultado_concreto_id = rca.id
WHERE a.id = 24
ORDER BY rca.id;