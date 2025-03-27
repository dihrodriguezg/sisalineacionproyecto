----------------------------------------------------------

--
-- Table structure for table `categoria_conocimiento`
--

CREATE TABLE `categoria_conocimiento` (
    `id` int NOT NULL,
    `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categoria_conocimiento`
--

INSERT INTO `categoria_conocimiento` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Ciencias básicas', 'Descipción ciencias básicas'),
(2, 'Ingeniería aplicada', 'Descipción ingeniería aplicada'),
(3, 'Básico profesional', 'Descipción básico profesional'),
(4, 'Obligatorio complementario', 'Descipción obligatorio complementario');

--
-- AUTO_INCREMENT for table `categoria_conocimiento`
--
ALTER TABLE `categoria_conocimiento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


--
-- Table structure for table `asignatura`
--
CREATE TABLE `asignatura` (
    `id` int NOT NULL,
    `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `descripcion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
    `categoria_id` int NOT NULL,
	PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `asignatura`
--
INSERT INTO `asignatura` (`id`, `nombre`, `descripcion`, `categoria_id`) VALUES
(1, 'Cálculo Diferencial', 'Descipción ciencias básicas', 1),
(2, 'Cálculo Integral', 'Descipción ciencias básicas', 1),
(3, 'Programación Web', 'Descipción ingeniería aplicada', 2),
(4, 'Estructura de Datos', 'Descipción ingeniería aplicada', 2),
(5, 'Base de Datos', 'Descipción básico profesional', 3),
(6, 'Programación por Componentes', 'Descipción básico profesional', 3),
(7, 'Producción y Comprensión de Textos I', 'Descipción obligatorio complementario', 4),
(8, 'Ciencia, Tecnología y Sociedad', 'Descipción obligatorio complementario', 4);

--
-- AUTO_INCREMENT for table `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Indexes for table `asignatura`
--
ALTER TABLE `asignatura`
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Constraints for table `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_conocimiento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Table structure for table `resultado_concreto_asignatura`
--
CREATE TABLE `resultado_concreto_asignatura` (
    `id` int NOT NULL,
    `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `descripcion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
    `asignatura_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resultado_concreto_asignatura`
--
INSERT INTO `resultado_concreto_asignatura` (`id`, `nombre`, `descripcion`, `asignatura_id`) VALUES
(1, 'Res', 'El estudiante debe estar en la capacidad de realizar derivadas de diversa índole', 1),
(2, 'Res', 'El estudiante debe estar en la capacidad de realizar integrales de diversa índole', 2),
(3, 'Res', 'El estudiante debe estar en la capacidad de desarrollar aplicaciones web', 3),
(4, 'Res', 'El estudiante debe reconocer las distintas estructuras de datos en C++', 4),
(5, 'Res', 'El estudiante debe estar en la capacidad de reconocer conceptos básicos de Bases de Datos', 5),
(6, 'Res', 'El estudiante debe estar en la capacidad de desarrollar aplicaciones distribuidas', 6),
(7, 'Res', 'El estudiante debe estar en la capacidad de realizar ensayos básicos', 7),
(8, 'Res', 'El estudiante debe estar en la capacidad de realizar informes científicos básicos', 8);

--
-- Indexes for table `resultado_concreto_asignatura`
--
ALTER TABLE `resultado_concreto_asignatura`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `resultado_concreto_asignatura`
--
ALTER TABLE `resultado_concreto_asignatura`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for table `resultado_concreto_asignatura`
--
ALTER TABLE `resultado_concreto_asignatura`
  ADD CONSTRAINT `resultado_concreto_asignatura` FOREIGN KEY (`asignatura_id`) REFERENCES `asignatura` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
