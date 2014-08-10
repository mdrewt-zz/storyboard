$(document).ready(function() {

  $('.next_branch').click(function(e) { 
    e.preventDefault();
    var id = $(this).attr("id")

    $.ajax({
      url: window.location.pathname + id,
      type: "get",
      dataType: "json",
      success: function(data) { 
        $('.segment:gt(' + id + ')').remove(); 
        for(i=0; i<data.length; i++) {
          $('body').append("<div class='container segment' id=" + data[i].id + ">" + data[i].content + "</div>")
        }
      }
    });
  });

  var Segment = function(data) {
    this.init(data)
  }

  var init = function(o){
    for (p in o){
      this[p] = o[p]
    }
  }

  Segment.prototype.init = init

  Segment.prototype.create = function(path){
    self = this
    $.ajax({
      url: path
      type: "get",
      dataType: "json",
      success: function(data) {
        self.id = data.id
        self.user_id =
      }
    });
  }

  // {"id":5,"user_id":2,"story_id":1,"parent_id":2,"body":"zkxfthakru","created_at":"2014-06-30T14:10:44.216Z","updated_at":"2014-06-30T14:10:44.216Z"}

});
