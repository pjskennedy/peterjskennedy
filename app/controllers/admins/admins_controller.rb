class Admins::AdminsController < AdminsController

  def index
    @approved = Admin.approved.sort_by{|i| i.updated_at}.reverse
    @denied = Admin.denied.sort_by{|i| i.updated_at}.reverse
  end

  def update

    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params["admin"])
      flash[:info] = "Successfully edited Admin \"#{@admin.email}\""
      redirect_to admins_admins_path
    else
      flash[:danger] = "Something went wrong"
      render action: "index"
    end

  end

  def destroy
    @admin = Admin.find(params[:id])
    email = @admin.email
    if @admin.destroy
      flash[:success] = "Admin \"#{email}\" successfully destroyed"
      redirect_to admin_path
    else
      flash[:danger] = "Something went wrong"
      render action: "index"
    end
  end

end
