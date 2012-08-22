class EmailController < ApplicationController
  respond_to :json

  def create
    ContactMailer.email_peter(params[:email][:address], params[:email][:name], params[:email][:body])
    respond_with Email.create(params[:email])
  end
end
