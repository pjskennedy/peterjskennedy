class Personal.Routers.AppRouter extends Backbone.Router
  routes:
    'apps/edit-distance' : 'editDistance'
    'apps/*undefined'    : 'render404Page'

  editDistance: =>
    @edpage = new Personal.Views.EditDistance()
    $("#container").html(@edpage.render().el)

  render404Page: =>
    Backbone.history.navigate("/not_found", true)

