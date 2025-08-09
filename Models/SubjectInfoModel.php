<?php
    class SubjectInfoModel extends Mysql{
        public function __construct(){
            parent::__construct();
        }

        public function findConcretResultBySubjectId(int $subjectId){
            $querySelect = "SELECT 
                                a.id AS id,
                                rca.id AS rid,
                                rca.descripcion AS rad
                            FROM asignatura a
                            JOIN asignatura_resultado_concreto arc
                                ON a.id = arc.asignatura_id
                            JOIN resultado_concreto_asignatura rca
                                ON arc.resultado_concreto_id = rca.id
                            WHERE a.id = $subjectId
                            ORDER BY rca.id";            
            $request = $this->selectAll($querySelect);
            return $request;
        }

        public function findConcretResultById(int $concreteResultId){
            $querySelect = "SELECT id, nombre, descripcion FROM resultado_concreto_asignatura WHERE id = $concreteResultId";
            $request = $this->select($querySelect);
            return $request;
        }


	    public function searchLRTitleById(int $codeLR){
            $querySelect = "SELECT nombre FROM asignatura WHERE id = $codeLR";
            $request = $this->select($querySelect);
            return $request;
        }

        public function deleteConcreteResult(int $id, int $assignmentId){
            $sql = "DELETE FROM asignatura_resultado_concreto WHERE resultado_concreto_id = $id AND asignatura_id = $assignmentId";
            $request = $this->delete($sql);
            return $request;
        }

        public function updateConcreteResult(int $code, string $name, string $description){
            $queryUpdate = "UPDATE resultado_concreto_asignatura SET nombre = ?, descripcion = ?  WHERE id = ?";
            $arrData = array($name, $description, $code);
            $request = $this->update($queryUpdate, $arrData);
            return $request;
        }

        public function searchLastCode(){
            $querySelect = "SELECT max(id) AS id FROM resultado_concreto_asignatura";
            $request = $this->selectAll($querySelect);
            return $request;
        }

        public function saveConcreteResult(int $concreteResultId, int $assignmentId){
            $return = "";
            $queryInsert = "INSERT INTO asignatura_resultado_concreto(resultado_concreto_id, asignatura_id) VALUES(?,?)";
            $arrData = array($concreteResultId, $assignmentId);
            $request = $this->insert($queryInsert, $arrData);
            $return = $request;    
            return $return;   
        }

        private function searchLearningResultByName(string $name){
            $querySelect = "SELECT * FROM resultado_concreto_asignatura WHERE nombre = '$name'";
            $request = $this->select($querySelect);
            return $request;
        }

        public function getRemainingConcretLearningResult(int $subjectId){
            $sql = "SELECT rca.id, rca.descripcion 
                    FROM resultado_concreto_asignatura rca 
                    LEFT JOIN asignatura_resultado_concreto arc ON rca.id = arc.resultado_concreto_id 
                    AND arc.asignatura_id = $subjectId 
                    WHERE arc.resultado_concreto_id IS NULL
                    ORDER BY rca.id";
            $request = $this->selectAll($sql);
            return $request;
        }
    }
?>