
<div class="text-center" style="margin-bottom: 10px;">
  <a href="index.php?action=newTask" class="newTask btn btn-primary">Task nou</a>
  <div class="createtTaskOptions" style="display: none">
    <a href="javacript:;" class="createTask btn btn-primary">Creaza task</a>
    <a href="javacript:;" class="cancel btn btn-primary">Cancel</a>
  </div>
</div>

<input type="hidden" class="link" value="<?php echo $data['link']; ?>&offset=<?php echo $data['offset'];?>"/>
<table class="table table-bordered table-responsive table-striped table-condensed">
  <form class="form" action="index.php" method="get">
  <input type="hidden" name="offset" value="<?php echo $data['offset'];?>">
  <tr>
    <th colspan="5">Filters: 
      <input type="submit" class="btn-xs btn-primary pull-right" value="Aplica"/>
      <button class="btn-xs btn-primary pull-right clearFilters" style="margin-right: 10px;">Sterge filtrele</button>
    </th>
  </tr>
  <tr>
    <td colspan="5">
      <div class="form-group">
        <label>Descriere</label>
        <input type="text" class="form-control description" placeholder="Descriere" name="description" value="<?php echo (isset($data['filters']['description'])? $data['filters']['description'] : ''); ?>">
      </div>
      <div class="form-group">
        <label>Cu data intre: </label><br>
        <input type="text" class="form-control fulldate" style="width: 49%; display: inline-block;" placeholder="data inceput" name="startDate" value="<?php echo (isset($data['filters']['startDate'])? $data['filters']['startDate'] : ''); ?>"> -
        <input type="text" class="form-control fulldate" style="width: 49%; display: inline-block;" placeholder="data sfarsit" name="endDate" value="<?php echo (isset($data['filters']['endDate'])? $data['filters']['endDate'] : ''); ?>">
      </div>
    </td>
  </tr>
  </form>
  <tr>
    <th>Id</th>
    <th>Descriere</th>
    <th>Date created</th>
    <th>Status</th>
    <th>Action</th>
  </tr>
  <?php if(count($data['taskList']) < 1){ ?>
    <tr>
      <td colspan="5" class="text-center">Nu exista nici un task</td>
    </tr>
  <?php } ?>
  <?php foreach($data['taskList'] as $theTaskList){ ;?>
    <tr>
      <td><?php echo $theTaskList['id']; ?></td>
      <td><?php echo $theTaskList['description']; ?></td>
      <td><?php echo $theTaskList['date']; ?></td>
      <td><?php echo $theTaskList['status']; ?></td>
      <td style="width: 180px;">
        <?php if($theTaskList['status'] == "nefacut"){ ?>
          <a href="<?php echo $data['link']; ?>&offset=<?php echo $data['offset'];?>&action=changeTaskStatus&id=<?php echo $theTaskList['id']; ?>&status=1" class="btn-sm btn-success">Rezolva</a>
        <?php } elseif($theTaskList['status'] == "facut"){ ?>
          <a href="<?php echo $data['link']; ?>&offset=<?php echo $data['offset'];?>&action=changeTaskStatus&id=<?php echo $theTaskList['id']; ?>&status=0" class="btn-sm btn-warning">Nu e rezolvat</a>
        <?php } ?>
        <a href="javascript:;" data-id="<?php echo $theTaskList['id']; ?>" class="btn-sm btn-danger deleteTask">Sterge</a>
      </td>
    </tr>
  <?php } ?>
  <?php if(count($data['taskList']) > 0){ ?>
    <tr>
      <td colspan="5" class="text-center">
        <?php if($data['offset'] > 1){ ?>
          <a href="<?php echo $data['link']; ?>&offset=<?php echo $data['offset']-1; ?>"><< </a>
        <?php }  ?> 
        <a href="javascript:;"><?php echo $data['offset']; ?></a> 
        <?php if($data['offset'] < $data['maxPage']){ ?>
          <a href="<?php echo $data['link']; ?>&offset=<?php echo $data['offset']+1; ?>"> >></a>
        <?php } ?>
      </td>
    </tr>
  <?php } ?>
</table>