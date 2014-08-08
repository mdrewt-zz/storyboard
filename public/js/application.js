$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('.next_branch').click(function(e) {
    e.preventDefault();

    $.ajax({
      url: window.location.pathname + "/usertype",
      type: "post",
      dataType: "json",
      success: function(data) { 
        player = data; 
      }
    });
    
  });

});
