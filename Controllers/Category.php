<?php
    session_start();
    class Category extends Controllers{
        public function __construct(){
            parent::__construct();
        }

        public function Category(int $codeLR){
            $data['page_tag'] = $this->getCategoryTitle($codeLR);
            $data['page_title'] = $this->getCategoryTitle($codeLR);
            $data['page_functions_js'] = "functions_categories.js";
            echo("<script>console.log('PHP: test log category');</script>");
            echo $_SESSION['session'];
            $this->views->getView($this,"Category",$data);
        }

        public function getCategoryTitle(int $codeLR){
            $data = $this->model->getCategoryById($codeLR);
            return $data['nombre'];
        }

        public function getSubjectById(int $codeLR){
            $arrData = $this->model->getSubjectById($codeLR);
            echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
            die();
        }
    
        public function getSubjectsByCategory(int $codeLR){
            $arrData = $this->model->getSubjectsByCategory($codeLR);
            if (isset($_SESSION['session'])) {
                for($i=0; $i<count($arrData); $i++){
                    $arrData[$i]['acciones'] = '<div class="text-center">
                    <button class="btn btn-outline-secondary btn-sm" id="btnEditLR" onclick="getSubjectInfo(this)" title="Editar" lr="'.$arrData[$i]['id'].'"><i class="fas fa-pencil-alt"></i></button>
                    <button class="btn btn-outline-danger btn-sm" id="btnDeleteLR" onclick="deleteLearningResult(this) "title="Eliminar" lr="'.$arrData[$i]['id'].'"><i class="far fa-trash-alt"></i></button>
                    </div>';
                };   
                echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
                die();         
            }else {
                for($i=0; $i<count($arrData); $i++){
                    $arrData[$i]['acciones'] = '<div class="text-center">
                    <button class="btn btn-outline-secondary btn-sm" id="btnEditLR" onclick="getSubjectInfo(this)" title="Editar" lr="'.$arrData[$i]['id'].'"><i class="fas fa-pencil-alt"></i></button>
                    </div>';
                };
                echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
                die();
            }
        }
    }
?>