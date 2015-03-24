<?php
class AuthController extends Zend_Controller_Action
{
 
    public function loginAction()
    {
        $db = $this->_getParam('db');
 
        $loginForm = new Application_Form_Auth_Login();
 
        if ($loginForm->isValid($_POST)) {
            
            $adapter = new Zend_Auth_Adapter_DbTable(
                $db,
                'usuario',
                'username',
                'password',
                ''
                );
 
            $adapter->setIdentity($loginForm->getValue('username'));
            $adapter->setCredential($loginForm->getValue('password'));
 
            $auth   = Zend_Auth::getInstance();
            
            $result = $auth->authenticate($adapter);
            switch ($result->getCode()) {
 
                case Zend_Auth_Result::FAILURE_IDENTITY_NOT_FOUND:
                    /** do stuff for nonexistent identity **/
                    break;
             
                case Zend_Auth_Result::FAILURE_CREDENTIAL_INVALID:
                    /** do stuff for invalid credential **/
                    
                    break;
             
                case Zend_Auth_Result::SUCCESS:
                    /** do stuff for successful authentication **/
                    
                    break;
             
                default:
                    /** do stuff for other failure **/
                    break;
            }
 
            if ($result->isValid()) {
                echo 'valid';
                $user = $adapter->getResultRowObject();
                $auth->getStorage()->write($user);
                $this->_helper->FlashMessenger('Successful Login');
                $this->_redirect('/');
                return;
            }else
            echo 'no valid';

 
        }
 
        $this->view->loginForm = $loginForm;
 
    }
 
}