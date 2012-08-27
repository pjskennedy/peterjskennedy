class Personal.Views.Intro extends Backbone.View

  # events:

  template:    JST['intro']

  render: () ->
    $(@el).html(@template()) #.slideDown('slow')#.show("slide", { direction: "down" }, 1000)
    this



