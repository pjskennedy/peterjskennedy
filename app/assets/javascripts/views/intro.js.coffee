class Personal.Views.Intro extends Backbone.View

  template:      JST['intro']

  render: () ->
    # @renderTweets()
    $(@el).html(@template())
    this

  # renderTweets: () =>
  #   $.getJSON('http://twitter.com/statuses/user_timeline.json?screen_name=peterjskennedy&count=10&callback=?', (data) -> (
  #     for tweet in data
  #       if tweet.text.indexOf("@") == -1
  #         view = new Personal.Views.Tweet()
  #         $("#twitter-container").append(view.render( {date: moment(tweet.created_at).format('MMM Do YYYY, h:mm:ss a'), text: tweet.text} ).el)
  #     $("#twitter-container").masonry({
  #       itemSelector : '.tweet',
  #       columnWidth : 320,
  #     })
  #     )
  #   )


