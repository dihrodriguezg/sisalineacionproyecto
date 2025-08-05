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

        public function deleteConcreteResult(int $id){
            $sql = "DELETE FROM resultado_concreto_asignatura WHERE id = $id";
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

        public function saveConcreteResult(int $id, string $name, string $description, int $assignmentId){
            $return = "";
            $requestSelect = $this->searchLearningResultByName($name);
            if(empty($requestSelect)){
                $queryInsert = "INSERT INTO resultado_concreto_asignatura(id,nombre,descripcion,asignatura_id) VALUES(?,?,?,?)";
                $arrData = array($id, $name, $description, $assignmentId);
                $request = $this->insert($queryInsert, $arrData);
                $return = $request;
            }else{
                $return = "exist";
            }        
            return $return;   
        }

        private function searchLearningResultByName(string $name){
            $querySelect = "SELECT * FROM resultado_concreto_asignatura WHERE nombre = '$name'";
            $request = $this->select($querySelect);
            return $request;
        }

    }
?>