<?php
    class SubjectInfo extends Controllers{
        public function __construct(){
            parent::__construct();
        }

        public function SubjectInfo(int $codeLR){
            $data['page_tag'] = $this->getLRTitleById($codeLR);
            $data['page_title'] = $this->getLRTitleById($codeLR);
            $data['page_functions_js'] = "functions_subjects_lr.js";
            $this->views->getView($this,"SubjectInfo",$data);
        }

        public function getSubject(int $codeLR){
            $data['page_tag'] = $this->getLRTitleById($codeLR);
            $data['page_title'] = $this->getLRTitleById($codeLR);
            $data['page_functions_js'] = "functions_subjects_lr.js";
            $this->views->getView($this,"SubjectInfo",$data);
            $htmlOptions = "";

            $arrData = $this->model->findConcretResultBySubjectId($codeLR);
            if(count($arrData) > 0){
                for($i = 0; $i <count($arrData); $i++){
                    $htmlOptions .= '<option value="'.$arrData[$i]['id'].'">'.$arrData[$i]['descripcion'].'</option>';
                }
            }
            echo $htmlOptions;
            die();
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
    }
?>