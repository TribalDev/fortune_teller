$(document).ready(function(){
  $(".get_message").click(function(ev) {
    ev.preventDefault();
    var $self=$( "#toggle" );
    $self.effect( "shake", function() { 
      document.location = $self.attr('href');
    });
  });

  $("#home_link").click(function(ev_two) {
    ev_two.preventDefault();
    $( "#toggle" ).effect( "slide", function() { 
      document.location = $("#home_link").attr('href');
    });
  });
});
