class Personal.Views.Intro extends Backbone.View

  template:      JST['main/intro']

  render: () ->
    $(@el).html(@template())
    this


