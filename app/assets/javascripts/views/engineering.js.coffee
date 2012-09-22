class Personal.Views.Engineering extends Backbone.View

  events:
    'click .read-more-venio' : 'renderMoreVenio'
    'click .read-more-murphee' : 'renderMoreMurphee'


  template:    JST['engineering']

        # 
    # .masonry()

  render: () ->
    $(@el).hide().html(@template()).show("slide", { direction: "down" }, 200)
    # $location = @$('.read-more-murphee-body')
    # $location.imagesLoaded( 
    #   $location.masonry(
    #     )
    #   )
    this

  renderMoreVenio: (event) =>
    if $('.read-more-venio-body').hasClass("hidden")
      $('.read-more-venio-body')
        .removeClass("hidden")
        .hide()
        .css('opacity', 0)
        .slideDown('fast')
        .animate({ opacity: 1 },{ queue: false, duration: 'fast' })
      $('.read-more-venio').html("Less")
    else
      $('.read-more-venio-body')
        .css('opacity', 1)
        .slideUp('fast', () -> 
          $('.read-more-venio-body').addClass('hidden') 
        )
        .animate({ opacity: 0 },{ queue: false, duration: 'fast' })
      $('.read-more-venio').html("Read More")

  renderMoreMurphee: (event) =>
    if $('.read-more-murphee-body').hasClass("hidden")
      $('.read-more-murphee-body')
        .removeClass("hidden")
        .hide()
        .css('opacity', 0)
        .slideDown('fast')
        .animate({ opacity: 1 },{ queue: false, duration: 'fast' })
      $('.read-more-murphee').html("Less")
    else
      $('.read-more-murphee-body')
        .css('opacity', 1)
        .slideUp('fast', () -> 
          $('.read-more-murphee-body').addClass('hidden') 
        )
        .animate({ opacity: 0 },{ queue: false, duration: 'fast' })
      $('.read-more-murphee').html("Read More") 

