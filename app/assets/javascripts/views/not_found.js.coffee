class Personal.Views.Notfound extends Backbone.View

  template: JST['not_found']

  render: () ->
    $(@el).html(@template())
    this