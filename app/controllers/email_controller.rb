class EmailController < ApplicationController

  respond_to :json

  def create
    @email = Email.create(params[:email])

    if @email.update_attributes(params[:data])
      ContactMailer.email_peter(params[:email][:address], params[:email][:name], params[:email][:body])
      render :json => @email.to_json, :status => :ok, :layout => nil
    else
      render :json => {:errors => @email.errors}
    end
  end
end
