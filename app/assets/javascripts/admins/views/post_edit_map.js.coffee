class App.Views.PostEditMap extends Backbone.View 

  events: 
    "keyup .geofield": "coordsChanges"

  initialize: (params) ->
    @el = params.el

    @mapLocation = params.location
    
    mapOptions = 
      center: @mapLocation
      zoom: 13

    @mapBody = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
    @mapMarker = new google.maps.Marker(
      position: @mapLocation,
      map: @mapBody,
      draggable: true,
      title: "Drag Me!"
    )
    google.maps.event.addListener(@mapMarker, 'mouseup', () =>
      @updateLocation(@mapMarker.getPosition());
    )

  coordsChanges: (e) =>
    @mapLocation = new google.maps.LatLng($("#latitude").val(), $("#longitude").val());
    @mapMarker.setPosition(@mapLocation);
    @mapBody.setCenter(@mapLocation);

  updateLocation: (position) ->
    this.mapLocation = new google.maps.LatLng(position.k, position.A);
    $("#latitude").val(position.k)
    $("#longitude").val(position.A)
