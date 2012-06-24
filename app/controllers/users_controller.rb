class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show

    @user = User.find(current_user[:id])
   
  end
  
end

