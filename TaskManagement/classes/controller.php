<?php
class Controller
{
  private $model;
  private $perpage = 5;

  public function __construct($aModel){
    $this->model = $aModel;
  }
  
  public function index(){
    $this->model->template = __DIR__.'/../template/taskList.tpl';
    $theOffset = 1;
    if(isset($_GET['offset']) && intval($_GET['offset']) > 0){
      $theOffset = $_GET['offset'];
    }
    
    //setting filters
    $theFilters = array();
    if(isset($_GET['description'])){
      $theFilters['description'] = $_GET['description'];
    }
    if(isset($_GET['startDate'])){
      $theFilters['startDate'] = $_GET['startDate'];
    }
    if(isset($_GET['endDate'])){
      $theFilters['endDate'] = $_GET['endDate'];
    }
    
    //setting link for pagination
    $theLink = 'index.php?';
    foreach($theFilters as $theKey => $theValue){
      $theLink .= $theKey."=".$theValue."&";
    }
    $theLink = ($theLink == 'index.php?')? "index.php?a=a" : substr($theLink, 0, -1); //hardcode
    
    //get max page
    $theCount = $this->model->getAllTasksByFiltersCount($theFilters);
    $theMaxPage = ceil($theCount['taskCount'] / $this->perpage);
    
    $theTaskList = $this->model->getAllTasksByFilters($theFilters, ($theOffset-1)*$this->perpage, $this->perpage);
    $this->model->data = array(
      'taskList' => $theTaskList,
      'offset' => $theOffset,
      'filters' => $theFilters,
      'link'=>$theLink,
      'maxPage'=> $theMaxPage
    );
  }

  public function newTask() {
    $this->model->template = __DIR__.'/../template/newTask.tpl';
  }
  
  //ajax
  public function doCreateTask() {
    $theData = $_POST;
    if($theData['description'] == '' || $theData['date'] == ''){
      echo "<legend class='text-danger'>Toate datele sunt obligatorii</legend>";
      exit;  
    }
    if($theData['date'] < date("Y-m-d")){
      echo "<legend class='text-danger'>Data trebuie sa fie mai mare decat azi</legend>";
      exit;
    }
    $theResult = $this->model->insertTask($theData);
    if (intval($theResult) > 0) {
      echo $theResult;
      exit;
    } else {
      echo "<legend class='text-danger'>Eroare la inserare</legend>";
      exit;
    }
  }
  
  public function changeTaskStatus(){
    $theId = intval($_GET['id']);
    $theStatus = $_GET['status'];
    if(intval($_GET['status']) == 1){
      $theStatus = 'facut';
    } elseif (intval($_GET['status']) == 0){
      $theStatus = 'nefacut';
    }
    $this->model->changeTaskStatus($theId, $theStatus);
    $this->index();
  }

  public function deleteTask(){
    $theId = intval($_GET['id']);
    $theTaskData = $this->model->getTaskById($theId);
    
    $theResult = $this->model->deleteTask($theId);
    if ($theTaskData != NULL) {
      $theContent = file_get_contents("log.txt");
      if($theContent == ""){
        $theContent = "DateDeleted\t ID\t Description\t Date\n";
      }
      $theContent .= date("Y-m-d"). "\t ".$theTaskData['id'] ."\t ". $theTaskData['description']."\t ". $theTaskData['date']."\n";
      file_put_contents("log.txt", $theContent);
    }
    $this->index();
  }
}
?>