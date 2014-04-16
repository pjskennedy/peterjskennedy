class App.Models.AdminPost extends Backbone.Model

  urlRoot: "/admins/posts"

  preview: (url, success, error) ->
    $.ajax({
      url: url,
      type: "POST",
      data: {post: @attributes},
      success: success,
      error: error
    });