class Admins::PostsController < AdminsController

  def preview_body
    render_to_body(template: "posts/show").html_safe
  end

  def preview
    @post = Post.new(params["post"])
    body = preview_body
    respond_to do |format|
      format.json { render :json => {body: body}.to_json, :layout => false }
      # format.html { render :json => {response: compiled_html}.to_json }
    end
  end

  def index
    @posts = Post.all.sort_by{|i| i.updated_at}.reverse
  end

  def create
    @post = Post.new(params["post"])
  
    if @post.save(:validate => false)
      flash[:success] = "Successfully created Post \"#{@post.id}\""
      redirect_to admins_posts_path
    else
      render action: "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @template = preview_body
  end

  def update
    @post = Post.find(params[:id])
    
    lat  = @post.latitude
    long = @post.longitude
    
    requires_validation = @post.is_public or params["post"].has_key?("is_public")
    @post.attributes = params["post"]
    if @post.save(:validate => requires_validation)
      respond_to do |format|
        format.html do
          flash[:info] = "Successfully edited Post \"#{@post.title}\""
          redirect_to admins_post_path(@post)
        end
        format.json{render json: @post}
      end
    else
      if @post.errors.messages.keys.include? :longitude or @post.errors.messages.keys.include? :latitude
        flash[:warning] = "You entered invalid coordinates, we put the originals back in"
        @post.latitude = lat
        @post.longitude = long
      end
      respond_to do |format|
        format.html{render action: "edit"}
        format.json{render json: @post.errors.full_messages.to_json, status: 400}
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Post successfully destroyed"
      redirect_to admins_posts_path
    else
      flash[:danger] = "Something went wrong"
      render action: "show"
    end
  end

end
