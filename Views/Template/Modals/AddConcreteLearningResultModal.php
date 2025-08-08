<div class="modal fade" id="addLearningResultModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" disabled><?= $data['page_title'];?></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formAddConcreteLearningResult" name="formAddConcreteLearningResult">
                    <div class="modal-header headerRegister">
                        <h5 class="modal-title">Seleccione los Resultados de Aprendizaje</h5>
                    </div>
                    <input type="hidden" id="subjectId" name="subjectId" class="form-control" value="<?= $data['subject_id'];?>"/>
                    <fieldset class="scrollable-fieldset">
                        <?php 
                        $learningResults = [
                            1 => "Analiza Datos a gran escala utilizando experimentación adecuada Para obtener conclusiones informadas en ingeniería telemática",
                            2 => "Analiza El contexto social Considerando elementos de responsabilidad social en la práctica de la ingeniería telemática",
                            3 => "Aplica Estrategias de autoaprendizaje continuo Para la adquisición y actualización de conocimientos en el ámbito telemático",
                            4 => "Analiza Problemas complejos de ingeniería telemática Para proponer soluciones efectivas",
                            5 => "Aplica Modelos matemáticos para resolver problemas de ingeniería Considerando restricciones técnicas y de eficiencia",
                            6 => "Aplica Técnicas matemáticas para analizar datos En el contexto de soluciones telemáticas",
                            7 => "Automatiza Procesos Para mejorar la eficiencia en entornos telemáticos",
                            8 => "Construye Sistemas informáticos Para satisfacer las necesidades del entorno",
                            9 => "Desarrolla Algoritmos para la solución de problemas de ingeniería Asegurando su eficiencia y adaptabilidad en diferentes contextos",
                            10 => "Diseña Bases de datos para gestionar y organizar información En soluciones telemática",
                            11 => "Diseña Infraestructura telemática eficiente Considerando aspectos técnicos, económicos y sociales del entorno",
                            12 => "Diseña Sistemas con arquitecturas y patrones de software Garantizando su escalabilidad, mantenimiento y alineación con los requisitos del entorno",
                            13 => "Diseña Sistemas distribuidos con arquitecturas telemáticas Considerando criterios de eficiencia, escalabilidad y seguridad",
                            14 => "Diseña Software para entornos de nube Considerando escalabilidad, seguridad y eficiencia",
                            15 => "Ejecuta Sus actuaciones Con responsabilidad ética y profesional en el ámbito de la ingeniería telemática",
                            16 => "Evalúa Problemas de complejidad algorítmica Para optimizar soluciones en ingeniería telemática",
                            17 => "Lidera Equipos de gestión de proyectos en el contexto de la ingeniería telemática Promoviendo la buena comunicación y la claridad en los objetivos",
                            18 => "Procesa Datos para diseñar sistemas con arquitecturas de software Optimizando el rendimiento y la escalabilidad",
                            19 => "Propone Proyectos de ingeniería Sustentando su viabilidad económica y técnica en el contexto de la ingeniería telemática",
                            20 => "Trabaja En equipo en entornos colaborativos con habilidades interpersonales De una manera ética",
                        ];                        
                        foreach ($learningResults as $id => $text): 
                        ?>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="lr_<?= $id ?>" name="learning_results[]" value="<?= $id ?>">
                            <label class="form-check-label" for="lr_<?= $id ?>"><?= $text ?></label>
                        </div>
                        <?php endforeach; ?>
                    </fieldset>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-success">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<style>
/* Estilos para el fieldset con scroll */
.scrollable-fieldset {
    max-height: 400px; /* Altura máxima */
    overflow-y: auto;  /* Scroll vertical */
    padding: 10px;
    border: 1px solid #dee2e6;
    border-radius: 4px;
}

/* Estilo para los checkboxes */
.form-check {
    padding: 10px 20px;
    border-bottom: 1px solid #f0f0f0;
}

/* Estilo para el scrollbar */
.scrollable-fieldset::-webkit-scrollbar {
    width: 8px;
}

.scrollable-fieldset::-webkit-scrollbar-track {
    background: #f1f1f1;
    border-radius: 4px;
}

.scrollable-fieldset::-webkit-scrollbar-thumb {
    background: #888;
    border-radius: 4px;
}

.scrollable-fieldset::-webkit-scrollbar-thumb:hover {
    background: #555;
}

/* Espaciado para el último elemento */
.scrollable-fieldset .form-check:last-child {
    border-bottom: none;
}
</style>