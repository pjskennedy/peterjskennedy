class App.Views.PostEdit extends Backbone.View

  events: 
    "click #preview-button": "previewEvent"
    "submit #edit-post-form": "formSubmitted"


  keyPressed: (event) =>
    if (event.keyCode == 27)
      @notes.deleteNodes()
    else if (event.ctrlKey or event.metaKey) and String.fromCharCode(event.which).toLowerCase() == "s"
      event.preventDefault()
      @savePost()
    else if (event.ctrlKey or event.metaKey) and event.shiftKey and String.fromCharCode(event.which).toLowerCase() == "p"
      event.preventDefault()
      @previewPost()

  formSubmitted: (e) => 
    e.preventDefault()
    @savePost()

  savePost: () =>
    @updatePostAttributes()
    @post.save({},
      success: (post) => 
        @notes.addNote("success", "Post updated")
      error: (post, response) => 
        @notes.addNote("error", "Error", JSON.parse(response.responseText))
    )

  updatePostAttributes: () -> 
    @post.set( 
      title: $("#post-title").val(),
      latitude: parseFloat($("#latitude").val()),
      longitude: parseFloat($("#longitude").val()),
      markdown: $("#post-markdown").val())

  initialize: (params) ->
    @el = params.el
    @previewURL = params.previewURL
    @post = new App.Models.AdminPost(id: params.id)
    @post.id = params.id
    @post.set(id: params.id)
    @updatePostAttributes();
    $(window).bind('keydown', @keyPressed)
    @updateMap()
    @notes = new App.Views.Notes

    fileUploadErrors = 
      maxFileSize: 'File is too big',
      minFileSize: 'File is too small',
      acceptFileTypes: 'Filetype not allowed',
      maxNumberOfFiles: 'Max number of files exceeded',
      uploadedBytes: 'Uploaded bytes exceed file size',
      emptyResult: 'Empty file upload result'

    # Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload();
    # 
    # Load existing files:
    $.getJSON($('#fileupload').prop('action'), (files) ->
      fu = $('#fileupload').data('blueimpFileupload')
      fu._adjustMaxNumberOfFiles(-files.length)
      template = fu._renderDownload(files).appendTo($('#fileupload .files'));
      
      # Force reflow:
      fu._reflow = fu._transition && template.length && template[0].offsetWidth;
      template.addClass('in');
      $('#loading').remove();

      $(".dropdown-menu .load-option").click((e) => 
        e.preventDefault()
        $('#post-markdown').val((index, val) => 
          return val + "\n![Alt text](" + $(e.currentTarget).data("route") + ")"
        )
      )
    )

  previewPost: (e) =>
    @updatePostAttributes()
    @post.preview(@previewURL,
      ((data) => 
        $("#preview-area").html(data.body)
        @notes.addNote("success", "Post Previewed")),
      (() -> @notes.addNote("warning", "Warning", "Could not preview post")))

  previewEvent: () => 
    e.preventDefault()
    @previewPost()

  updateMap: () ->
    if (typeof @post.latitude == "number") and (typeof @post.longitude == "number")
      @generateMapView(@post.latitude, @post.longitude)
    else 
      navigator.geolocation.getCurrentPosition(@locationGiven, @locationDenied, {timeout:30000})
      
  locationGiven: (pos) => 
    latitude = pos.coords.latitude
    longitude = pos.coords.longitude
    @generateMapView(latitude, longitude)

  locationDenied: () =>
    @notes.addNote("warning", "error", "Could not get coordinates")

  generateMapView: (latitude, longitude) ->
    loc = new google.maps.LatLng(latitude, longitude)
    @mapView = new App.Views.PostEditMap(el: @el, location: loc)
