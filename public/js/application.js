var currentSegments = [];
var newSegments = [];

function contains_id(a, obj) {
    for (var i = 0; i < a.length; i++) {
        if (a[i].id === obj) {
            return true;
        }
    }
    return false;
}

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
      for (i in data) {
        newSegments.push(new Segment(data[i]));
      }
      for (i in currentSegments) {
        if (!contains_id(newSegments, i.id)) {
          $("#" + i.id).toggle("slide");
          $("#" + i.id).remove();
          index = currentSegments.indexOf(i);
          currentSegments.splice(index, 1)
        }
      }

      funct();
    }
  });
}

var displaySegment = function(segment) {
  var div = jQuery('<div/>', {
    id: segment.id,
    class: "container"
  }).appendTo('#segments');

  jQuery('<div/>', {
    class: "left change_branch",
    href: "/json/" + segment.story_id + "/" + segment.parent_id + "/" + (parseInt(segment.index) - 1),
    text: "{"
  }).appendTo(div)

  jQuery('<div/>', {
    class: "center",
    text: segment.body
  }).appendTo(div)

  jQuery('<div/>', {
    class: "right change_branch",
    href: "/json/" + segment.story_id + "/" + segment.parent_id + "/" + (parseInt(segment.index) + 1),
    text: "}"
  }).appendTo(div)

}

$(document).ready(function() {

  if ($("#segments")) {
    Segment.create($("#segments").attr("href"), function() {
      for (index in newSegments) {
        var seg = newSegments[index];
        if (!contains_id(currentSegments, seg.id)) {
          currentSegments.push(seg);
          displaySegment(seg);
        }
      }
    });
  }

  $("#segments").on('click','.change_branch', function(e) { 
    e.preventDefault();
    Segment.create($("#segments").attr("href"), function() {
      for (index in currentSegments) {
        displaySegment(currentSegments[index]);
      }
    });
  });

});
