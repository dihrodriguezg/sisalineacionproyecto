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
-- AUTO_INCREMENT for table `res_asignacion_resultados_de_aprendizaje`
--
ALTER TABLE `res_asignacion_resultados_de_aprendizaje`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;







--
-- Indexes for table `res_asignacion_objetos_de_estudio`
--
ALTER TABLE `res_asignacion_objetos_de_estudio`
  ADD KEY `codigo_profesor` (`codigo_profesor`),
  ADD KEY `codigo_objetos_de_estudio` (`codigo_objetos_de_estudio`),
  ADD KEY `codigo_espacio` (`codigo_espacio`);

--
-- Constraints for table `res_asignacion_objetos_de_estudio`
--
ALTER TABLE `res_asignacion_objetos_de_estudio`
  ADD CONSTRAINT `res_asignacion_objetos_de_estudio_ibfk_1` FOREIGN KEY (`codigo_profesor`) REFERENCES `res_profesor` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `res_asignacion_objetos_de_estudio_ibfk_2` FOREIGN KEY (`codigo_objetos_de_estudio`) REFERENCES `res_objetos_de_estudio` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `res_asignacion_objetos_de_estudio_ibfk_3` FOREIGN KEY (`codigo_espacio`) REFERENCES `res_espacio` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AUTO_INCREMENT for table `res_asignacion_resultados_de_aprendizaje`
--
ALTER TABLE `res_asignacion_resultados_de_aprendizaje`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

