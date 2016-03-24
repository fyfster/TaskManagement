<?php
require_once 'classes/model.php';
require_once 'classes/controller.php';
require_once 'classes/view.php';
$model = new Model();
$controller = new Controller($model);

if (isset($_GET['action']) && !empty($_GET['action'])) {
  $controller->{$_GET['action']}();
} else {
  $controller->index();
}

$view = new View($controller, $model);
echo $view->output();
?>


