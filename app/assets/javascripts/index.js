$(document).ready(function(){
  $("#advice-button").click(function() {
    $( "#advice-list" ).toggle();
  });

//   $(".get_message").click(function(ev) {
//     ev.preventDefault();
//     var $self=$( ".toggle" );
//     $self.effect( "shake", function() { 
//       document.location = $("#nav_get_message").attr('href');
//     });
//   });
// 
//   $(".home_link").click(function(ev_two) {
//     ev_two.preventDefault();
//     $( ".toggle" ).effect( "explode", function() { 
//       document.location = $("#nav_home_link").attr('href');
//     });
//   });
// 
//   $("#register_user").click(function(ev_three) {
//     ev_three.preventDefault();
//     $( "#register_user" ).effect( "explode", function() { 
//       document.location = $("#nav_register_user").attr('href');
//     });
//   });
// 
});
