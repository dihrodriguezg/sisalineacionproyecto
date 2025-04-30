<?php
    class CategoryModel extends Mysql{
        public function __construct(){
            parent::__construct();
        }

        public function searchAllSubject(){
            $querySelect = "SELECT id, nombre, descripcion, categoria_id
                            FROM asignatura 
                            WHERE categoria_id = 1";
            $request = $this->selectAll($querySelect);
            return $request;
        }

        public function searchLRTitleById(int $codeLR){
                $querySelect = "SELECT nombre FROM categoria_conocimiento WHERE id = $codeLR";
                $request = $this->select($querySelect);
                return $request;
            }

        public function searchAllSubjectByLR(int $codeLR){
            $querySelect = "SELECT id, nombre, descripcion, categoria_id
                            FROM asignatura 
                            WHERE categoria_id = $codeLR";
            $request = $this->selectAll($querySelect);
            return $request;
        }

        public function searchAllLearningResult(int $codeLR){
            $querySelect = "SELECT * FROM categoria_conocimiento WHERE id = $codeLR";
            $request = $this->selectAll($querySelect);
            return $request;
        }        
    }
?>