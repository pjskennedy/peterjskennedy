class Admins::PhotosController < AdminsController
  def create
    
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html {
          render :json => [@photo.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@photo.to_jq_upload]}, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post.photos.map{|vp| vp.to_jq_upload } }
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to admins_posts_path }
      format.json { head :no_content }
    end
  end
end