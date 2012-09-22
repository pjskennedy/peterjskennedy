class Personal.Views.Tweet extends Backbone.View

  template: JST['tweet']

  render: (item) ->
    $(@el).html(@template(tweet: item))
    this
