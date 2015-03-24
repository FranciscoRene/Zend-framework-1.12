<?php

class GuestbookController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {

       // $guestbook = new Application_Model_GuestbookMapper();
       // $sql = 'SELECT * FROM guestbook' ;
      $sql = "select id, comment, email_com , Cliente_idCliente, nombre from
      (select id, comment, email AS email_com, Cliente_idCliente from guestbook 
      join guestbook_has_cliente on guestbook.id=guestbook_has_cliente.guestbook_id) as tab
      join cliente on tab.Cliente_idCliente = cliente.idCliente";
      echo 'test';       


       $db = Zend_Db_Table::getDefaultAdapter();

		// $dbAdapter = new Zend_Db_Adapter_Pdo_Mysql(array(
		//     'host'     => 'localhost',
		//     'username' => 'panshot',
		//     'password' => '954133sk8',
		//     'dbname'   => 'z1'
		// ));       
       // $stmt = $dbAdapter->query($sql);
       // echo 'test';
       $stmt = $db->query($sql);


       $this->view->entries = $stmt->fetchAll();


 
	   
       
    }

  public function signAction()
  {
    $request = $this->getRequest();
    $form    = new Application_Form_Guestbook_Guestbook();

    if ($this->getRequest()->isPost()) {
      echo 'post';
      if ($form->isValid($request->getPost())) {
        echo 'valid';
        $comment = new Application_Model_Guestbook($form->getValues());
        $mapper  = new Application_Model_GuestbookMapper();
        $id = $mapper->save($comment);
        

        
        // echo 'last inserted id: ' . $db->lastInsertId();
        // echo '<br>';
        echo 'last inserted id: ' . $mapper->lastInsert(). '<br>';
        $auth = Zend_Auth::getInstance();
       
        echo 'Id del usuario es: ' .$auth->getIdentity()->idUsuario;
        $comentario = $mapper->lastInsert();
        $usuario = $auth->getIdentity()->idUsuario;

        $db = Zend_Db_Table::getDefaultAdapter();

        $sql = "INSERT INTO guestbook_has_cliente (guestbook_id, Cliente_idCliente)
        VALUES ('$comentario', '$usuario')";

        // $sql = "select id, comment, email_com , Cliente_idCliente, nombre from
        // (select id, comment, email AS email_com, Cliente_idCliente from guestbook 
        // join guestbook_has_cliente on guestbook.id=guestbook_has_cliente.guestbook_id) as tab
        // join cliente on tab.Cliente_idCliente = cliente.idCliente"
        // echo 'test';
        $stmt = $db->query($sql);






        
       }
    }

  $this->view->form = $form;
  }


}



