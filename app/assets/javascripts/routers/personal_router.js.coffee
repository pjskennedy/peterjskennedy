class Personal.Routers.PersonalRouter extends Backbone.Router
  routes:
    ''        : 'mainPage'
    '/'       : 'mainPage'


  mainPage: ->
    main = new Personal.Models.Main
    main_page = new Personal.Views.Main( model: main )
    $("#container").html(main_page.render().el)
