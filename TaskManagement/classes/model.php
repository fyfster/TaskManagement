<?php
require_once 'classes/db.php';
class Model
{
  public $db;
  public $data;
  
  public function __construct(){
    $theDbObject = new DB();
    $this->db = $theDbObject->mssqlInstance;
    $this->template = '';
  }
  
  public function getAllTasksByFiltersCount($aFilters){
    $theFilterString = $this->createWhereClause($aFilters);
     
    $theSql = "SELECT COUNT(*) AS taskCount
               FROM task
               ".$theFilterString;
    $theResult = $this->db->query($theSql);
    return $theResult->fetch_assoc();
  }
  
  public function getAllTasksByFilters($aFilters, $aStart, $aLimit){
    $theFilterString = $this->createWhereClause($aFilters);
     
    $theSql = "SELECT * 
               FROM task
               ".$theFilterString."
               LIMIT ".$aStart.", ".$aLimit;
    $theResult = $this->db->query($theSql);
    $theArrayResult = array();
    if ($theResult->num_rows > 0) {
      $theArrayResult = array();
      while($theRow = $theResult->fetch_assoc()) {
        $theArrayResult[] = $theRow;
      }
    }
    return $theArrayResult;
  }
  
  public function getTaskById($anId){
    $theSql = "SELECT * FROM task where id = ".$anId;
    $theResult = $this->db->query($theSql);
    return $theResult->fetch_assoc();
  }
  
  public function insertTask($aTaskDetails){
    $theSql = "INSERT INTO task (description, date, status)
      VALUES ('".$aTaskDetails['description']."', '".$aTaskDetails['date']."', 'nefacut')";
    $theResult = $this->db->query($theSql);
    return mysqli_insert_id($this->db);
  }
  
  public function deleteTask($anId){
    $theSql = "DELETE FROM task WHERE id=".$anId;
    return $this->db->query($theSql);
  }
  
  public function changeTaskStatus($aTaskId, $aStatus){
    $theSql = "UPDATE task
      SET status= '".$aStatus."'
      WHERE id = ".$aTaskId;
    $theResult = $this->db->query($theSql);
    return $theResult;
  }
  
  private function createWhereClause($aFilters){
    $theFilterString = " WHERE 1=1"; //i make this so i cand add "AND" in front of each condition 
    $theFilterString .= (isset($aFilters['description']) && $aFilters['description'] != '')? " AND description like '%".$aFilters['description']."%'" : '';
    $theFilterString .= (isset($aFilters['endDate']) && $aFilters['endDate'] != '')? " AND date <= '".$aFilters['endDate']."'" : '';
    $theFilterString .= (isset($aFilters['startDate']) && $aFilters['startDate'] != '')? " AND date >= '".$aFilters['startDate']."'" : '';
    return $theFilterString;
  }
}
?>