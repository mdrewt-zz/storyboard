$(document).ready(function() {

  $('.next_branch').click(function(e) { 
    e.preventDefault();
    var id = $(this).attr("id")

    Segment.create($(this.href()))
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
        s = new Segment(data)
        console.log(s)
      }
    });
  }

  // {"id":5,"user_id":2,"story_id":1,"parent_id":2,"body":"zkxfthakru","created_at":"2014-06-30T14:10:44.216Z","updated_at":"2014-06-30T14:10:44.216Z"}

});
