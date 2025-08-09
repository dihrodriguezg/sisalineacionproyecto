<?php
    class CategoryModel extends Mysql{
        public function __construct(){
            parent::__construct();
        }

        public function getCategoryById(int $codeLR){
                $querySelect = "SELECT nombre FROM categoria_conocimiento WHERE id = $codeLR";
                $request = $this->select($querySelect);
                return $request;
            }

        public function getSubjectById(int $codeLR){
            $querySelect = "SELECT id, nombre, resultado_resumido as rr
                            FROM asignatura 
                            WHERE id = $codeLR";
            $request = $this->select($querySelect);
            return $request;
        }

        public function getSubjectsByCategory(int $codeLR){
            $querySelect = "SELECT 
                                a.id AS id,
                                a.nombre AS nombre,
                                a.resultado_resumido AS rr,
                                c.id AS cc_id,
                                cl.nombre AS clasificacion
                            FROM asignatura a
                            JOIN categoria_conocimiento c 
                                ON a.categoria_conocimiento_id = c.id
                            JOIN clasificacion_asignatura cl
                                ON a.clasificacion_id = cl.id
                            WHERE c.id = $codeLR
                            ORDER BY a.id;";
            $request = $this->selectAll($querySelect);
            return $request;
        }        
    }
?>