class Personal.Views.Engineering extends Backbone.View

  template:    JST['main/engineering']

  render: () ->
    $(@el).hide().html(@template()).show("slide", { direction: "down" }, 200)
    this

