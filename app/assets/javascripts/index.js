$(document).ready(function(){
  $("#advice-button").click(function() {
    $( "#advice-list" ).toggle();
  });
  $(".shake").click(function() {
    $( "#toggle" ).effect("shake");
  });
});
