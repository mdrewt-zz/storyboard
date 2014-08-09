$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('.next_branch').click(function(e) { 
    e.preventDefault();
    var id = $(this).attr("id")

    $.ajax({
      url: window.location.pathname + id,
      type: "post",
      dataType: "json",
      success: function(data) { 
        $('.segment:gt(' + id + ')').remove(); 
        for(i=0; i<data.length; i++) {
          $('body').append("<div class='container segment' id=" + data[i].id + ">" + data[i].content + "</div>")
        }
      }
    });

  });

});
