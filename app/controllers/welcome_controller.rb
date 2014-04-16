class WelcomeController < ApplicationController 
  
  def index
    @post = Post.most_recent
    render template: "posts/show"
  end

  def about
  end

end
