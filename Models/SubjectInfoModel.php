<?php
    class SubjectInfoModel extends Mysql{
        public function __construct(){
            parent::__construct();
        }

        public function findConcretResultBySubjectId(int $subjectId){
            $querySelect = "SELECT * FROM resultado_concreto_asignatura WHERE asignatura_id = $subjectId";
            $request = $this->selectAll($querySelect);
            return $request;
        }

	public function searchLRTitleById(int $codeLR){
            $querySelect = "SELECT nombre FROM asignatura WHERE id = $codeLR";
            $request = $this->select($querySelect);
            return $request;
        }

        public function searchAllSubjectByLR(int $codeLR){
            $querySelect = "SELECT esp.codigo, esp.nombre AS name_subject, prof.nombre AS name_teacher, prof.apellido AS lastname_teacher
                            FROM res_asignacion_resultados_de_aprendizaje ara
                            INNER JOIN res_espacio esp ON ara.codigo_espacio = esp.codigo
                            INNER JOIN res_profesor prof ON ara.codigo_profesor = prof.codigo
                            INNER JOIN res_resultados_de_aprendizaje ra ON ara.codigo_resultados = ra.codigo 
                            WHERE ra.codigo = $codeLR;";
            $request = $this->selectAll($querySelect);
            return $request;
        }
    }
?>