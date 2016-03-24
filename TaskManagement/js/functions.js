$(document).ready(function() {
  $('.date').datepicker({ minDate: 0, dateFormat: "yy-m-d"});
  
  $('.fulldate').datepicker({dateFormat: "yy-m-d"});
  
  $('.clearFilters').click(function(e){
    $('.fulldate').val('');
    $('.description').val('');
    $('.form').submit();
  });
  
  $('.deleteTask').click(function(e){
    $theId = $(e.currentTarget).data('id');
    if(confirm('esti sigur ca vrei sa stergi taskul cu numarul: '+$theId +' ?')){
      window.location.href = $('.link').val()+"&action=deleteTask&id="+$theId;
    };
  });
  
  $('.createTask').click(function(){
    $.ajax({
      url: "index.php?action=doCreateTask",
      method: "POST",
      data:{
        description: $('.description').val(),
        date: $('.date').val()
      },
      success: function(data){
        if(parseInt(data) > 0){
          $(".notificationBar")[0].innerHTML = '<legend class="text-success">Task inserat cu succes</legend>';
          $('.date').val('');
          $('.description').val('');
        } else {
          $(".notificationBar")[0].innerHTML = data;
        }
      }
    });
  });
});