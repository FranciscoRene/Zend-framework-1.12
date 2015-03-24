<?php
class Application_Form_Usuario_Agregar extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');
 
        $this->addElement(
            'text', 'username', array(
                'label' => 'Username:',
                'required' => true,
                'filters'    => array('StringTrim'),
            ));
 
        $this->addElement('password', 'password', array(
            'label' => 'Password:',
            'required' => true,
            ));
        $this->addElement('password', 'repassword', array(
            'label' => 'Re-Password:',
            'required' => false,
            ));        
 
        $this->addElement('submit', 'submit', array(
            'ignore'   => true,
            'label'    => 'Login',
            ));
 
    }
}