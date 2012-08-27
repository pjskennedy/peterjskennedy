class Personal.Routers.PersonalRouter extends Backbone.Router
  routes:
    ''              : 'aboutPage'
    '/'             : 'aboutPage'  
    'contact'      : 'contactPage'
    'contact/'     : 'contactPage'
    'engineering'  : 'engineeringPage'
    'engineering/' : 'engineeringPage'

  renderMain: =>
    @main_page = new Personal.Views.Main()
    $("#container").html(@main_page.render().el)

  aboutPage: =>
    @renderMain()
    @main_page.renderAbout()

  contactPage: =>
    @renderMain()
    @main_page.renderContact()

  engineeringPage: =>
    @renderMain()
    @main_page.renderEngineering()