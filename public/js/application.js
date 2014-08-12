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

Segment.create = function(path, funct) {
  self = this
  $.ajax({
    url: path,
    type: "get",
    dataType: "json",
    success: function(data) {
      for (info in data) {
        console.log(data)
        segments.push(new Segment(data[info]));
      }
      funct();
    }
  });
}

var displaySegment = function(segment) {
  var div = jQuery('<div/>', {
    class: "container"
  }).appendTo('#segments');

  jQuery('<div/>', {
    class: "left change_branch",
    href: "/json/" + segment.parent_id + "/" + (parseInt(segment.index) - 1),
    text: "{"
  }).appendTo(div)

  jQuery('<div/>', {
    class: "center",
    id: segment.id,
    text: segment.body
  }).appendTo(div)

  jQuery('<div/>', {
    class: "right change_branch",
    href: "/json/" + segment.parent_id + "/" + (parseInt(segment.index) + 1),
    text: "}"
  }).appendTo(div)

}

$(document).ready(function() {

  if ($("#segments")) {
    Segment.create($("#segments").attr("href"), function() {
      for (index in segments) {
        displaySegment(segments[index]);
      }
    });
  }

  $("#segments").on('click','.change_branch', function(e) { 
    e.preventDefault();
    Segment.create($("#segments").attr("href"), function() {
      for (index in segments) {
        displaySegment(segments[index]);
      }
    });
  });

});
