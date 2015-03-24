<?php
class UsuarioController extends Zend_Controller_Action{

	public function agregarAction(){
		$agregarForm = new Application_Form_Usuario_Agregar();

		if ($agregarForm->isValid($_POST)) {



			
			$usuario = new Application_Model_DbTable_Usuario();

			$data = array(
			    'username'      =>  $agregarForm->getValue('username'),
			    'password' =>  $agregarForm->getValue('password'),
			);			

			 $usuario->insert($data);

			// $db = Zend_Db_Table::getDefaultAdapter();
			// $stmt = $db->query($sql);

		}else
		echo 'no post';






		$this->view->agregarForm = $agregarForm;
	}
	
}