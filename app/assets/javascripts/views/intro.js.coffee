class Personal.Views.Intro extends Backbone.View

  # events:

  template:    JST['intro']

  render: () ->
    $(@el).html(@template())
    this



