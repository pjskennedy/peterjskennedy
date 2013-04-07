class Personal.Views.Notfound extends Backbone.View

  template: JST['main/not_found']

  render: () ->
    $(@el).html(@template())
    this