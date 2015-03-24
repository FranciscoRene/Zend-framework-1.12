<?php
class Application_Model_guestbook_has_cliente
{
    protected $_guestbook_id;
    protected $_Cliente_idCliente;
 
    public function __construct(array $options = null)
    {
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value)
    {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid guestbook property');
        }
        $this->$method($value);
    }
 
    public function __get($name)
    {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid guestbook property');
        }
        return $this->$method();
    }
 
    public function setOptions(array $options)
    {
        $methods = get_class_methods($this);
        foreach ($options as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (in_array($method, $methods)) {
                $this->$method($value);
            }
        }
        return $this;
    }
 
    public function setguestbook_id($id)
    {
        $this->_guestbook_id = (int) $id;
        return $this;
    }
 
    public function getguestbook_id()
    {
        return $this->_guestbook_id;
    }

    public function setCliente_idCliente($id)
    {
        $this->_Cliente_idCliente = (int) $id;
        return $this;
    }
 
    public function getCliente_idCliente()
    {
        return $this->_Cliente_idCliente;
    }

 

}