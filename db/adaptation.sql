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
-- Constraints for table `res_asignacion_objetos_de_estudio`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_conocimiento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


