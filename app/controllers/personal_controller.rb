class PersonalController < ApplicationController
  # GET /personals
  # GET /personals.json

  def index
    render :json => Todo.all
  end
end
