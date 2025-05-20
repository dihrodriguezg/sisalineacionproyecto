<?php
    class SubjectInfo extends Controllers{
        public function __construct(){
            parent::__construct();
        }

        public function SubjectInfo(int $codeLR){
            $data['page_tag'] = $this->getLRTitleById($codeLR);
            $data['page_title'] = $this->getLRTitleById($codeLR);
            $data['page_functions_js'] = "functions_subject_info.js";
            $this->views->getView($this,"SubjectInfo",$data);
        }

        public function getLRTitleById(int $codeLR){
            $data = $this->model->searchLRTitleById($codeLR);
            return $data['nombre'];
        }

        public function findConcretResultBySubjectId(int $codeLR){
            $arrData = $this->model->findConcretResultBySubjectId($codeLR);
            for($i=0; $i<count($arrData); $i++){
                $arrData[$i]['acciones'] = '<div class="text-center">
                <button class="btn btn-outline-secondary btn-sm" id="btnEditLR" onclick="editConcreteResultButton(this)" title="Editar" lr="'.$arrData[$i]['id'].'"><i class="fas fa-pencil-alt"></i></button>
                <button class="btn btn-outline-danger btn-sm" id="btnDeleteLR" onclick="deleteConcreteResultButton(this) "title="Eliminar" lr="'.$arrData[$i]['id'].'"><i class="far fa-trash-alt"></i></button>
                </div>';
            };
            echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
            die();
        }

        public function findConcretResultById(int $concreteResultId){
            $id = intval(strClean($concreteResultId));
            if($id > 0){
                $arrData = $this->model->findConcretResultById($id);
                echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
            }
            die();
        }

        public function deleteConcreteResult(int $id){
            $data = $this->model->deleteConcreteResult($id);
            if (empty($data)){
                $data = array('status' => false, 'msg' => 'No es posible eliminar los datos.');
            } else {
                $data = array('status' => true, 'msg' => 'El resultado de aprendizaje ha sido eliminado');
            }
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
            die();
        }

        public function getSubjectById(int $codeLR){
            $arrData = $this->model->searchAllSubjectByLR($codeLR);
            echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
            die();
        }
    }
?>