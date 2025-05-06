<?php
    class CategoryModel extends Mysql{
        public function __construct(){
            parent::__construct();
        }

        /*public function searchAllSubject(){
            $querySelect = "SELECT id, nombre, descripcion, categoria_id
                            FROM asignatura 
                            WHERE categoria_id = 1";
            $request = $this->selectAll($querySelect);
            return $request;
        }*/

        public function getCategoryById(int $codeLR){
                $querySelect = "SELECT nombre FROM categoria_conocimiento WHERE id = $codeLR";
                $request = $this->select($querySelect);
                return $request;
            }

        public function getSubjectById(int $codeLR){
            $querySelect = "SELECT id, nombre, descripcion
                            FROM asignatura 
                            WHERE id = $codeLR";
            $request = $this->select($querySelect);
            return $request;
        }

        public function getSubjectsByCategory(int $codeLR){
            $querySelect = "SELECT id, nombre, descripcion
                            FROM asignatura 
                            WHERE categoria_id = $codeLR";
            $request = $this->selectAll($querySelect);
            return $request;
        }        
    }
?>