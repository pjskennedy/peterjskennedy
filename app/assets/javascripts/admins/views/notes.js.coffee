class App.Views.Notes extends Backbone.View

  noteTemplate: JST["admins/note"]
  animationLength: 200
  delayLength: 7000
  id: 0
  el: "#note-location"

  events:
    "click .note .remove": "removeNode"

  addNote: (type, title, data) -> 
    @id += 1
    selector = "#note-" + @id
    ll = @noteTemplate(type: type, title: title, data: data, id: @id)
    $(ll).hide().prependTo("#note-location").fadeIn(@animationLength).delay(@delayLength).fadeOut(@animationLength, () -> $(selector).remove())

  deleteNodes: -> 
    $("#note-location").html("")
