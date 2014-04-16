class PostsController < ApplicationController

  def show
    @post = Post.published_post(params[:id])
  end

  def index
    @posts = Post.published
  end

end
