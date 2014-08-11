$(document).ready(function() {

  var segments;
  if ($("#segment_container")) {
    $.ajax({
      url: $(#segment_container).attr("href"),
      type: "get",
      dataType: "json",
      success: function(data) {
        s = new Segment(data)
        console.log(s)
      }
    });
  }

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

});
