var segments = [];

var Segment = function(data) {
  this.init(data);
}

var init = function(o){
  for (p in o){
    this[p] = o[p];
  }
}

Segment.prototype.init = init

Segment.create = function(path) {
  self = this
  $.ajax({
    url: path,
    type: "get",
    dataType: "json",
    success: function(data) {
      for (info in data) {
        segments.push(new Segment(data[info]))
      }
    }
  });
}

var displaySegment = function(segment) {
  var div = jQuery('<div/>', {
    class: "container"
  }).appendTo('#segments');

  jQuery('<div/>', {
    class: "left",
    href: "/json/" + segment.parent_id + "/0",
    text: "{"
  }).appendTo(div)

  jQuery('<div/>', {
    class: "center",
    id: segment.id,
    text: segment.body
  }).appendTo(div)

  jQuery('<div/>', {
    class: "right",
    href: "/json/" + segment.parent_id + "/0",
    text: "}"
  }).appendTo(div)

}

$(document).ready(function() {

  // id: segment.id,

  var segments;
  if ($("#segment_container")) {
    $.ajax({
      url: $("#segment_container").attr("href"),
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

});
