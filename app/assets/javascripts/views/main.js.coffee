class Personal.Views.Main extends Backbone.View

  events:
    'click  .nav-heading' : 'renderNewPage'

  template: JST['main']


  render: () ->
    $(@el).html(@template())
    @current_page = "about"
    @renderAbout()
    @$("#about").removeClass('nav-text-deselected')
    @$("#about").addClass('nav-text-selected')    
    this

  renderPage: (view) ->
    @$("#main-body").hide('slide', {direction: 'up', easing: 'swing', duration: 300}, () ->
      $("#main-body").html(view.render().el).show('slide', {direction: 'up', easing: 'swing'}, 300)
    )

  renderAbout: () ->
    @$(".nav-text").removeClass('nav-text-selected')
    $("#about").addClass('nav-text-selected')
    intro = new Personal.Views.Intro()
    @renderPage(intro)

  renderEngineering: () ->
    @$(".nav-text").removeClass('nav-text-selected')
    $("#engineering").addClass('nav-text-selected')
    engineering = new Personal.Views.Engineering()
    @renderPage(engineering)

  renderContact: () ->
    @$(".nav-text").removeClass('nav-text-selected')
    $("#contact").addClass('nav-text-selected')
    contact = new Personal.Views.Contact()
    @renderPage(contact)

  renderNewPage: (event) =>
    page = $(event.currentTarget).data('page')
    if page == "about" and @current_page != "about"
      @renderAbout()
    if page == "engineering" and @current_page != "engineering"
      @renderEngineering()
    if page == "contact" and @current_page != "contact"
      @renderContact()
    @current_page = page