<?php
    session_start();
    class SubjectInfo extends Controllers{
        public function __construct(){
            parent::__construct();
        }

        public function SubjectInfo(int $subjectId){
            $data['page_tag'] = $this->getLRTitleById($subjectId);
            $data['page_title'] = $this->getLRTitleById($subjectId);            
            $data['subject_id'] = $subjectId;
            $data['page_functions_js'] = "functions_subject_info.js";
            $this->views->getView($this,"SubjectInfo",$data);
        }

        public function getLRTitleById(int $codeLR){
            $data = $this->model->searchLRTitleById($codeLR);
            return $data['nombre'];
        }

        public function findConcretResultBySubjectId(int $codeLR){            
            $arrData = $this->model->findConcretResultBySubjectId($codeLR);
            if (isset($_SESSION['session'])) {
                for($i=0; $i<count($arrData); $i++){
                    $arrData[$i]['acciones'] = '<div class="text-center">
                    <button class="btn btn-outline-danger btn-sm" id="btnDeleteLR" onclick="deleteConcreteResultButton(this)" title="Eliminar" lr="'.$arrData[$i]['rid'].'" assignmentId="'.$arrData[$i]['id'].'"><i class="far fa-trash-alt"></i></button>
                    </div>';
                };
                echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
                die();
            }else{
                for($i=0; $i<count($arrData); $i++){
                    $arrData[$i]['acciones'] = '<div class="text-center">
                    <button disabled class="btn btn-outline-danger btn-sm" id="btnDeleteLR" title="Eliminar" lr="'.$arrData[$i]['id'].'"><i class="far fa-trash-alt"></i></button>
                    </div>';
                };
                echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
                die();
            }
        }

        public function findConcretResultById(int $concreteResultId){
            $id = intval(strClean($concreteResultId));
            if($id > 0){
                $arrData = $this->model->findConcretResultById($id);
                echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
            }
            die();
        }

        public function deleteConcreteResult(string $params){
            $arrParams = explode(',', $params);
            $data = $this->model->deleteConcreteResult(intval($arrParams[0]), intval($arrParams[1]));
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

        public function addConcreteResult(string $subjectId){
            $selectedCheckboxes = $_POST['learning_results'];
            $assignmentId = intval($subjectId);
            foreach($selectedCheckboxes as $checkbox){
                $data = $this->model->saveConcreteResult(intval($checkbox), $assignmentId);
            }
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
            die();
        }

        private function getLastCode(){
            $data = $this->model->searchLastCode();
            return $data[0]['id'];
        }

        public function putConcreteResult(int $id){
            $name = strClean($_POST['txtNameEdit']);
            $description = strClean($_POST['txtDescriptionEdit']);
            $data = $this->model->updateConcreteResult($id, $name, $description);
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
            die();
        }
    }
?>