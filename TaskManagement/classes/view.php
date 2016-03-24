<?php
class View
{
    private $model;
    private $controller;

    public function __construct($aController,$aModel) {
        $this->controller = $aController;
        $this->model = $aModel;
    }

    public function output() {
      require_once("/../template/header.tpl");
      $data = $this->model->data;
      require_once($this->model->template);
      require_once("/../template/footer.tpl");
    }
}
?>