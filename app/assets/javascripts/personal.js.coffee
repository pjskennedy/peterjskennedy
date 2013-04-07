window.Personal =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Personal.Routers.PersonalRouter()
    new Personal.Routers.AppRouter()
    Backbone.history.start({pushState: true})
    
$(document).ready ->
  Personal.init()
