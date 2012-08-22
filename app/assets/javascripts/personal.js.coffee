window.Personal =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Personal.Routers.PersonalRouter
    Backbone.history.start({pushState: true})
    
$(document).ready ->
  Personal.init()
