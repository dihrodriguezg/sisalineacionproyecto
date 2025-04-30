<?php
    class Category extends Controllers{
        public function __construct(){
            parent::__construct();
        }

        public function Category(int $codeLR){
            $data['page_tag'] = $this->getLRTitleById($codeLR);
            $data['page_title'] = $this->getLRTitleById($codeLR);
            $data['page_functions_js'] = "functions_categories.js";
            $session = strtolower(strClean($_POST['txtUser']));
            $data['session'] = $session;
            $this->views->getView($this,"Category",$data);
        }

        public function getLRTitleById(int $codeLR){
            $data = $this->model->searchLRTitleById($codeLR);
            return $data['nombre'];
        }

        public function getSubjectById(int $codeLR){
            $arrData = $this->model->searchAllSubjectByLR($codeLR);
            echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
            die();
        }
    
        public function getLearningResult(int $codeLR){
            $arrData = $this->model->searchAllLearningResult($codeLR);
            for($i=0; $i<count($arrData); $i++){
                $arrData[$i]['acciones'] = '<div class="text-center">
                <button class="btn btn-outline-secondary btn-sm" id="btnEditLR" onclick="editLerningResultModal(this)" title="Editar" lr="'.$arrData[$i]['id'].'"><i class="fas fa-pencil-alt"></i></button>
                <button class="btn btn-outline-danger btn-sm" id="btnDeleteLR" onclick="deleteLearningResult(this) "title="Eliminar" lr="'.$arrData[$i]['id'].'"><i class="far fa-trash-alt"></i></button>
                </div>';
            };
            echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
            die();
        }
    }
?>