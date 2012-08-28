class Personal.Views.Main extends Backbone.View

  events:
    'click  .nav-heading' : 'renderNewPage'

  template: JST['main']


  render: () ->
    $(@el).html(@template())
    this

  renderPage: (view) ->
    @$("#main-body").hide('slide', {direction: 'up', easing: 'swing', duration: 300}, () ->
      $("#main-body").html(view.render().el).show('slide', {direction: 'up', easing: 'swing'}, 300)
    )
    
  renderAbout: () ->
    @current_page = "about"
    @$(".nav-text").removeClass('nav-text-selected')
    $("#about").addClass('nav-text-selected')
    intro = new Personal.Views.Intro()
    @renderPage(intro)
    Backbone.history.navigate("/", false)

  renderEngineering: () ->
    @current_page = "engineering"
    @$(".nav-text").removeClass('nav-text-selected')
    $("#engineering").addClass('nav-text-selected')
    engineering = new Personal.Views.Engineering()
    @renderPage(engineering)
    Backbone.history.navigate("/engineering", false)

  renderContact: () ->
    @current_page = "contact"
    @$(".nav-text").removeClass('nav-text-selected')
    $("#contact").addClass('nav-text-selected')
    contact = new Personal.Views.Contact()
    @renderPage(contact)
    Backbone.history.navigate("/contact", false)

  renderNewPage: (event) =>
    page = $(event.currentTarget).data('page')
    if page == "about" and @current_page != "about"
      _gaq.push(['_trackEvent', 'About', 'navigated'])
      @renderAbout()
    if page == "engineering" and @current_page != "engineering"
      _gaq.push(['_trackEvent', 'Engineering', 'navigated'])
      @renderEngineering()
    if page == "contact" and @current_page != "contact"
      _gaq.push(['_trackEvent', 'Contact', 'navigated'])
      @renderContact()

  render404: () ->
    @current_page = "404"
    _gaq.push(['_trackEvent', 'Errors', 'navigated'])
    @$(".nav-text").removeClass('nav-text-selected')
    page_404 = new Personal.Views.Notfound()
    $("#main-body").html(page_404.render().el).show('slide', {direction: 'up', easing: 'swing'}, 300)
    Backbone.history.navigate("/not_found", false)

