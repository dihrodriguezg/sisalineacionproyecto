<?php
    session_start();
    class Login extends Controllers{

        public function __construct(){
            parent::__construct();
        }

        public function Login(){
            $data['page_tag'] = 'Iniciar sesión - Resultados de aprendizaje';
            $data['page_title'] = 'Iniciar sesión';
            $data['page_functions_js'] = "functions_login.js";
            $this->views->getView($this,"Login",$data);
        }

        public function validateSession(){
            $strUser = strtolower(strClean($_POST['txtUser']));
            $strPassword = strClean($_POST['txtPassword']);
            
            $requestUser = $this->model->loginUser($strUser, $strPassword);
            if(!empty($requestUser)){
                $data['page_tag'] = "Modificar Resultados de Aprendizaje";
                $data['page_title'] = "Modificación Resultados de Aprendizaje";
                $data['page_functions_js'] = "functions_edit_lr.js";
                $data['user'] = $strUser;
                $data['pass'] = $strPassword;
                $_SESSION['session'] =   $strUser;//hash("SHA256", $strPassword);            
                echo "<script>
                    window.location= '".baseUrl()."'
                </script>";
                exit();
            } else {
                echo "<script> alert('Credenciales incorrectas');
                    window.location= '".baseUrl()."Login'
                </script>";
            }
        }
    }    
?>