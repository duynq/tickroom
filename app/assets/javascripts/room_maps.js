$(document).ready(function(){

  var geocoder = new google.maps.Geocoder();

  function geocodePosition(pos) {
    geocoder.geocode({
      latLng: pos
    }, function(responses) {
      if (responses && responses.length > 0) {
        $("#address").html(responses[0].formatted_address);
        $("#room_address").val(responses[0].formatted_address);
      } else {
        $("#address").html("not found");
      }
    });
  }

  function initMap() {
    var map = new google.maps.Map($('#googleMap')[0], {
      center: {lat: -34.397, lng: 150.644},
      zoom: 15
    });
    var infoWindow = new google.maps.InfoWindow({map: map});

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
        marker = new google.maps.Marker({
          map: map,
          draggable: true,
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
        geocodePosition(marker.getPosition());
        map.setCenter(marker.getPosition());
        google.maps.event.addListener(marker,'dragend', function(){
          geocodePosition(marker.getPosition());
          $("#lat").val(marker.getPosition().lat());
          $("#lng").val(marker.getPosition().lng());
        });
      }, function() {
        handleLocationError(true, infoWindow, map.getCenter());
      });
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }
  }
  google.maps.event.addDomListener(window, 'load', initMap);
})
