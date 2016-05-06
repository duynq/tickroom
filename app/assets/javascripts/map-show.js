$(document).ready(function() {
  var url = "/rooms/" + $("#room-id").text() + ".json";
  $.ajax({
    dataType: 'json',
    url: url,
    type: 'GET',
    success: function(data) {
      var lat = parseFloat(data.lat);
      var lng = parseFloat(data.lng);
      function initMap() {
        var map = new google.maps.Map($('#MapShow')[0], {
          center: {lat: lat, lng: lng},
          zoom: 15
        });
        var infoWindow = new google.maps.InfoWindow({map: map});
        var pos = {
          lat: lat,
          lng: lng
        };
        marker = new google.maps.Marker({
          map: map,
          position: pos
        });
        var circle = {
          strokeColor: "#006DFC",
          strokeOpacity: 0.4,
          strokeWeight: 2,
          fillColor: "#006DFC",
          fillOpacity: 0.15,
          map: map,
          center: marker.getPosition(),
          radius: 350 // in meters
        };
        var addressCicle = new google.maps.Circle(circle);
        addressCicle.bindTo('center', marker, 'position');
        map.setCenter(marker.getPosition());
      }
      google.maps.event.addDomListener(window, 'load', initMap);
    }
  });
  $("#comment").on("click", function(event) {
    event.preventDefault();
    $("#comments-section").fadeToggle();
    $("#comment_content").focus();
  });
});
