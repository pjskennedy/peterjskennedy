class Personal.Views.Main extends Backbone.View

  events:
    'mouseenter .nav-heading': 'selectItem'
    'mouseleave .nav-heading': 'deselectItem'
    'click .nav-heading': 'routeToPage'
    'click #send-email': 'sendEmail'

  template: JST['main']
  brief_intro: JST['brief_intro']
  about: JST['about']
  contact: JST['contact']

  initialize: () -> 
    @email = new Personal.Models.Email

  render: () ->
    $(@el).html(@template())
    this

  selectItem: (event) =>
    $(event.currentTarget).children(".icon").removeClass('hidden')

  deselectItem: (event) =>
    $(event.currentTarget).children(".icon").addClass('hidden')

  routeToPage: (event) =>
    page = $(event.currentTarget).attr('page')
    if page == "about"
      console.log page
      # route to about
    else if page == "engineering"
      console.log page

      # route to engineering
    else if page == "contact"
      console.log page

      $('.main-body').html(@contact())
    else if page == "site"
      console.log page
      #  route to site

  sendEmail: (event) =>
    event.preventDefault()
    @email.attributes.address = $("#email").val()
    @email.attributes.name    = $("#name").val()
    @email.attributes.body    = $("#email-body").val()
    @email.save( success: @emailSent error: @emailFailed)

  emailSent: () =>
    alert 'Email sent successfully'

  emailFailed: () =>
    alert 'Email sent successfully'