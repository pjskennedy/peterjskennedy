class Personal.Routers.PersonalRouter extends Backbone.Router
  routes:
    ''              : 'aboutPage'
    '/'             : 'aboutPage'  
    'contact'      : 'contactPage'
    'contact/'     : 'contactPage'
    'engineering'  : 'engineeringPage'
    'engineering/' : 'engineeringPage'
    'resume' : 'resumePage'
    'resume/': 'resumePage'
    'apps'       : 'appRender'
    'apps/'      : 'appRender'
    'apps/*undefined'     : 'appRender'
    '*undefined' : 'render404Page'

    'not_found'  : 'render404Page'
    'not_found/' : 'render404Page'


  initialize: =>
    @main_page = new Personal.Views.Main()

  appRender: =>
    null

  resumePage: =>
    null

  renderMain: =>
    $("#container").html(@main_page.render().el)
    @main_rendered = true

  aboutPage: =>
    @renderMain()
    @main_page.renderAbout()

  contactPage: =>
    @renderMain()
    @main_page.renderContact() 

  engineeringPage: =>
    @renderMain()
    @main_page.renderEngineering() 

  render404Page: =>
    @renderMain()
    @main_page.render404() 

