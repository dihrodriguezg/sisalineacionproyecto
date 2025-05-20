<?php
    class SubjectInfoModel extends Mysql{
        public function __construct(){
            parent::__construct();
        }

        public function findConcretResultBySubjectId(int $subjectId){
            $querySelect = "SELECT id, nombre, descripcion FROM resultado_concreto_asignatura WHERE asignatura_id = $subjectId";
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

    }
?>