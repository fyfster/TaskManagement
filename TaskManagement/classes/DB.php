<?php
  require_once 'config.php';
  class DB{
    public $mssqlInstance;

    public function __construct(){
      if (is_null($this->mssqlInstance)) {
        $this->mssqlInstance = new mysqli(DB_SERVER, DB_UID, DB_PWD, DB_Database);
        // Check connection
        if (!$this->mssqlInstance) {
          die("Connection failed: " . $this->mssqlInstance->connect_error);
        }
      }
    }

  }
?>