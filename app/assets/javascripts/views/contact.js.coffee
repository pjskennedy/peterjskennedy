class Personal.Views.Contact extends Backbone.View

  events:
    'click .submit-button' : 'sendEmail'

  template:    JST['contact']

  initialize: () ->
    @email = new Personal.Models.Email()

  render: () ->
    $(@el).hide().html(@template()).show("slide", { direction: "down" }, 200)
    this

  validateEmail: (email) ->
    emailPattern = /// ^ #begin of line
       ([\w.-]+)         #one or more letters, numbers, _ . or -
       @                 #followed by an @ sign
       ([\w.-]+)         #then one or more letters, numbers, _ . or -
       \.                #followed by a period
       ([a-zA-Z.]{2,6})  #followed by 2 to 6 letters or periods
       $ ///i            #end of line and ignore case
    return true if email.match emailPattern
    return false


  checkFields: () ->
    valid = true
    if @email.attributes.name.length == 0
      $("#name-space").addClass("error")
      $("#name-space").children(".help-block").html("Please enter your name!")
      valid = false
    else
      $("#name-space").removeClass("error")
      $("#name-space").children(".help-block").html("")
      valid = true
    if not @validateEmail(@email.attributes.address)
      $("#email-space").addClass("error")
      $("#email-space").children(".help-block").html("Please enter a valid email!")
      valid = false
    else
      $("#email-space").removeClass("error")
      $("#email-space").children(".help-block").html("")
      valid = true
    if @email.attributes.body.length == 0
      $("#body-space").addClass("error")
      $("#body-space").children(".help-block").html("Please enter a message!")
      valid = false
    else
      $("#body-space").removeClass("error")
      $("#body-space").children(".help-block").html("")
      @email.attributes.body = @email.attributes.body.replace(///\n///g, '<br />')
      valid = true
    @emailFailed() if not valid
    return valid

  sendEmail: (event) =>
    @email.attributes = { address: $('#sender-email').val(), body: $('#sender-body').val(), name: $('#sender-name').val()}
    @email.save( {address: @email.attributes.address, name: @email.attributes.name, body: @email.attributes.body},{ success: @emailSent , error: @emailFailed }) if @checkFields()

  emailSent: () =>
    _gaq.push(['_trackEvent', 'Email', 'Sent', @email.attributes.email])
    $('#sender-name').val('')
    $('#sender-body').val('')
    $('#sender-email').val('')
    $('#response-control').removeClass('error')
    $('#response-control').addClass('success')
    $('#response-control').children('.response').html("Email was successfully sent!")
    @initialize()

  emailFailed: () =>
    _gaq.push(['_trackEvent', 'Email', 'Failed', @email.attributes.email])
    $('#response-control').removeClass('success')
    $('#response-control').addClass('error')
    $('#response-control').children('.response').html("Email was not sent!")
    @initialize()

