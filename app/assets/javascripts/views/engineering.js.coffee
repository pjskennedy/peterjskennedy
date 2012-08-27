class Personal.Views.Engineering extends Backbone.View

  # events:

  template:    JST['engineering']

  render: () ->
    $(@el).hide().html(@template()).show("slide", { direction: "down" }, 200)
    this



