class Personal.Views.Notfound extends Backbone.View

  template: JST['404']

  render: () ->
    $(@el).html(@template())
    this